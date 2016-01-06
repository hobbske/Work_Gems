class Sample < ActiveRecord::Base  
  belongs_to :user

  validates :category, :title, :description, presence: true
  # validates :image_after, :presence => true, :if => "image_before.blank?"

  has_attached_file :img_before, styles: { carousel: "750x500#", large: "500x333#", medium: "300x200#", small: "100x100#" }, default_url: "/images/:style/img_placeholder.png"
  validates_attachment_content_type :img_before, content_type: /\Aimage\/.*\Z/

  has_attached_file :img_after, styles: { carousel: "750x500#", large: "500x333#", medium: "300x200#", small: "100x100#" }, default_url: "/images/:style/img_placeholder.png"
  validates_attachment_content_type :img_after, content_type: /\Aimage\/.*\Z/

end