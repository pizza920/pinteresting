ActiveAdmin.register Directory do
  permit_params :title,:rank,:position, :synonyms, :level
  
  form do |f|
    f.inputs 'Directory' do
      f.input :parent, collection: Directory.roots
      f.input :title
      f.input :synonyms
      f.input :rank
      f.input :position
      f.input :level
      f.input :slug
    end
    f.actions
  end
  controller do
    def find_resource
      scoped_collection.where(slug: params[:id]).first!
    end
  end
end
