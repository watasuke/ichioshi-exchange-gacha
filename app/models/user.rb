class User < ApplicationRecord
  after_create :login_bonus

  def self.find_or_create_from_auth(auth)
    provider = auth[:provider]
    uid = auth[:uid]
    user_name = auth[:info][:nickname]
    image_url = auth[:info][:image]

    self.find_or_create_by(provider: provider, uid: uid) do |user|
      user.user_name = user_name
      user.image_url = image_url
    end
  end

  def login_bonus
    Credit.create(user_id: self.id, credits: 1)
  end

  def posts
    return Post.where(user_id: self.id)
  end
end
