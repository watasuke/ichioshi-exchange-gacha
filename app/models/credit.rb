class Credit < ApplicationRecord
    validates  :user_id, {presence: true}
    validates  :credits, {presence: true}
    # validates  :credits, numericality: { allow_blank: true, greater_than_or_equal_to: 0 }
end