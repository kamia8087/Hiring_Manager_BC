class AddResumeToApplications < ActiveRecord::Migration[5.2]
  def change
    add_column :applications, :resume, :string
  end
end
