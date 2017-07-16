require_relative('../models/customer')
require_relative('../models/film')
require_relative('../models/ticket')
require('pry-byebug')

Ticket.delete_all
Customer.delete_all
Film.delete_all

customer1 = Customer.new({'name' => 'Fred', 'funds' => 120})
customer2 = Customer.new({'name' => 'Alan', 'funds' => 50})
customer3 = Customer.new({'name' => 'Gandalf', 'funds' => 90})

film1 = Film.new({'title' => 'Hobbit', 'price' => 7})
film2 = Film.new({'title' => 'Terminator', 'price' => 3})
film3 = Film.new({'title' => 'Cube', 'price' => 9})


customer1.save()
customer2.save()
customer3.save()
customer1.name = "Bob"
customer1.update()
# customer2.delete_customer()
p customer3.find_a_customer

film1.save
film2.save
film3.save
p film3.find_film
film2.title = "Terminator 2"
film2.price = 10
film2.update
# film3.delete_film

ticket1 = Ticket.new({'customer_id' => customer2.id, 'film_id' => film1.id})
ticket2 = Ticket.new({'customer_id' => customer3.id, 'film_id' => film2.id})
ticket3 = Ticket.new({'customer_id' => customer2.id, 'film_id' => film2.id})

ticket1.save
ticket2.save
ticket3.save
p ticket1.find_ticket
# ticket1.delete_ticket

p film1.customers
p customer3.booked_films

p customer3.how_much_tickets

p film2.how_mush_customer

customer3.buy_a_ticket


binding.pry
nil