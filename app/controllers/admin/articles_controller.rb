class Admin::ArticlesController < ApplicationController
  before_action :logged_in_user, only: [:new, :create, :draft]

  def new
    @admin = current_user
    @article = Article.new
  end

  def create
    @article = current_user.articles.build(article_params)
    @article.status = '1'
    @article.is_deleted = false
    if @article.save
      flash[:notice] = '記事を保存しました'
      redirect_to admin_path(current_user)
    end
  end

  def draft
  end

  private
    def article_params
      puts 'params: ', params
      params.require(:article).permit(:title, :content)
    end
end
