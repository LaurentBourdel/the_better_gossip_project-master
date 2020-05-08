require 'bcrypt'
class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user 
    	#&& @user.authenticate(params[:password_digest])
      session[:user_id] = @user.id
      log_in(@user)
      puts "Login is OK!"
      flash[:success] = "Utilisateur connecté !"
      redirect_to '/'
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    session.delete(current_user.id)
    session[:user_id] = nil
    puts "Vous êtes déconnecté"
    flash[:notice] = "Utilisateur déconnecté !"
    redirect_to '/' 
  end
end