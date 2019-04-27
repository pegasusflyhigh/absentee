class UsersController < ApplicationController
  before_action :authenticate_user!, :load_school
  before_action :load_user, only: [:update, :edit]

  def new
    @school = current_user.school
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
        school_id: current_user.school_id,
        password: Devise.friendly_token.first(8)
      )
    if @user.save
      flash[:success] = I18n.t('created.success', model_name: 'User')
    else
      flash.now[:error]=  @user.errors.messages
      render :new
    end
  end

  def index
    @users = @school.users.order(:created_at)
  end

  def user_params
    params.require(:user).permit(:id, :name, :mobile_number, :role_id, :active, :email, :password)
  end

  def update
    if @user.update(user_params)
      flash[:success] = I18n.t('updated.success', model_name: 'User')
      redirect_to users_path
    else
      flash.now[:error]= @user.errors.messages
    end
  end

  private

  def load_user
    @user = User.find params[:id]
  end

  def load_school
    @school = current_user.school
  end

  def require_permission
    admin_role = Role.find_by(name: 'Admin')
    unless current_user.in?(School.find(params[:school_id])
                                   .users
                                   .where(role: admin_role))
      flash[:error] = I18n.t('error.unauthorised')
      redirect_to attendance_path
    end
  end
end
