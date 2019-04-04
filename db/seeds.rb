Category.create!(name: "All products", parent_id: 0)

10.times do |n|
  name = "Category-#{n+1}"
  parent_id = rand(0..n-1)
  picture = "chua-chuc-thanh-7"
  Category.create!(name: name, parent_id: parent_id)
end
