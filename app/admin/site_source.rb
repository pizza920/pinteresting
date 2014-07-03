ActiveAdmin.register SiteSource do
  permit_params :url, :title, :parser
  form do |f|
    f.inputs 'Site sources:' do
      f.input :url
      f.input :parser, as: :select, collection: SiteSource::PARSERS
    end
    f.actions
  end
end
