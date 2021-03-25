class ProfilesController < ApplicationController
  def index
    if @profile = Profile.first
      @profile
    else
      render 'errors/error_404'
    end
  end
end
