Category.create!(name: "All products", parent_id: 0)

10.times do |n|
  name = "Category-#{n+1}"
  parent_id = rand(0..n-1)
  picture = "chua-chuc-thanh-7"
  Category.create!(name: name, parent_id: parent_id)
end

User.create!(name: "Nguyen Chanh Huan", email: "admin@gmail.com", address: "DN",
  phone: "0123456789", password: "111111", password_confirmation: "111111", role: 1)

User.create!(name: "client", email: "client@gmail.com", address: "DN",
  phone: "0123456789", password: "111111", password_confirmation: "111111", role: 0)

5.times do |n|
  name = "example user"
  email = "example#{n+1}@gmail.com"
  address = "DN"
  phone = "0123456789"
  password = "111111"
  User.create!(name: name, email: email, address: address, phone: phone, password: password,
    password_confirmation: password)
end
