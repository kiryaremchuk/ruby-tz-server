ActiveAdmin.register Author do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name,
                book_ids: []
  #
  # or
  #
  # permit_params do
  #   permitted = [:first_name, :last_name]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  form do |f|
    f.actions
    f.inputs 'Author' do
      f.input :name
      f.input :books, :as => :select, :input_html => {:multiple => true}
    end
    f.actions
  end

  index do
    selectable_column
    id_column
    column :name
    column :books
    actions
  end
  
end
