class SessionsController < ApplicationController

  skip_before_action :verify_authenticity_token, :authenticate_user!
  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      current_user.is_a?(Admin) ? admin_tests_path : redirect_to_the_requested_page
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
