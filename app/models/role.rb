class Role < ActiveRecord::Base
  has_and_belongs_to_many :teachers, :join_table => :roles_users
  has_and_belongs_to_many :parents, :join_table => :roles_users
end