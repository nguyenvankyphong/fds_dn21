module Admin::CategoriesHelper
  def load_categories categories
    categories_array = []
    categories.each do |c|
      categories_array.push([c.name, c.id])
    end
    categories_array
  end
end
