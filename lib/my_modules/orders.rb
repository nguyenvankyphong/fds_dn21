module MyModules
  module Orders
    def load_total_cost order
      order.order_products.reduce(0) do |a, e|
        a + e[:quantity] * e[:price]
      end
    end
  end
end
