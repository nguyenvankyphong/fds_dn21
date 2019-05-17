module Admin::OrdersHelper
  include MyModules::Orders
  def render_status order
    render "status", order: order
  end

  def render_update_status order
    render "update_status", order: order
  end

  def render_status_label order
    case Order.statuses[order.status]
    when Settings.order_status_ready
      Settings.order_ready_label
    when Settings.order_status_accepted
      Settings.order_accepted_label
    when Settings.order_status_delivering
      Settings.order_delivering_label
    when Settings.order_status_delivered
      Settings.order_delivered_label
    end
  end
end
