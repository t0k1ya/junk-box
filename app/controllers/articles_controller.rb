class ArticlesController < ApplicationController
  def show
    @article = Article.find(params[:id])
    puts '@article: ', @article.content.to_s.slice(0, 100)
  end
end
