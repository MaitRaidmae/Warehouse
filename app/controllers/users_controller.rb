class UsersController < ApplicationController

#before_filter :require_user, :only => [:show, :edit, :update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to account_url
    else
      render :action => :new
    end
  end

  def show
    @user = User.new
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user # makes our views "cleaner" and more consistent
    if @user.update_attributes(user_params)
      redirect_to account_url
    else
      render :action => :edit
    end
  end

  private
    def user_params
      params.require(:user).permit(:login,:password,:salt,:encrypted_password)
    end

end
