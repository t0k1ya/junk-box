class Admin::ProfilesController < ApplicationController
  before_action :logged_in_user

  def new
    @profile = current_user.profile || Profile.new
  end

  def create
    if current_user.profile
      update
    else
      profile = Profile.new(required_params)
      profile.status = '1'
      profile.is_deleted = false
      current_user.profile = profile

      if profile.save
        flash[:notice] = 'プロフィールを保存しました'
        redirect_to me_path
      end
    end
  end

  def update
    profile = current_user.profile
    profile.update(required_params)
    flash[:notice] = 'プロフィールを更新しました'
    redirect_to admin_path(current_user)
  end

  private
    def required_params
      params.require(:profile).permit(:title, :content)
    end
end
