class CreateRecesses < ActiveRecord::Migration
  def change
    create_table :recesses do |t|
      t.integer :user_id
      t.datetime :r_start
      t.datetime :r_stop

      t.timestamps
    end
  end
end
