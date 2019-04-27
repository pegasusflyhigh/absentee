class AttendanceEntry < ApplicationRecord
  belongs_to :attendance_sheet
  belongs_to :student
  belongs_to :updated_by, class_name: 'User'
  has_one :sms_detail

  after_commit :send_message_to_parents, if: :saved_change_to_is_present?


  def send_message_to_parents
    if !is_present
      locale = LANGUAGES[student.preferred_language.downcase.to_sym]
      unicode = locale != 'en'
      message = I18n.t('student.absent', name: student.name, support_number: SUPPORT_NUMBER, locale: locale)
      messenger = TextlocalTextMessenger.new(message)
      messenger.send([student.primary_number], unicode)
    end
  end
end
