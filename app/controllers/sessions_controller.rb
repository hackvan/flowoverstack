class SessionsController < ApplicationController
  before_action :authenticate_user!, only: [:destroy]

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      # redirect_back(fallback_location: root_path)
      redirect_to root_path
    else
      flash.now[:danger] = t(:login_failed, scope: :custom)
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
