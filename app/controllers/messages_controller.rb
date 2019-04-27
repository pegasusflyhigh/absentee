class MessagesController < ActionController::Base
  skip_before_action :verify_authenticity_token
  before_action :load_user_and_school

  def received
    content = params['content']&.delete(' ')
    standard_info, absentees_roll_numbers = MessageParser.new(content).parse
    grade, section = standard_info.scan(/\d+|\D+/)
    @standard = Standard.where('grade = ? AND lower(section) = ?', grade, section.downcase).first
    if @user && standard_info && @user.can_take_attendance(@standard) && absentees_roll_numbers
      get_students(absentees_roll_numbers)
      mark_students_as_absent
    else
      Rails.logger.info "Params received in unexpected format in textlocal callback"
      Rails.logger.info params
    end
    head :ok
  end

  private

  def load_user_and_school
    sender = params['sender']
    # remove suffix 91
    sender = sender[2..-1] if sender
    @user = User.where(mobile_number: sender).first
    @school = @user&.school
  end

  def mark_students_as_absent
    attendance_sheet = AttendanceSheet.find_or_create_by(standard: @standard, date: Date.today)
    attendance_entries = attendance_sheet.attendance_entries.where(student: @students)
    attendance_entries.update(is_present: false)
    attendance_entries.update(updated_by: @user)
  end

  def get_students(absentees_roll_numbers)
    @students = Student.where(roll_number: absentees_roll_numbers, standard: @standard) if @standard
  end
end
