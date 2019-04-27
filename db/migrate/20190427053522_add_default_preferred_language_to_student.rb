class AddDefaultPreferredLanguageToStudent < ActiveRecord::Migration[5.2]
  def change
    change_column :students, :preferred_language, :string, default: "English"
  end
end
