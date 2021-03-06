ActiveAdmin.register Website do

  
  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :name, :url, :rank, :category, :category_id

  index do
    selectable_column
    id_column
    column :name
    column :directory
    column :url
    column :created_at
    column :rank
    column :description
    actions
  end

  #
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end
  
end
