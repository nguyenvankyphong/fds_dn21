module ProductsHelper
  def rate_rounding rate_avg
    a = rate_avg % 1
    if a < 0.25
      return [rate_avg - a, 0, 5 - rate_avg + a]
    elsif a > 0.75
      return [rate_avg - a + 1, 0, 5 - rate_avg + a - 1]
    end
    return [rate_avg - a, 1, 5 - rate_avg + a - 1]
  end
end
