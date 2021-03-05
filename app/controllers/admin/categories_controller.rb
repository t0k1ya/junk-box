class Admin::CategoriesController < ApplicationController

  def index
  end

  def new
    @category_all = Category.all
    @category = Category.new
  end

  def create
    tag = params[:category][:name]
    already_exists = Category.find_by(name: tag)
    if already_exists
      flash[:alert] = '既に存在しています'
      redirect_to new_admin_category_path
      return
    end
    @category = Category.new(name: tag)
    if @category.save
      flash[:notice] = "新しく#{tag}をタグに追加しました"
      redirect_to new_admin_category_path
    end
  end

  def show
  end

  def destroy
    tag = params[:id]
    @tag = Category.where(name: tag).destroy_all
    flash[:notice] = "タグ\"#{tag}\"を削除しました"
    redirect_to new_admin_category_path

  end
end
