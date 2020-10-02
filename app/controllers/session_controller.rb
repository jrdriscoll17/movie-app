# frozen_string_literal: true

class SessionController < ApplicationController
  skip_before_action :require_authenticated_user, only: %i[new create]

  def new

  end

  def create
    user = User.find_by(username: params[:user][:username])
    if user&.authenticate(params[:user][:password])
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      @errors = ['Username or password not found']
      render 'new'
    end
  end

  def destroy
    session.delete :user_id
    redirect_to new_user_path
  end
end
