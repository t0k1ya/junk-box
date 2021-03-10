class StaticPagesController < ApplicationController
  def index
    @articles = Article.where.not(status: '0', is_deleted: true)
    @admin = current_user
  end

  def search
    if @keyword = params[:keyword]
      @articles = Article.where('title LIKE ?', "%#{@keyword}%")
      render 'index'
    end
  end
end
