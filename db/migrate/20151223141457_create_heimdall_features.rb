class CreateHeimdallFeatures < ActiveRecord::Migration
  def change
    create_table :heimdall_features do |t|
      t.string :namespace

      t.timestamps null: false
    end
  end
end
