class CreateFactorWeights < ActiveRecord::Migration
  def up
    create_table :factor_weights do |t|
      t.float :chloroform_weight
      t.float :bromoform_weight
      t.float :bromodichloromethane_weight
      t.float :dibromichloromethane_weight
    end
  end

  def down
    drop_table :factor_weights
  end
end
