class BillPolicy < Policy

  def new?
    true
  end

  def create?
    has_permission?(:owner, :read_write)
  end

  def show?
    has_permission?(:owner, :read_write, :read)
  end

  def edit?
    update?
  end

  def update?
    has_permission?(:owner, :read_write)
  end

  def destroy?
    has_permission?(:owner)
  end

  private

  def has_permission?(*permissions)
    utility = record.utility
    permissions.map! { |permission| Privilege.permissions[permission] }
    Privilege.where(user: user, utility: utility, permission: permissions).exists?
  end
end
