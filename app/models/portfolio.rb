class Portfolio < ActiveRecord::Base
  attr_accessible :description, :img, :info, :title, :created_at, :updated_at

  mount_uploader :img, ImgUploader
end
