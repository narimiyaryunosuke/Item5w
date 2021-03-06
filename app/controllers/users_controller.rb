class UsersController < ApplicationController
  
  before_action :require_user_logged_in, only: [:show, :edit]
  
  def show
    @user = User.find(params[:id])
    @items = @user.items
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      flash[:success] = "ユーザーを登録しました。"
      redirect_to @user
    else
      flash[:danger] = "ユーザーの登録に失敗しました。"
      render :new
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    
    if current_user == @user
      
      if @user.update(user_params)
        flash[:success] = "ユーザー情報を編集しました。"
        redirect_to @user
      else
        flash[:danger] = "ユーザー情報の編集に失敗しました。"
        render :edit
      end
      
    else
      redirect_to root_url
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation,:image )
  end

end
