class CreateCredits < ActiveRecord::Migration[5.2]
  def change
    create_table :credits do |t|
      t.integer :user_id
      t.integer :credits

      t.timestamps
    end
  end
end
