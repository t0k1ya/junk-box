class Admin::SessionsController < ApplicationController
  def index
  end

  def new
  end

  def create
    admin = User.find_by(email: params[:session][:email].downcase)
    if admin&.authenticate(params[:session][:password])
      log_in admin
      flash[:notice] = 'ログインしました'
      redirect_to admin_url(admin)
    else
      flash.now[:alert] = 'ログイン情報が違います'
      render :new
    end
  end

end
