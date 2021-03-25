class ProfilesController < ApplicationController
  def index
    @profile = Profile.first
  end
end
