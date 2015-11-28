require 'faker'

$stdout.sync = true

namespace :db do
  task populate: :environment do

    print "\nCreate users"
    ActiveRecord::Base.transaction do
      100.times do
        User.create password: 'password1234',
          password_confirmation: 'password1234',
          email: Faker::Internet.email,
          first_name: Faker::Name.first_name,
          last_name: Faker::Name.last_name
        print '.'
      end
    end


    users = User.all

    print "\nCreate Products" 
    50.times do
      Product.create title: Faker::Lorem.sentence,
        description: Faker::Lorem.paragraph(3),
        price: rand( 10000 ),
        stock: rand(100)
        #product_picture 
      print '.'
    end
    
    products = Product.all

    print "\nCreate Categories"
    20.times do 
      Category.create title: Faker::Lorem.word
      print '.'
    end

    categories = Category.all

    print "\nCreate Review"
    200.times do 
      Review.create title: Faker::Lorem.word,
        user: users.sample,
        product: products.sample,        
        description: Faker::Lorem.paragraph 
        print '.'
    end


    print "\nCreate categorization"
    50.times do
      p =  products.sample
      p.categories << categories.sample(4)
      print '.'
    end

    print "\nCreate Admin"
    email = 'admin@admin.com'
    password = 'admin1234'
    AdminUser.create email: email, password: password, password_confirmation: password
    print "\nEmail: #{email}"
    print "\nPassword: #{password}"
  end
end
