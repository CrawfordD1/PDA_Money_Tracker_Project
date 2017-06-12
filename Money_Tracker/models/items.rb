require_relative '../db/sql_runner.rb'

class Item

  attr_accessor :type, :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @type = options['type']
  end

  def save()
    sql = "INSERT INTO items (type) VALUES ('#{@type}') RETURNING * ;"
    result = SqlRunner.run(sql)
    @id = result[0]['id'].to_i()
  end

  def update(options)
    sql = "UPDATE items SET (type) = (
      '#{options['type']}') 
    WHERE id = #{@id};"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM items WHERE id = #{@id};"
    SqlRunner.run(sql)
  end

  def self.find(id)
    sql = "SELECT * FROM items WHERE id = #{id};"
    options = SqlRunner.run( sql )
    item = Item.new( options.first )
    return item
  end

  def self.all()
    sql =  "SELECT * FROM items;"
    items = SqlRunner.run(sql)
    return items.map { |options| Item.new(options)}
  end

  def self.delete_all()
    sql = "DELETE FROM items;"
    SqlRunner.run(sql)
  end





end


