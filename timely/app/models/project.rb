# == Schema Information
#
# Table name: projects
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  customer_id :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class Project < ActiveRecord::Base
	belongs_to :customer
	has_and_belongs_to_many :employees, :join_table => "employees_projects"
  
  validates :name, presence: true, length: { in: 1..70 }
  
end
