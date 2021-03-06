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

class Account < ActiveRecord::Base
  has_many :account_entries, dependent: :destroy
                            # dependent destroy destroys all account_entries associated with the given account when that account is deleted
  
  validates :name, presence: true, 
                   length: { in: 1..70,
                   message: "Please use a decent name." },
                   uniqueness: true
                   
  validate :your_name_is_not_dumb
  
  def your_name_is_not_dumb
    if name.include?("dumb")
      errors.add(:name, "is dumb")
    end
  end
  
  def update_balance!
    self.balance = self.account_entries.approved.sum(:amount)
    self.save
  end
end
