class Admin::AdminsController < ApplicationController
  before_action :logged_in_user

  def show
    @admin = User.find(params[:id])
    @articles = @admin.articles.all
  end

  def new
  end

  def create
  end

  def update
  end

  def destroy
  end
end
