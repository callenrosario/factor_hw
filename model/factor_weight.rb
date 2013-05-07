class FactorWeight < ActiveRecord::Base
  validates :chloroform_weight, presence: true
  validates :bromoform_weight, presence: true
  validates :bromodichloromethane_weight, presence: true
  validates :dibromichloromethane_weight, presence: true
end
