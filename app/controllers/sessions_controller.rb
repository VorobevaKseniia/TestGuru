class SessionsController < ApplicationController

  skip_before_action :verify_authenticity_token, :authenticate_user!
  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to_the_requested_page
    else
      flash.now[:alert] = 'Are you a Guru? Verify your email and password, please!'
      render :new
    end
  end

  def exit
    reset_session
    redirect_to login_path
  end

  private

  def redirect_to_the_requested_page
    redirect_to session[:forwarding_url] || tests_path
    session.delete(:forwarding_url)
  end

end
