class RegistrationsController < Devise::RegistrationsController
  before_action :authenticate_user!
  def create
    super
  end
end
