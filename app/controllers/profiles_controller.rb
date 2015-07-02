class ProfilesController < ApplicationController
  before_filter :authenticate_user!, except: [:show]
  before_filter :set_profile, only: [:show]
  
  def index
    if current_user
      @user = User.find(current_user.id)
    else
      redirect_to new_user_session_path, notice: "You need to login."
    end
  end
  
  def show
  end
  
  private
  
  def set_profile
    @user = User.find(params[:id])
  end
end
