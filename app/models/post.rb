class Post < ApplicationRecord
    validates  :title, {presence: true, length:{maximum: 75}}
    validates  :comment, {presence: true, length:{maximum: 500}}
    validates  :user_id, {presence: true}
end
