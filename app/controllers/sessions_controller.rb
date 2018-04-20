class SessionsController < ApplicationController

  layout 'home', only: :home

  def new
  end

  def create
    @user = User.find_by(username: params[:username])
    @user = @user.try(:authenticate, params[:password])
    if @user
      session[:user_id] = @user.id
      redirect_to @user
    else
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end

  def about

  end

  def home
    if session[:user_id]
      redirect_to '/playlists'
    end
  end

  def help

  end
end
