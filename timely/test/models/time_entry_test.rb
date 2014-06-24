# == Schema Information
#
# Table name: account_entries
#
#  id          :integer          not null, primary key
#  time        :float
#  customer_id :integer
#  employee_id :integer
#  created_at  :datetime
#  updated_at  :datetime
#  account_id  :integer
#  type        :string(255)
#  amount      :integer
#  state       :string(255)
#

require 'test_helper'

class TimeEntryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
