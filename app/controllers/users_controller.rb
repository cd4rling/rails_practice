class UsersController < ApplicationController
    def create
      user = User.new(user_params)
      if user.save
        render json: { status: 'User created successfully', user: user }, status: :created
      else
        render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    private
  
    def user_params
      params.require(:user).permit(:username, :email, :first_name, :last_name)
    end
  end
  