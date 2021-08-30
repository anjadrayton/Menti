class CreateMentorshipApplications < ActiveRecord::Migration[6.0]
  def change
    create_table :mentorship_applications do |t|
      t.references :user, null: false, foreign_key: true
      t.references :mentorship, null: false, foreign_key: true
      t.string :status

      t.timestamps
    end
  end
end
