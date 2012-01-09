# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
facebook_service = Service.new({
  name: 'facebook',
  website: 'http://facebook.com',
  prority: '',
  interval: ''
})
facebook_service.save

googleplus_service = Service.new({
  name: 'googleplus',
  website: 'http://plus.google.com/',
  priority: '',
  interval: ''
})
googleplus_service.save
