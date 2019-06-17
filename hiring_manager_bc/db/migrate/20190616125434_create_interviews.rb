class CreateInterviews < ActiveRecord::Migration[5.2]
  def change
    create_table :interviews do |t|
      t.string :interview_type
      t.string :assignee
      t.references :application, foreign_key: true
      t.references :user, foreign_key: true
      
      t.timestamps
    end
  end
end
