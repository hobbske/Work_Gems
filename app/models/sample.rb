class Sample < ActiveRecord::Base  
  belongs_to :user

  validates :category, :title, :description, presence: true
  # validates :image_after, :presence => true, :if => "image_before.blank?"

  has_attached_file :img_before, styles: { large: "500x500#", medium: "300x300#", small: "100x100#" }, default_url: "/images/:style/img_placeholder.png"
  validates_attachment_content_type :img_before, content_type: /\Aimage\/.*\Z/

  has_attached_file :img_after, styles: { large: "500x500#", medium: "300x300#", small: "100x100#" }, default_url: "/images/:style/img_placeholder.png"
  validates_attachment_content_type :img_after, content_type: /\Aimage\/.*\Z/

end