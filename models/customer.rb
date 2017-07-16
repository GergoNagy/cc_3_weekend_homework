require('pg')
require_relative('../db/sql_runner')
require_relative('./film')
require_relative('./ticket')

class Customer

  attr_accessor :name, :funds
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @funds = options['funds'].to_i
  end

  def save()
    sql = "INSERT INTO customers (name, funds) 
          VALUES ('#{@name}', #{@funds})
          RETURNING id"
    customer = SqlRunner.run(sql).first
    @id = customer['id'].to_i
  end

  def update()
    sql = "UPDATE customers SET name = '#{@name}', funds = #{funds} WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

  def find_a_customer()
    sql = "SELECT customers.name, customers.funds 
        FROM customers WHERE id = #{id}"
    customers = SqlRunner.run(sql)
    return customers.map{|customer| Customer.new(customer)}
  end

  def delete_customer()
    sql = "DELETE FROM customers WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

  def booked_films()
    sql = "SELECT films.* FROM films
        INNER JOIN tickets ON tickets.film_id = films.id
        WHERE customer_id = #{@id}"
    films = SqlRunner.run(sql)
    result = films.map {|film| Film.new(film)}
    return result
  end

  def self.delete_all()
    sql = "DELETE FROM customers"
    SqlRunner.run(sql)
  end


end