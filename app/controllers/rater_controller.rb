class RaterController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :verify_authenticity_token

  def create
    if user_signed_in?
      params[:remote] = true
      obj = params[:klass].classify.constantize.find(params[:id])
      obj.rate params[:score].to_f, current_user, params[:dimension]

      respond_to do |format|
        format.html{redirect_to products_path(params[:id])}
        format.js
      end
    else
      render :json => false
    end
  end
end
