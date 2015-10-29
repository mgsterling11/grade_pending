# == Schema Information
#
# Table name: restaurants
#
#  id              :integer          not null, primary key
#  name            :string
#  address         :string
#  inspection_date :string
#  grade           :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#


class Restaurant < ActiveRecord::Base
  has_one :violation_description
  has_one :address
  has_one :cuisine_type

  
 

end

