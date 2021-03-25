class StaticPagesController < ApplicationController
  def index
    @articles = Article.where.not(status: '0', is_deleted: true)
      .order(created_at: 'DESC').page(params[:page]).per(10)
    @admin = current_user
  end

  def search
    if @keyword = params[:keyword]
      @articles = Article.where.not(status: '0', is_deleted: true)
        .where('title LIKE ?', "%#{@keyword}%")
        .order(created_at: 'DESC').page(params[:page]).per(10)
      @searched = true
      render 'index'
    end
  end
end
