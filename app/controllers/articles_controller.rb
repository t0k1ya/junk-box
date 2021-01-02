class ArticlesController < ApplicationController
  require 'csv'
  def show
    contents = []
    CSV.foreach("#{Rails.root}/app/controllers/test.csv") do |row|
      contents.push(row)
    end
    @contents = contents[0]
  end
end
