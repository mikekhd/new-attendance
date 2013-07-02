class CreateAttendances < ActiveRecord::Migration
  def change
    create_table :attendances do |t|
      t.datetime :login
      t.datetime :logout
      t.integer :user_id

      t.timestamps
    end
  end
end
