class UserPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
  end

  def permitted_attributes
    [:first_name, :password]
  end

   def show?
    true
   end

   def edit?
    true
   end

   def update?
    true
   end
end
# class UserPolicy < ApplicationPolicy
#   class Scope < Scope
#     # NOTE: Be explicit about which records you allow access to!
#   end

#   def permitted_attributes_for_update
#     [:first_name, :password]
#   end

#    def show?
#     true
#    end

#    def edit?
#     true
#    end

#    def update?
#     true
#    end
# end
