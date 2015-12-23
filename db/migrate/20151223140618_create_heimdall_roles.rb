class CreateHeimdallRoles < ActiveRecord::Migration
  def change
    create_table :heimdall_roles do |t|
      t.string :name
      t.references :authorizable, polymorphic: true, index: true

      t.timestamps null: false
    end
  end
end
