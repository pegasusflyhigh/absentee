class AddClassTeacherToStandard < ActiveRecord::Migration[5.2]
  def change
    add_reference :standards, :class_teacher, index: true
  end
end
