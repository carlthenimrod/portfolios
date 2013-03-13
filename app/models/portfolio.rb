class Portfolio < ActiveRecord::Base
  attr_accessible :description, :img, :info, :title, :updated_at

  validates :title, presence: true, length: { in: 10..1000 }

  validates :description, presence: true, length: { in: 10..10000 }

  mount_uploader :img, ImgUploader
end