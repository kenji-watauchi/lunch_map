class UsersController < ApplicationController
  before_action :signed_in_user, only: [:edit, :update, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: :destroy
  before_filter :filter, only: [:new, :create]

  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.pagenate(page: params[:page])
  end

  def new
    @user = User.new
  end

  def index
    @users = User.paginate(page: params[:page])
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = "ユーザー登録完了！ 今日のランチはどこにする？"
      redirect_to @user
    else
      render :new#ここはハッシュでいいのか？
    end
  end

  def edit
   # @user = User.find(params[:id])  ページ上部のbefore_action :ccorrect_userで@userを定義したので、ここに書かなくていい
  end

  def update
   # @user = User.find(params[:id])  editと同じ理由
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to users_url
  end


  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation,:admin)
  end

  # Before actions

  def signed_in_user
    unless signed_in?
      store_location
      redirect_to signin_url, notice: "Please sign in." unless signed_in?
    end
  end

  def  filter
    if current_user.present?
      redirect_to root_path
    end
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_path) unless current_user?(@user)
  end

  def admin_user
    redirect_to(root_path)unless current_user.admin?
  end
end
