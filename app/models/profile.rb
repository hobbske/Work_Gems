class Profile < ActiveRecord::Base
  belongs_to :user

  has_attached_file :avatar, styles: { large: "350x500#", medium: "200x300#", small: "100x100#" }, default_url: "/images/:style/img_placeholder.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  
end