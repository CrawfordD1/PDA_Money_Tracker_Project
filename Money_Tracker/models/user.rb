require_relative '../db/sql_runner.rb'

class User 

  attr_reader :name, :id
  attr_accessor :balance

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @balance = options['balance']
  end

  def save()
    sql = "INSERT INTO users (name, balance) VALUES ('#{@name}', #{@balance}) RETURNING * ;"
    result = SqlRunner.run(sql)
    @id = result[0]['id'].to_i()
  end

  def update(options)
    sql = "UPDATE users SET (name, balance) = (
      '#{options['name']}',
      '#{options['balance']}') 
    WHERE id = #{@id};"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM users WHERE id = #{@id};"
    SqlRunner.run(sql)
  end

  def self.find(id)
    sql = "SELECT * FROM users WHERE id = '#{id}';"
    options = SqlRunner.run( sql )
    user = User.new( options.first )
    return user
  end

  def self.all()
    sql =  "SELECT * FROM users;"
    users = SqlRunner.run(sql)
    return users.map { |options| User.new(options)}

  end

  def self.delete_all()
    sql = "DELETE FROM users;"
    SqlRunner.run(sql)
  end





end


