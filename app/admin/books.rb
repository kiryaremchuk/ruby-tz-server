ActiveAdmin.register Book do
  actions :all, except: [:new]
  action_item only: :show  do
    if current_admin_user.super? || current_admin_user.books_admin?
      link_to "New Book", {action: :create}, method: :create
    end
  end
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params do
    permitted = []
    if current_admin_user.super? || current_admin_user.books_admin?
      permitted = [:name,
                  :cover_url,
                  group_ids: [],
                  author_ids: []]
    end
    permitted
  end
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :cover_url]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  form do |f|
    if current_admin_user.super? || current_admin_user.books_admin?
      f.actions
      f.inputs 'Book' do
        f.input :name
        f.input :cover_url
        f.input :groups, :as => :select, :input_html => {:multiple => true}
        f.input :authors, :as => :select, :input_html => {:multiple => true}
      end
      f.actions
    end
  end

  index do
    selectable_column
    id_column
    column :name
    column :cover_url
    column :authors
    column :groups
    actions if current_admin_user.super? || current_admin_user.books_admin?
  end
end
