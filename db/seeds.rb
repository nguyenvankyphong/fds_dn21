User.create!(name: "Nguyen Chanh Huan", email: "admin@gmail.com",
  password: "111111", password_confirmation: "111111", role: 1)

User.create!(name: "clinet", email: "client@gmail.com",
  password: "111111", password_confirmation: "111111", role: 0)

Category.create!(name: "All products", parent_id: 0)

10.times do |n|
  name = "Category-#{n+1}"
  parent_id = rand(0..n-1)
  picture = "chua-chuc-thanh-7"
  Category.create!(name: name, parent_id: parent_id)
end
