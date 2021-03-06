class Portfolio < ActiveRecord::Base
  default_scope order(:order_id)

  attr_accessible :description, :img, :info, :title, :updated_at, :order_id

  validates :title, presence: true, length: { in: 10..1000 }

  validates :description, presence: true, length: { in: 10..10000 }

  mount_uploader :img, ImgUploader

  validates :img, presence: true
end