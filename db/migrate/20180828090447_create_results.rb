class CreateResults < ActiveRecord::Migration[5.2]
  def change
    create_table :results do |t|
      t.integer :user_id
      t.integer :post_id

      t.timestamps
    end
  end
end
