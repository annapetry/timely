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

class Customer < Account
  has_paper_trail
  
  has_many :time_entries
  
  scope :premier,     -> { where("employees > ?", 50) }
  scope :newest,      -> { order("created_at DESC") }
  scope :starts_with, -> (letter) { where("name LIKE ?", letter + "%") }
end
