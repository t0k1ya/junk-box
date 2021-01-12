class Admin::ArticlesController < ApplicationController
  before_action :logged_in_user

  def index
    @articles = current_user.articles.all
  end

  def new
    @admin = current_user
    @article = Article.new
  end

  def create
    @article = current_user.articles.build(article_params)
    # create_index(@article.content)
    @article.status = '1'
    @article.is_deleted = false
    if @article.save
      flash[:notice] = '記事を保存しました'
      redirect_to admin_path(current_user)
    end
  end

  def draft
  end

  def show
    @article = getAdminArticle
  end

  def edit
    @article = getAdminArticle
  end

  def update
    @article = getAdminArticle
    @article.update(article_params)
    flash[:notice] = '編集を保存しました'
    redirect_to admin_path(current_user) 
  end

  private
    def article_params
      puts 'params: ', params
      params.require(:article).permit(:title, :content)
      #article = current_user.
    end

    def create_index(content)
    end

    def getAdminArticle
      current_user.articles.find(params[:id])
    end
end
