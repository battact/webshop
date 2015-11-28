class AddAttachmentProductPictureToProducts < ActiveRecord::Migration
  def self.up
    change_table :products do |t|
      t.attachment :product_picture
    end
  end

  def self.down
    remove_attachment :products, :product_picture
  end
end
