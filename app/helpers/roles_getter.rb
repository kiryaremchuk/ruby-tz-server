# frozen_string_literal: true

module RolesGetter
  def super?
    users_roles = roles.group_by(&:name)
    users_roles.key?('Super')
  end

  def groups_admin?
    users_roles = roles.group_by(&:name)
    users_roles.key?('Groups admin')
  end

  def books_admin?
    users_roles = roles.group_by(&:name)
    users_roles.key?('Books admin')
  end

end
