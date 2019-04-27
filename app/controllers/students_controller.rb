class StudentsController < ApplicationController

  before_action :load_school, :load_standard
  before_action :load_student, only: [:update]

  def index
    if params[:search_item].present?
      @students = @standard.students.where(["LOWER(name) LIKE ?", "%#{params[:search_item].downcase}%"])
    else
      @students = @standard.students.order(:name)
    end
  end

  def new
    @student = @standard.students.new
  end

  def create
    @student = @standard.students.build(student_params)
    if @student.save
      flash[:success] = I18n.t('created.success', model_name: 'Student')
      redirect_to users_path
    else
      flash[:error] = I18n.t('created.failure', model_name: 'Student')
      render 'new'
    end
  end

  def update
    if @student.update_attributes(student_params)
      flash[:success] = I18n.t('updated.success', model_name: 'Student')
      redirect_to standard_students_path(@standard) and return
    else
      flash[:error] = I18n.t('updated.failure', model_name: 'Student')
      render :edit and return
    end
  end

  private

  def load_school
    @current_school = current_user.school
  end

  def load_standard
    @standard = @current_school.standards.find params[:standard_id] if params[:standard_id]
    @standard ||= @current_school.standards.first
  end

  def load_student
    @student = @standard.students.find params[:id]
  end

  def student_params
    params.require(:student).permit(:name, :roll_number, :primary_number, :secondary_number, :preferred_language, :standard_id, :active)
  end

end
