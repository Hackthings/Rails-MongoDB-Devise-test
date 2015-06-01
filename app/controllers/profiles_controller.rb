class ProfilesController < ApplicationController
  before_filter :authenticate_user!, except: [:show]
  def index
    if current_user
      @user = current_user.id
    else
      redirect_to new_user_session_path, notice: "You need to login."
    end
  end
  def show
    @user = User.find(params[:id])
  end
end
