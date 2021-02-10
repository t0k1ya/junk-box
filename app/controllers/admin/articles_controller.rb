class Admin::ArticlesController < ApplicationController
  before_action :logged_in_user
  skip_before_action :verify_authenticity_token, only: :draft

  def index
    @articles = current_user.articles.all
  end

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
    @article = current_user.articles.build(article_params)
    @article.status = '0'
    @article.is_deleted = false
    if @article.save
      flash[:notice] = '記事を下書き保存しました'
    else
      flash[:alert] = '下書き保存失敗です'
    end
    redirect_to admin_path(current_user)
  end

  def show
    @article = getAdminArticle
  end

  def edit
    @article = getAdminArticle
  end

  def update
    @article = getAdminArticle
    if (params[:status_to] == '0')
      @article.status = '0'
      if @article.save
        flash[:notice] = '下書きに戻しました'
      end
    elsif (params[:status_to] == '1')
      @article.status = '1'
      if @article.save
        flash[:notice] = '公開しました'
      end
    else
      @article.update(article_params)
      flash[:notice] = '編集を保存しました'
    end
    redirect_to admin_path(current_user) 
  end

  def destroy
    @article = current_user.articles.destroy(params[:id])
    flash[:notice] = '記事を削除しました'
    redirect_to admin_path(current_user)
  end

  private
    def article_params
      puts 'what is in: ', params['category_id']
      params.require(:article).permit(:title, :content, :category_id)
    end

    def create_index(content)
    end

    def getAdminArticle
      current_user.articles.find(params[:id])
    end
end
