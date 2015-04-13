class TextPost < ActiveRecord::Base
  validates :body, :presence => true
end
