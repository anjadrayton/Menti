class AddMessageToMentorshipApplications < ActiveRecord::Migration[6.0]
  def change
    add_column :mentorship_applications, :message, :string
  end
end
