class FriendshipPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.where("user_id = ? AND confirmed = ? OR friend_id = ? AND confirmed = ?", user, true, user, true)
    end
  end

  def index?
    true
  end

  def test?
    true
  end

  def show?
    true
  end
  def new
    true
  end
  def edit
    true
  end

  def create?
    true
  end

  def update?
    true
  end
end
