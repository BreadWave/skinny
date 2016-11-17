class Comment < ApplicationRecord
  belongs_to :post

  mount_uploader :photo, ComPhotoUploader
end
