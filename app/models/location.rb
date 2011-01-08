# == Schema Information
# Schema version: 20101220225117
#
# Table name: locations
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  address    :string(255)
#  city       :string(255)
#  zip        :string(255)
#  url        :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Location < ActiveRecord::Base
  has_many :courses
end
