class CategoriesController < ApplicationController

  def show
    @articles = Article.where.not(status: '0', is_deleted: true)
    tag = params[:id]
    
    render 'static_pages/index'
  end
end
