class Post < ActiveRecord::Base
  belongs_to :user

  validates :title, :content, :user, presence: true
end
