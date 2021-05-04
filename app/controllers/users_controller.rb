class UsersController < ApplicationController

  # @book周り綺麗にしたい?
  def index
    @users = User.all
    @user = current_user
    @new_book = Book.new
  end

  def show
    @user = User.find(params[:id])
    @books = Book.where(user_id: @user)
    @new_book = Book.new
  end

  def edit
    @user = User.find(params[:id])
    if @user != current_user
      redirect_to user_path(current_user)
    end
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to user_path, notice: "Profile was successfully updated."
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

end
