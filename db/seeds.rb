# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
ComfortInterior.create([{ title: 'BlueTooth'},{ title: 'CD Player'},{ title: 'Central Locking'},{ title: 'Cruise Control'},{ title: 'Heated Seats'},{ title: 'Electric Seat Adjustment'},{ title: 'Electric Side Mirror'},{ title: 'Electric Windows'},{ title: 'Navigation System'},{ title: 'On Board Computer'},{ title: 'Power Assisted Steering'},{ title: 'Sunroof'},{ title: 'Parking sensors'},{ title: 'Parking Camera'},{ title: 'Panoramic Roof'}])
SafetyFeature.create([{title:'ABS'},{title:'ESP'},{title:'4 Wheel Drive'},{title:'Traction Control'}])
Color.create([{title: 'White'}, {title: 'Black'}, {title: 'Silver'}, {title: 'Red'}, {title: 'Blue'}, {title: 'Yellow'}, {title: 'Gray'}, {title: 'Green'}, {title: 'Brown'}, {title: 'Light Blue'}, {title: 'Oil Green'}, {title: 'Navi Blue'}, {title: 'Light Green'}, {title: 'Maroon'}, {title: 'Purple'}, {title: 'Pink'}, {title: "Other"}])
InteriorDesign.create([{title: 'Leather'}, {title: 'Cloth'}, {title: 'Part Leather'}, {title: 'Other'}])
InteriorColor.create([{title: 'Black'}, {title: 'Beige'}, {title: 'White'}, {title: 'Gray'}, {title: 'Red'}, {title: 'Other'}])