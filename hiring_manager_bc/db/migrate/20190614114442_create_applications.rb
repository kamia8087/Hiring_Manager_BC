class CreateApplications < ActiveRecord::Migration[5.2]
  def change
    create_table :applications do |t|
      t.string :experience
      t.string :qualification
      t.string :contact_number
      t.string :notice_period
      t.string :assigned_to
      t.string :status
      t.string :exp_salary
      t.references :user, foreign_key: {on_delete: :cascade}
      t.references :candidate, foreign_key: {on_delete: :cascade}

      t.timestamps
    end
  end
end
