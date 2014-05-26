ActiveAdmin.register WebsiteRank do
   permit_params :website_id, :user_id, :custom_rank
   form do |f|
    f.inputs do
      f.input :user, as: :select, collection: User.all.map{|u| [u.name, u.id]}
      f.input :website, as: :select, collection: Website.all.map{|w| [w.name, w.id]}
      f.input :custom_rank
    end
  end

  
  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end
  
end
