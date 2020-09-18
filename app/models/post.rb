class Post < ApplicationRecord

    geocoded_by :address
    after_validation :geocode

    mount_uploader :image, ImageUploader

    belongs_to :user
end
