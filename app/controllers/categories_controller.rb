class CategoriesController < ApplicationController

  def show
    if tag = Category.find_by(name: params[:id])
      @articles = tag.articles
      @tag_name = view_context.show_tag(tag.name)
    end
      render 'static_pages/index'
  end
  
end
