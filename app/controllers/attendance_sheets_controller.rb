class AttendanceSheetsController < ApplicationController
  
  def show
    @attendance_sheet = AttendanceSheet.where(
      standard_id: 1, date: Date.today
    ).first
    @attendance_entries = @attendance_sheet.attendance_entries
    @students = Student.where(standard_id: 1)
    @standards = Standard.all
  end

  def create_attendance_entries
  end

  def get_attendances
    @attendance_sheet = AttendanceSheet.where(
      standard_id: params[:standard_id], date: Date.today
    ).first
  end
end
