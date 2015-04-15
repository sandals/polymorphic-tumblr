class VideoPost < ActiveRecord::Base
  validates :url, :presence => true
end
