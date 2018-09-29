class ChangeColumnNameToPost < ActiveRecord::Migration[5.2]
  # 変更内容
  def change
    rename_column :posts, :Agreements_count, :agreements_count
  end
end
