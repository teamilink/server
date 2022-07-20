class UsersController < ApplicationController
  def create
    @user = User.new(user_params)
    pp user_params

    if @user.save
      auth_token = Knock::AuthToken.new payload: {sub: @user.id}
      render json: {username: @user.username, jwt: auth_token.token}, status: :created
    else
      render json: {error: "Oops, username and email must be uniq"}, status: 422
    end
  end

  def login
    @user = User.find_by_email(params[:email])
    
    if @user && @user.authenticate(params[:password])
      auth_token = Knock::AuthToken.new payload: {sub: @user.id}
      render json: {username: @user.username, jwt: auth_token.token}, status: 200
    else
      render json: {error: "Invalid email or password"}, status: 401
    end
  end

  private
  def user_params
    params.permit(:username, :email, :password, :password_confirmation)
  end
end
