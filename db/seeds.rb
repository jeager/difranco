# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

products = ["Camiseta P", "Camiseta M", "Camiseta G", "Caneca", "Regata P", "Regata M", "Regata G", "Folha A4", "Folha A5"]

products.each do |p|
	Product.create(name: p, cost_value: 5, sale_value: 10, quantity_in_stock: 100)
end