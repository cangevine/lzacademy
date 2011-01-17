# == Schema Information
# Schema version: 20110113044938
#
# Table name: roles
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Role < ActiveRecord::Base
  has_and_belongs_to_many :teachers, :join_table => :roles_users
  has_and_belongs_to_many :parents, :join_table => :roles_users
end
