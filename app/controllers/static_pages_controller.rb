class StaticPagesController < ApplicationController
  require 'csv'
  def index
    contents = []
    CSV.foreach("#{Rails.root}/app/controllers/test.csv") do |row|
      (0..10).each {|n|
        contents.push(row)
      }
    end
    @contents = contents

  end
end
