# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

roles = Role.create([{ name: 'Admin' }, { name: 'Manager' }, { name: 'Analyst'}, { name: 'Client'} ])
User.create( name: 'Admin', email: 'admin@serviceorder.com', password: 'Admin', role_id: 1)
