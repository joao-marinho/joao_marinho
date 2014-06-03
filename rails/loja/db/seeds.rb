# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Category.delete_all

Category.create!(title: 'Legal', description: 'Grupo das pessoas legais.');
Category.create!(title: 'Chatos', description: 'Grupo das pessoas chatas.');

Product.delete_all

Product.create!(title: 'Coisa',
  description: 'Item fundamental para humanidade.',
  image_url: 'http://www.soqueriaentender.com.br/wp-content/uploads/2011/08/coisa.jpg',
  price: 1.99)

Product.create!(title: 'Cobol',
  description: 'Linguagem do passado, presente e futuro.',
  image_url: 'http://www.novidadesdeinformatica.com.br/wp-content/uploads/2011/04/Cobol.gif',
  price: 1999999.99)
