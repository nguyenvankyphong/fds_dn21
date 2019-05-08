class SessionsController < Devise::SessionsController
  before_action :authenticate_user!

  def create
    @referer_url = products_path
    super
  end
end
