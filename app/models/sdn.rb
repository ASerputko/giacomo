class Sdn < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :uid

  validates :uid, presence: true, uniqueness: true
  validates :last_name, presence: true
end
