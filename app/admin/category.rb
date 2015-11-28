ActiveAdmin.register Category do

  permit_params :title, :id

  filter :title

  index do
    column :title
    actions
  end

  show do
    attributes_table do
      row :title
    end
  end

end
