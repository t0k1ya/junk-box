class Admin::SessionsController < ApplicationController
  before_action :acquaintance?, only: :new

  def index
  end

  def new
    if logged_in?
      flash[:notice] = 'ログイン済みです'
      redirect_to admin_path(current_user)
    end
  end

  def create
    if required_params[:password] != required_params[:password_confirmation]
      flash.now[:alert] = 'パスワードがマッチしません'
      render :new
      return
    end
    
    admin = User.find_by(email: required_params[:email].downcase)
    if admin&.authenticate(required_params[:password])
      log_in admin
      flash[:notice] = 'ログインしました'
      redirect_to admin_url(admin)
    else
      flash.now[:alert] = 'ログイン情報が違います'
      render :new
    end
  end

  def destroy
    log_out
    redirect_to admin_login_path
  end

  def required_params
    params.required(:session).permit(:email, :password, :password_confirmation)
  end
end
