class AttendanceSheetsController < ApplicationController
  
  def show
    @attendance_sheet = AttendanceSheet.where(
      standard_id: 1, date: Date.today
    ).first_or_create
    @students = Student.where(standard_id: 1)
    @students.each do |student|
      @attendance_sheet.attendance_entries.find_or_create_by(student_id: student.id, updated_by_id: current_user.id)
    end
  end

  def create_attendance_entries
    attendance_entries_by_user = params[:attendance_sheet][:attendance_entries_attributes].values
    attendance_sheet = AttendanceSheet.find(params[:id])

    attendance_entries_by_user.each do |entry|
      status = false if entry[:is_present] == "0"
      attendance_sheet.attendance_entries.update_all(is_present: status, student_id: entry[:student_id]) 
    end
    redirect_to :attendance_sheet
  end
end
