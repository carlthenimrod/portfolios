class Portfolio < ActiveRecord::Base
  attr_accessible :description, :img, :info, :title, :updated_at

  mount_uploader :img, ImgUploader
end
