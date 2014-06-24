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

class AccountEntry < ActiveRecord::Base
  has_paper_trail
  
  belongs_to :account
  
  validates :account_id, presence: true 
  validates_associated :account
  
  after_save :update_account_balance!, :if => :approved?
  
  scope :approved, -> { with_state(:approved) }
  
  state_machine :state, :initial => :submitted do
    event :approve do
      transition :submitted => :approved
    end
    event :reject do
      transition :submitted => :rejected
    end
  end
  
  def update_account_balance!
    account.update_balance!
  end
end
