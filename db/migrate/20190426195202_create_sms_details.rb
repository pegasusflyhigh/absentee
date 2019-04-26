class CreateSmsDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :sms_details do |t|
      t.string :status
      t.text :failure_message
      t.references :attendance_entry, foreign_key: true

      t.timestamps
    end
  end
end
