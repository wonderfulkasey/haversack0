class NewItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string  :item_name
      t.string  :character
      t.string  :description
      t.date  :date
      t.integer  :user_id
    end
  end
end