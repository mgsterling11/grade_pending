# == Schema Information
#
# Table name: cuisine_types
#
#  id                  :integer          not null, primary key
#  cuisine_description :string
#  restaurant_id       :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

require 'test_helper'

class CuisineTypeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
