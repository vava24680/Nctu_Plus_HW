class RenameDIdAnnouncement < ActiveRecord::Migration[5.1]
  def change
      rename_column :announcements, :d_id, :department_id
  end
end
