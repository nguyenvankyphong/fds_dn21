module MyModules
  module Rates
    def load_everage product
      sum = product.rates.reduce(0){|a, e| a + e.rate}
      count = 0
      count = sum.to_f / product.rates.size if sum != 0
      t "rating.show_status", count: count, standard: Settings.rate_standard
    end
  end
end
