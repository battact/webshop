ActiveAdmin.register Product do

  permit_params :title, :description, :price, :stock, :product_picture

  config.filters = false

  index do
    column :title
    column :price
    column :stock
    actions
  end

  form do |f|
    f.inputs do
      f.input :title
      f.input :description
      f.input :price
      f.input :stock
      f.input :product_picture, as: :file
    end
    f.actions
  end

  show do |product|
    attributes_table do
      rows :title, :description, :price, :stock
      row :product_picture do
        image_tag product.product_picture.url(:thumb) if product.product_picture
      end
    end
  end
end
