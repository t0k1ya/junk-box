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
    @article = Article.find(params[:id])
  end

  def edit
  end

  def update
  end

  private
    def article_params
      params.require(:article).permit(:title, :content)
    end

    def create_index(content)
      puts 'content: ', content.to_s
    end
end
