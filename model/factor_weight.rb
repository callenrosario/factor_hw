# +-----------------------------+---------+------+-----+---------+----------------+
# | Field                       | Type    | Null | Key | Default | Extra          |
# +-----------------------------+---------+------+-----+---------+----------------+
# | id                          | int(11) | NO   | PRI | NULL    | auto_increment |
# | chloroform_weight           | float   | YES  |     | NULL    |                |
# | bromoform_weight            | float   | YES  |     | NULL    |                |
# | bromodichloromethane_weight | float   | YES  |     | NULL    |                |
# | dibromichloromethane_weight | float   | YES  |     | NULL    |                |
# +-----------------------------+---------+------+-----+---------+----------------+
class FactorWeight < ActiveRecord::Base
  validates :chloroform_weight, presence: true
  validates :bromoform_weight, presence: true
  validates :bromodichloromethane_weight, presence: true
  validates :dibromichloromethane_weight, presence: true
end
