class AttendanceEntryController < ApplicationController
  def index
    @attendance_entries_details = AttendanceSheet.where(standard_id: params[:standard_id], date: params[:date]).first.attendance_entries.collect{|attendance_entry| {roll_number: attendance_entry.student.roll_number, name: attendance_entry.student.name, is_present: attendance_entry.is_present}}
  end

  def update_attendance_entries
  end
end
