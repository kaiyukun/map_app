class Post < ApplicationRecord

    geocoded_by :address
    after_validation :geocode

    mount_uploader :image, ImageUploader

    belongs_to :user
    has_many :likes

    def liked_by?(user)
        likes.where(user_id: user.id).exists?
    end
end
