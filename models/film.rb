require_relative('../db/sql_runner')

class Film

  attr_accessor :title, :price
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i
    @title = options['title']
    @price = options['price'].to_i
  end

  def save()
    sql = "INSERT INTO films (title, price) VALUES
        ('#{@title}', #{@price}) 
        RETURNING id"
    films = SqlRunner.run(sql).first
    @id = films['id'].to_i
  end

  def find_film()
    sql = "SELECT * FROM films WHERE id = #{id}"
    films = SqlRunner.run(sql)
    return films.map{|film| Film.new(film)}
  end

  def update()
    sql = "UPDATE films SET title = '#{@title}', price = #{price} WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

  def delete_film()
    sql = "DELETE FROM films WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

  def customers()
    sql = "SELECT customers.* FROM customers
        INNER JOIN tickets ON tickets.customer_id = customers.id
        WHERE film_id = #{@id}"
    customers = SqlRunner.run(sql)
    result = customers.map{|customer| Customer.new(customer)}
    return result
  end



  def self.delete_all
    sql = "DELETE FROM films"
    SqlRunner.run(sql)
  end

end