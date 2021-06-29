class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user,     only: :destroy

  def index
    @users = User.paginate(page: params[:page])
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @user.send_activation_email
      flash[:info] = "Пожалуйста проверьте свой email для активации вашего аккаунта."
      redirect_to home_url
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "Профиль обновлён!"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "Пользователь удалён!"
    redirect_to users_url
  end

  private

  # Подтверждает администратора.
  def admin_user
    redirect_to(home_url) unless current_user.admin?
  end

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end

   # Предфильтры

    # Подтверждает вход пользователя
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

    # Подтверждает правильного пользователя
    def correct_user
      @user = User.find(params[:id])
      redirect_to(home_url) unless current_user?(@user)
    end
end
