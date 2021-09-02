class AddAddressAndCoordinatesToMentorships < ActiveRecord::Migration[6.0]
  def change
    add_column :mentorships, :address, :string
    add_column :mentorships, :latitude, :float
    add_column :mentorships, :longitude, :float
  end
end
