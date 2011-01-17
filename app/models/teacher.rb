# == Schema Information
# Schema version: 20110113220814
#
# Table name: teachers
#
#  id                   :integer(4)      not null, primary key
#  first_name           :string(255)
#  last_name            :string(255)
#  nickname             :string(255)
#  cell_phone           :string(255)
#  email                :string(255)
#  bio                  :text
#  shirt_size           :string(255)
#  created_at           :datetime
#  updated_at           :datetime
#  password             :string(255)
#  encrypted_password   :string(255)
#  password_salt        :string(255)
#  reset_password_token :string(255)
#  remember_token       :string(255)
#  remember_created_at  :datetime
#  sign_in_count        :integer(4)      default(0)
#  current_sign_in_at   :datetime
#  last_sign_in_at      :datetime
#  current_sign_in_ip   :string(255)
#  last_sign_in_ip      :string(255)
#

class Teacher < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :first_name, :last_name, :nickname, :cell_phone, :email, :bio,
                    :password, :password_confirmation, :remember_me
  
  has_many :courses
  has_many :registrations, :through => :courses
  has_and_belongs_to_many :roles, :join_table => :roles_users
  
  validates_presence_of :first_name, :last_name, :email, :password
  validates_uniqueness_of :email
  
  def display_name
    "#{self.first_name} #{self.last_name}"
  end
  
  def role?(role)
    return !!self.roles.find_by_name(role.to_s)
  end
end
