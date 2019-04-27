class StandardsController < ApplicationController
  before_action :authenticate_user

  def new
    @school = current_user.school
    @standard = @school.standards.build
  end

  def create
    @standard.assign_attributes(permitted_params)
    if @standard.save
      flash[:success] = I18n.t('created.success', model_name: 'Class')
    else
      flash[:error] = I18n.t('created.failure', model_name: 'Class')
    end
  end

  def index
    @standards = @school.standards
  end

  def permitted_params
    params.permit(:grade, :section)
  end
end
