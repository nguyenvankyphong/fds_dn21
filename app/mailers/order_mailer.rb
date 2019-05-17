class OrderMailer < ApplicationMailer
  include MyModules::Orders
  default from: "notifications@example.com"

  def new_order admin, user, order
    @user = user
    @order = order
    @admin = admin
    @total = load_total_cost order
    mail to: admin.email, subject: "#{t 'order.mailer.subject'} #{@user.name}"
  end
end
