class Post < ApplicationRecord
    validates  :title, {presence: true, length:{maximum: 75}}
    validates  :comment, {presence: true, length:{maximum: 500}}
    validates  :user_id, {presence: true}
    before_create :set_create_slug

    def to_param
        slug
    end

    private
    def set_create_slug
        loop do
            self.slug = SecureRandom.hex(7)
            break unless Post.where(slug: slug).exists?
        end
    end
end
