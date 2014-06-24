# == Schema Information
#
# Table name: accounts
#
#  id         :integer          not null, primary key
#  type       :string(255)
#  name       :string(255)
#  email      :string(255)
#  about      :string(255)
#  created_at :datetime
#  updated_at :datetime
#  balance    :integer
#  zipcode    :integer
#  state      :string(255)
#  city       :string(255)
#  employees  :integer
#

require 'test_helper'

class EmployeeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
