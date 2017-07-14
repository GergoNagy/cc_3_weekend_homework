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

end