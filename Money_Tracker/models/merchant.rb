require_relative '../db/sql_runner.rb'

class Merchant 

  attr_reader :name, :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO merchants (name) VALUES ('#{@name}') RETURNING * ;"
    result = SqlRunner.run(sql)
    @id = result[0]['id'].to_i()
  end

  def update(options)
    sql = "UPDATE merchants SET (name) = (
      '#{options['name']}') 
    WHERE id = #{@id};"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM merchants WHERE id = #{@id};"
    SqlRunner.run(sql)
  end

  def self.find(id)
    sql = "SELECT * FROM merchants WHERE id = #{id};"
    options = SqlRunner.run( sql )
    merchant = Merchant.new( options.first )
    return merchant
  end

  def self.all()
    sql =  "SELECT * FROM merchants;"
    merchants = SqlRunner.run(sql)
    return merchants.map { |options| Merchant.new(options)}

  end

  def self.delete_all()
    sql = "DELETE FROM merchants;"
    SqlRunner.run(sql)
  end





end


