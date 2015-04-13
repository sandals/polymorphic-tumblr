class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :postable, polymorphic: true

  validates_associated :postable

  default_scope { order(:created_at => :desc) }
end
