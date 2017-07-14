require_relative('../models/customer')
require_relative('../models/film')
require_relative('../models/ticket')
require('pry-byebug')

Customer.delete_all

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
customer2.delete_customer()
customer3.find_a_customer

film1.save
film2.save
film3.save

binding.pry
nil