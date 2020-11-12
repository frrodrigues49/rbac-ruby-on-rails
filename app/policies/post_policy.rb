class PostPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.admin?
        scope.all
      else
        scope.where(user: user)
      end
    end
  end

  def index?
    user.roles.any? { |role| role.has_permission?('view_post') } 
  end 

  def new?
    user.roles.any? { |role| role.has_permission?('create_post') } 
  end 
end
