# frozen_string_literal: true

class SessionController < ApplicationController
  skip_before_action :require_authenticated_user, only: %i[new create]

  def new; end

  def create
    if auth_hash
      omniauth_login
    else
      user = User.find_by(username: params[:user][:username])
      if user&.authenticate(params[:user][:password])
        session[:user_id] = user.id
        redirect_to user_path(user)
      else
        @errors = ['Username or password not found']
        render 'new'
      end
    end
  end

  def destroy
    session.delete :user_id
    redirect_to new_user_path
  end

  private

  def omniauth_login
    user = User.find_or_create_by(username: auth_hash[:info][:name])
    user.email = auth_hash[:info][:email]
    user.password = SecureRandom.hex
    if user.save
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      @errors = ['Could not login via Google']
      redirect_to login_path
    end
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end
