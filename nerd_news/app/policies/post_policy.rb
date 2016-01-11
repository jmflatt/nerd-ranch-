class PostPolicy < Policy

  def new?
    true
  end

  def create?
    true
  end

  def show?
    true
  end

  def edit?
    update?
  end

  def update?
    is_owner?
  end

  def destroy?
    is_owner?
  end

  private

  def is_owner?
    user[:id] == record.user.id
  end
end
