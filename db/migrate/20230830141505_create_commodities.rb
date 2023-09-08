class CreateCommodities < ActiveRecord::Migration[5.2]
  def change
    create_table :commodities do |t|
      t.integer :user_id
      t.integer :last_changed_day
      t.string :registration_name
      t.integer :change_interval

      t.timestamps
    end
  end
end
