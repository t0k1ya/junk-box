class StaticPagesController < ApplicationController
  def index
    @articles = Article.where.not(status: '0', is_deleted: true)
    @admin = current_user
  end
end
