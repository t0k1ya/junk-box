class CategoriesController < ApplicationController
  include Admin::AdminsHelper
  
  def show
    if tag = Category.find_by(name: params[:id])
      @articles = tag.articles
      @tag_name = show_tag(tag.name)
    end
      render 'static_pages/index'
  end

end
