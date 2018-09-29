class Wow < ApplicationRecord
  belongs_to :user
  belongs_to :post, counter_cache: :wows_count
end
