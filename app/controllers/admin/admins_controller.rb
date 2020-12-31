class Admin::AdminsController < ApplicationController
  before_action :logged_in_user, only: [:show, :update, :destroy]

  def show
    @admin = User.find(params[:id])
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
