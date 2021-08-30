class CreateMentorships < ActiveRecord::Migration[6.0]
  def change
    create_table :mentorships do |t|
      t.references :user, null: false, foreign_key: true
      t.text :description
      t.string :subject

      t.timestamps
    end
  end
end
