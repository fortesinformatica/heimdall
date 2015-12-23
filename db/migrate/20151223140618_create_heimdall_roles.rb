class CreateHeimdallRoles < ActiveRecord::Migration
  def change
    create_table :heimdall_roles do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
