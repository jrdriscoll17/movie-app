class UsersController < ApplicationController
  skip_before_action :require_authenticated_user, only: %i[new create]

  def new
    @user = User.new
  end

  def create
    # Remember to add flash message display in users/new view
    if (user = User.create(user_params))
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      render 'new'
    end
  end

  def show
    @user = User.find_by_id(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
