class SessionsController < ApplicationController
  def new
  end

  def create
    email = request.env['omniauth.auth']['info']['email']
    name = request.env['omniauth.auth']['info']['name']
    add_or_update_user name, email
  end

  def destroy
    log_out
    redirect_to root_url
  end

  private

  def add_or_update_user(name, email)
    if name && email
      @auth = request.env['omniauth.auth']['credentials']
      @user_exist = User.find_by(email: email)
      if @user_exist
        @user = @user_exist.update_attributes(name: name)
        login_and_redirect email
      else
        @user = User.new(name: name, email: email, role: "Interviewer")
        if @user.save
          login_and_redirect email
        else
          flash.now[:danger] = 'Invalid user'
          render 'new'
        end
      end
    end
  end

  def login_and_redirect(email)
    log_in email
    redirect_to applications_path
  end
end
