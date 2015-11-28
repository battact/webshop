class Product < ActiveRecord::Base

  has_many :categorizations
  has_many :categories, through: :categorizations

  has_many :reviews

#  validates :product_picture, presence: true
   has_attached_file :product_picture, styles: { main: '2000x750', medium: '650x350', thumb: "300x400>"  }
   validates_attachment_content_type :product_picture, content_type: /\Aimage\/.*\Z/

   def price_with_tag
     "#{price} HUF"
   end
end
