class NotificationPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.where(recipient: user)
    end
  end

  def index?
    true
  end

  def create?
    true
  end

  def update?
    true
  end

  def destroy?
    true
    # record.user == user
  end
end
