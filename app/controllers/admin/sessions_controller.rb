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
    admin = User.find_by(email: params[:session][:email].downcase)
    puts 'params: ', params[:session][:email]
    if admin&.authenticate(params[:session][:password])
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

  # def user_params
  #   params.required(:session).permit(:email, :password, :password_confirmation)
  # end
end
