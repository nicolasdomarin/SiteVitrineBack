class Product < ActiveRecord::Base
	belongs_to :sale
  has_attached_file :image,:default_url => "/images/:style/missing.png"# , :styles => { :medium => "300x300>", :thumb => "100x100>" }
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end