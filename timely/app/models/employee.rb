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

class Employee < Account
  has_many :time_entries
  has_and_belongs_to_many :projects, :join_table => "employees_projects"

  def total_hours
  	time_entries.sum(:time)
  end

  def log_time(amount, customer)
  	TimeEntry.create(time: amount, employee: self, account: customer)
  end
end
