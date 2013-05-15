class Sdn < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :uid, :sdn_type

  has_many :programs

  validates :uid, presence: true, uniqueness: true
  validates :last_name, presence: true
  validates :sdn_type, presence: true
end
