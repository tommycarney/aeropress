# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Recipe.delete_all

recipe1 = Recipe.create!(title: "How to Brew Coffee in an AeroPress",
                     description: "Learn how to brew your best in an AeroPress when you're on the road. This is a real time video so you can let us be your guide and brew alongside our best baristas. Happy brewing!",
                     youtube_id:"pmjPjZZRhNQ")

recipe2 = Recipe.create!(title: "Aeropress Perfection",
                     description: "This recipe will yield a very concentrated shot of coffee, good for a long mac or strong latte.",
                     youtube_id: "PMqjk2jZ4AE")


recipe3 = Recipe.create!(title: "How to make the best coffee with the Aeropress - Inverted Method",
                     description: "This is a method of brewing aeropress when you're using the inverted method method by Dave Cheung.",
                     youtube_id: "kQ8wvUKa35E")
