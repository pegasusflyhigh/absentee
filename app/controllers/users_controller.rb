class UsersController < ApplicationController
  before_action :authenticate_user!, :load_user, :load_school

  def new
    @school = current_user.school.new
    @user = @school.users.build
  end

  def create
    teacher_role = Role.find_by(name: 'Teacher')
    @user = @school.users.build(
        name: user_params[:name],
        email: user_params[:email],
        mobile_number: user_params[:mobile_number],
        active: true,
        role: teacher_role,
        password: Devise.friendly_token.first(8)
      )
    if @user.valid?
      @user.save
      flash[:success] = "User record added!!"
    else
      flash.now[:error]=  @user.errors.messages
      render :new
    end
  end

  def index
    @users = @school.users.order(:created_at).page(params[:page]).per(10)
  end

  def user_params
    params.require(:user).permit(:id, :name, :mobile_number, :role_id, :is_active, :email, :password)
  end

  def update
    page = 1
    if !params[:page]
      params[:page] = page
    end
    if @user.update(user_params)
      flash[:success] = "User updated successfully!!"
      redirect_to school_users_path(@school,:page=>params[:page])
    else
      flash.now[:error]= @user.errors.messages
    end
  end

  private

  def load_user
    @user = User.find(params[:id])
  end

  def load_school
    @school = School.find(params[:school_id])
  end

  def require_permission
    admin_role = Role.find_by(name: 'Admin')
    unless current_user.in?(School.find(params[:school_id])
                                   .users
                                   .where(role: admin_role))
      flash[:error] = "You are not authorized to access it!!"
      redirect_to attendance_path
    end
  end
end
