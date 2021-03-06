require_relative '../db/sql_runner.rb'
require 'date'

class Transaction 

  attr_reader :id, :amount, :purchase_date, :merchant_id, :item_id
  

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @amount = options['amount'].to_i
    @purchase_date = options['purchase_date']
    @merchant_id = options['merchant_id'].to_i
    @item_id = options['item_id'].to_i
  end

  def save()
    sql = "INSERT INTO transactions (amount, purchase_date, merchant_id, item_id) VALUES (#{@amount}, '#{@purchase_date}', #{@merchant_id}, #{@item_id}) RETURNING * ;"
    result = SqlRunner.run(sql)
    @id = result[0]['id'].to_i()
  end

  def pretty_purchase_date()
  return DateTime.parse(@purchase_date).strftime("%d/%m/%Y")
  end


  def self.find_by_month(month)
    sql =  "SELECT * FROM transactions WHERE EXTRACT(MONTH FROM purchase_date) = #{month};"
    transactions = SqlRunner.run(sql)
    return transactions.map { |options| Transaction.new(options)}
  end

  def update(options)
    sql = "UPDATE transactions SET (amount, purchase_date, merchant_id, item_id) = 
    (#{options['amount']}, 
    '#{options['purchase_date']}',
    #{options['merchant_id']}, 
    #{options['item_id']}) 
    WHERE id = #{@id};"
    SqlRunner.run(sql)
  end

 def merchant
  sql = "SELECT * FROM merchants AS m
  INNER JOIN transactions AS t
  ON t.merchant_id = m.id
  WHERE m.id = #{@merchant_id}"
  results = SqlRunner.run( sql )
  return Merchant.new( results.first )
end

def item
  sql = "SELECT * FROM items AS i
  INNER JOIN transactions AS t
  ON t.item_id = i.id
  WHERE i.id = #{@item_id}"
  results = SqlRunner.run( sql )
  return Item.new( results.first )
end

def item_total
  sql = "SELECT t.amount FROM items AS i
  INNER JOIN transactions AS t
  ON t.item_id = i.id
  WHERE i.id = #{@item_id}"
  results = SqlRunner.run( sql )
  total_spent = 0
  results.map {|result| total_spent += result['amount'].to_i}
  return total_spent
end

def item_total_month(month)
  sql = "SELECT t.amount FROM items AS i
  INNER JOIN transactions AS t
  ON t.item_id = i.id
  WHERE i.id = #{@item_id} AND EXTRACT(MONTH FROM purchase_date) = #{month};"
  results = SqlRunner.run( sql )
  total_spent = 0
  results.map {|result| total_spent += result['amount'].to_i}
  return total_spent
end



def delete()
  sql = "DELETE FROM transactions WHERE id = #{@id};"
  SqlRunner.run(sql)
end

def self.find(id)
  sql = "SELECT * FROM transactions WHERE id = #{id};"
  options = SqlRunner.run( sql )
  transaction = Transaction.new( options.first )
  return transaction
end

def self.all()
  sql =  "SELECT * FROM transactions;"
  transactions = SqlRunner.run(sql)
  return transactions.map { |options| Transaction.new(options)}
end

def self.delete_all()
  sql = "DELETE FROM transactions;"
  SqlRunner.run(sql)
end


end


