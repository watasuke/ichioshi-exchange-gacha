class AddWowCountToPost < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :wows_count, :integer
  end
end
