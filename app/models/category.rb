class Category < ApplicationRecord
  has_many :products

  default_scope{where(is_deleted: false)}

  scope :order_by_name, ->{order :name}

  mount_uploader :picture, PictureUploader

  validate :picture_size

  private

  def picture_size
    return unless picture.size > Settings.image_size_by_Mb.megabytes
    errors.add :picture, t("error.image_too_big")
  end
end
