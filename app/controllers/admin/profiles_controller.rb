class Admin::ProfilesController < ApplicationController

  def new
    @admin = current_user
    @profile = Profile.new
  end
end
