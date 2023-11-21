class SessionsController < ApplicationController

  skip_before_action :verify_authenticity_token, :authenticate_user!
  after_action :after_sign_in_path_for, only: :create
  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
    else
      flash.now[:alert] = 'Are you a Guru? Verify your email and password, please!'
      render :new
    end
  end

  #def exit
  # reset_session
  #  redirect_to login_path
  #end

end
