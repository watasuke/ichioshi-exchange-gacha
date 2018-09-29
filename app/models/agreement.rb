class Agreement < ApplicationRecord
  belongs_to :user
  belongs_to :post, counter_cache: :agreements_count
end
