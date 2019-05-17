module MyModules
  module Carts
    def load_added_qty current_quantity, addition_quantity
      current_quantity.to_i + addition_quantity.to_i
    end

    def load_remain_qty minuend, subtrahend
      minuend - subtrahend.to_i
    end
  end
end
