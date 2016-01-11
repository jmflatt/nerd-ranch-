class CommentPolicy < Policy
  def create?
    true
  end

  def show?
    true
  end

  def edit?
    true
  end

  def new?
    true
  end

  def close_thread?
    true
  end

end
