class ChangeColumnToPostToSetDefaultCountOfAgreements < ActiveRecord::Migration[5.2]
  def self.up
    change_column_null :posts, :Agreements_count, false, 0
  end

  def self.down
    change_column_null :posts, :Agreements_count, true, nil
  end
end
