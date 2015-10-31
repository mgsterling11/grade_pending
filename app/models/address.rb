# == Schema Information
#
# Table name: addresses
#
#  id            :integer          not null, primary key
#  boro          :string
#  building      :string
#  street        :string
#  zipcode       :string
#  phone         :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  restaurant_id :integer
#

class Address < ActiveRecord::Base
  belongs_to :restaurant
end
