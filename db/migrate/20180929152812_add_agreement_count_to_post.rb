class AddAgreementCountToPost < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :Agreements_count, :integer
  end
end
