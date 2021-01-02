class StaticPagesController < ApplicationController
  require 'csv'
  def index
    contents = []
    CSV.foreach("#{Rails.root}/app/controllers/test.csv") do |row|
      contents.push(row)
      (0..10).each {|n|
        contents.push(row)
      }
    end
    @contents = contents

  end
end
