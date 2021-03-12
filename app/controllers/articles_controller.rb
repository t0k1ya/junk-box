class ArticlesController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_404

  def show
    article = Article.find(params[:id])
    if article&.status == '1'
      @article = article
    else
      render_404
    end
  end
end
