class Role < ApplicationRecord
  has_many :role_permissions 
  has_many :permissions, through: :role_permissions 

  def has_permission?(permission)
    permissions.where(name: permission).exists?
  end
end
