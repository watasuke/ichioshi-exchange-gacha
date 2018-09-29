class Post < ApplicationRecord
    validates  :title, {presence: true, length:{maximum: 75}}
    validates  :comment, {presence: true, length:{maximum: 500}}
    validates  :user_id, {presence: true}
    before_create :set_create_slug
    belongs_to :user
    has_many :wows, dependent: :destroy

    def wow_user(user_id)
    wows.find_by(user_id: user_id)
    end

    def to_param
        slug
    end

    private
    def set_create_slug
        loop do
            self.slug = SecureRandom.hex(4)
            break unless Post.where(slug: slug).exists?
        end
    end
end
