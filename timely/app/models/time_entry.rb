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

class TimeEntry < AccountEntry
  belongs_to :employee
  
  validates :time, numericality: {greater_than: 0, less_than: 24}

  before_create :calculate_amount! # calling this before create ensures that even in the billing rates changes, the existing accounts won't be effected.  ONLY the newly created acounts will be effected.

  def self.per_hour
    34
  end
  
  def calculate_amount!
    self.amount = TimeEntry.per_hour * self.time
  end

end


