class CreateAnnouncements < ActiveRecord::Migration[5.1]
  def change
    create_table :announcements do |t|
      t.text :title
      t.text :content
      t.integer :d_id

      t.timestamps
    end
  end
end
