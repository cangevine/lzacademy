# == Schema Information
# Schema version: 20101220225117
#
# Table name: programs
#
#  id          :integer(4)      not null, primary key
#  name        :string(255)
#  language    :string(255)
#  level       :string(255)
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#

class Program < ActiveRecord::Base
  has_many :courses
end
