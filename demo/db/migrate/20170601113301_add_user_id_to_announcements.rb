class AddUserIdToAnnouncements < ActiveRecord::Migration[5.1]
  def change
	  add_column :announcements, :user_id, :integer
  end
end
