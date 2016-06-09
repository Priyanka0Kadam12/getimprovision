class Post < ActiveRecord::Base
  has_many :comments
  has_many :likes
  has_attached_file :image


    
    validates :title, presence: true
    validates :image, presence:true
    validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

end
