# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Recipe.delete_all

user = User.create(email: "test@test.com", password: "asdfasdf", password_confirmation: "asdfasdf")

admin = AdminUser.create(email: "admin@test.com", password: "asdfasdf", password_confirmation: "asdfasdf", type: "AdminUser")

recipe1 = Recipe.create!(title: "How to Brew Coffee in an AeroPress",
                     description: "Learn how to brew your best in an AeroPress when you're on the road. This is a real time video so you can let us be your guide and brew alongside our best baristas. Happy brewing!",
                     youtube_id:"pmjPjZZRhNQ",
                    user_id: user.id)

recipe1.set_tag_list_on(:beverages, "Americano")
recipe1.set_tag_list_on(:techniques, "Traditional")
recipe1.save


recipe2 = Recipe.create!(title: "Aeropress Perfection",
                     description: "This recipe will yield a very concentrated shot of coffee, good for a long mac or strong latte.",
                     youtube_id: "PMqjk2jZ4AE",
                    user_id: user.id)

 recipe2.set_tag_list_on(:beverages, "Long Macchiato, Latte")
 recipe2.set_tag_list_on(:techniques, "Inverted")
 recipe2.save


recipe3 = Recipe.create!(title: "How to make the best coffee with the Aeropress - Inverted Method",
                     description: "This is a method of brewing aeropress when you're using the inverted method method by Dave Cheung.",
                     youtube_id: "kQ8wvUKa35E",
                    user_id: user.id)

recipe3.set_tag_list_on(:beverages, "Americano")
recipe3.set_tag_list_on(:techniques, "Inverted")
recipe3.save
