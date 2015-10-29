# == Schema Information
#
# Table name: violation_descriptions
#
#  id                    :integer          not null, primary key
#  violation_code        :string
#  violation_description :string
#  restaurant_id         :integer
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#

class ViolationDescription < ActiveRecord::Base
  belongs_to :restaurant
 
end


