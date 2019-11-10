ActiveAdmin.register Group do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  actions :all, except: [:new]
  action_item only: :show  do
    if current_admin_user.super? || current_admin_user.groups_admin?
      link_to "New Group", {action: :create}, method: :create
    end
  end

  permit_params do
    permitted = []
    if current_admin_user.super? || current_admin_user.groups_admin?
      permitted = [:name,
                   book_ids: []]
    end
    permitted
  end
  #
  # or
  #
  # permit_params do
  #   permitted = [:name]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  form do |f|
    if current_admin_user.super? || current_admin_user.groups_admin?
      f.actions
      f.inputs 'Group' do
        f.input :name
        f.input :books, :as => :select, :input_html => {:multiple => true}
      end
      f.actions
    end
  end

  index do
    selectable_column
    id_column
    column :name
    column :books
    actions if current_admin_user.super? || current_admin_user.groups_admin?
  end
  
end
