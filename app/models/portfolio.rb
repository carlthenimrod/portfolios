class Portfolio < ActiveRecord::Base
  attr_accessible :description, :img, :info, :title

  mount_uploader :img, ImgUploader
end
