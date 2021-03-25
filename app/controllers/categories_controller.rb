class CategoriesController < ApplicationController
  include Admin::AdminsHelper
  
  def show
    if tag = Category.find_by(name: params[:name])
      @articles = tag.articles.order(created_at: 'DESC').page(params[:page]).per(10)
      @tag_name = show_tag(tag.name)
    end
      render 'static_pages/index'
  end

end
