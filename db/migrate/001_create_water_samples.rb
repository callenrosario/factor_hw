class CreateWaterSamples < ActiveRecord::Migration
  def up
    create_table :water_samples do |t|
      t.string :site
      t.float :chloroform
      t.float :bromoform
      t.float :bromodichloromethane
      t.float :dibromichloromethane
    end
  end

  def down
    drop_table :water_samples
  end
end
