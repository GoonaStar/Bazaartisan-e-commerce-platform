# Cleaning database except User

# User.delete_all
Category.delete_all
Item.delete_all
Order.delete_all
User.delete_all

    # Create instances of model User
30.times do 
    User.create(
        email: Faker::Internet.email, 
        password: "123456", 
        first_name: Faker::Name.first_name, 
        last_name: Faker::Name.last_name,
        delivery_street: Faker::Address.street_address, 
        delivery_street2: Faker::Address.secondary_address,
        delivery_city: Faker::Address.city, 
        company_name: Faker::Company.name,
        company_description:Faker::StarWars.quote
        )
        
    Cart.create(buyer_id: User.last.id)
end

    # Create 6 categories

Category.create!(category_name: "Wood")
Category.create!(category_name: "Paper")
Category.create!(category_name: "Cloth")
Category.create!(category_name: "Leather")
Category.create!(category_name: "Hessian")
Category.create!(category_name: "Other")
 

    # Possible item and order status

item_status = ["draft", "published", "sold", "deleted"]
order_status = ["paid", "being_shipped", "shipped"]

    # Create instances of model Item category bois

30.times do
    # Create instances 
    item = Item.create!(
        title: "Wooden offcuts - " + rand(1..15).to_s + "kg", 
        description: Faker::Lorem.paragraph, 
        price: rand(1..50), 
        status: item_status[rand(0..3)], 
        category_id: Category.last.id-5, 
        seller_id: rand(User.first.id..User.last.id),
        Faker_image: "wood"+rand(1..5).to_s+".jpg"
        )


    # Create order if item sold
    if Item.last.status == "sold"
        Order.create!(
            buyer_id: rand(User.first.id..User.last.id),
            price: Item.last.price,
            status: order_status[rand(0..2)],
            delivery_entity: Faker::Name.name,
            delivery_street: Faker::Address.street_address,
            delivery_street2: Faker::Address.secondary_address,
            delivery_postcode: Faker::Address.postcode,
            delivery_city: Faker::Address.city,
            delivery_country: Faker::Address.country,
            delivery_instructions: Faker::StarWars.quote,
            invoice_entity: Faker::Name.name,
            invoice_street: Faker::Address.street_address,
            invoice_street2: "",
            invoice_postcode: Faker::Address.postcode,
            invoice_city: Faker::Address.city,
            invoice_country: Faker::Address.country
            )
        item.order_id = Order.last.id
        item.save
    end
end

    # Create instances of model Item category papier

30.times do
    # Create instances 
    item = Item.create!(
        title: "Paper " + Faker::Color.color_name, 
        description: Faker::Lorem.paragraph, 
        price: rand(1..50), 
        status: item_status[rand(0..3)], 
        category_id: Category.last.id-4, 
        seller_id: rand(User.first.id..User.last.id),
        Faker_image: "paper"+rand(1..10).to_s+".jpg"
        )


    # Create order if item sold
    if Item.last.status == "sold"
        Order.create!(
            buyer_id: rand(User.first.id..User.last.id),
            price: Item.last.price,
            status: order_status[rand(0..2)],
            delivery_entity: Faker::Name.name,
            delivery_street: Faker::Address.street_address,
            delivery_street2: Faker::Address.secondary_address,
            delivery_postcode: Faker::Address.postcode,
            delivery_city: Faker::Address.city,
            delivery_country: Faker::Address.country,
            delivery_instructions: Faker::StarWars.quote,
            invoice_entity: Faker::Name.name,
            invoice_street: Faker::Address.street_address,
            invoice_street2: "",
            invoice_postcode: Faker::Address.postcode,
            invoice_city: Faker::Address.city,
            invoice_country: Faker::Address.country
            )
        item.order_id = Order.last.id
        item.save
    end
end

    # Create instances of model Item category tissu

30.times do
    # Create instances 
    item = Item.create!(
        title: Faker::Number.number(2) + " pieces of cloth " + Faker::Color.color_name, 
        description: Faker::Lorem.paragraph, 
        price: rand(1..50), 
        status: item_status[rand(0..3)], 
        category_id: Category.last.id-3, 
        seller_id: rand(User.first.id..User.last.id),
        Faker_image: "cloth"+rand(1..7).to_s+".jpg"
        )


    # Create order if item sold
    if Item.last.status == "sold"
        Order.create!(
            buyer_id: rand(User.first.id..User.last.id),
            price: Item.last.price,
            status: order_status[rand(0..2)],
            delivery_entity: Faker::Name.name,
            delivery_street: Faker::Address.street_address,
            delivery_street2: Faker::Address.secondary_address,
            delivery_postcode: Faker::Address.postcode,
            delivery_city: Faker::Address.city,
            delivery_country: Faker::Address.country,
            delivery_instructions: Faker::StarWars.quote,
            invoice_entity: Faker::Name.name,
            invoice_street: Faker::Address.street_address,
            invoice_street2: "",
            invoice_postcode: Faker::Address.postcode,
            invoice_city: Faker::Address.city,
            invoice_country: Faker::Address.country
            )
        item.order_id = Order.last.id
        item.save
    end
end

    # Create instances of model Item category cuir

30.times do
    # Create instances 
    item = Item.create!(
        title: Faker::Number.decimal(1, 1) + "kg of leather (offcuts)", 
        description: Faker::Lorem.paragraph, 
        price: rand(1..50), 
        status: item_status[rand(0..3)], 
        category_id: Category.last.id-2, 
        seller_id: rand(User.first.id..User.last.id),
        Faker_image: "leather"+rand(1..7).to_s+".jpg"
        )


    # Create order if item sold
    if Item.last.status == "sold"
        Order.create!(
            buyer_id: rand(User.first.id..User.last.id),
            price: Item.last.price,
            status: order_status[rand(0..2)],
            delivery_entity: Faker::Name.name,
            delivery_street: Faker::Address.street_address,
            delivery_street2: Faker::Address.secondary_address,
            delivery_postcode: Faker::Address.postcode,
            delivery_city: Faker::Address.city,
            delivery_country: Faker::Address.country,
            delivery_instructions: Faker::StarWars.quote,
            invoice_entity: Faker::Name.name,
            invoice_street: Faker::Address.street_address,
            invoice_street2: "",
            invoice_postcode: Faker::Address.postcode,
            invoice_city: Faker::Address.city,
            invoice_country: Faker::Address.country
            )
        item.order_id = Order.last.id
        item.save
    end
end

    # Create instances of model Item category toile de jute

30.times do
    # Create instances 
    item = Item.create!(
        title: "Coffee bags - " + Faker::Coffee.origin, 
        description: Faker::Lorem.paragraph, 
        price: Faker::Number.between(5, 10).to_s.gsub('.', ',').to_f,
        status: item_status[rand(0..3)], 
        category_id: Category.last.id-1, 
        seller_id: rand(User.first.id..User.last.id),
        Faker_image: "hessian"+rand(1..16).to_s+".jpg"
        )


    # Create order if item sold
    if Item.last.status == "sold"
        Order.create!(
            buyer_id: rand(User.first.id..User.last.id),
            price: Item.last.price,
            status: order_status[rand(0..2)],
            delivery_entity: Faker::Name.name,
            delivery_street: Faker::Address.street_address,
            delivery_street2: Faker::Address.secondary_address,
            delivery_postcode: Faker::Address.postcode,
            delivery_city: Faker::Address.city,
            delivery_country: Faker::Address.country,
            delivery_instructions: Faker::StarWars.quote,
            invoice_entity: Faker::Name.name,
            invoice_street: Faker::Address.street_address,
            invoice_street2: "",
            invoice_postcode: Faker::Address.postcode,
            invoice_city: Faker::Address.city,
            invoice_country: Faker::Address.country
            )
        item.order_id = Order.last.id
        item.save
    end
end
