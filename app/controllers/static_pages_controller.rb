class StaticPagesController < ApplicationController
  def index
    @articles = Article.where.not(status: '0')

  end
end
