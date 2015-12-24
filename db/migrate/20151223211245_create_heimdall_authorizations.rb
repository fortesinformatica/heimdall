class CreateHeimdallAuthorizations < ActiveRecord::Migration
  def change
    create_table :heimdall_authorizations do |t|
      t.references :role
      t.references :group
      t.references :authorizable, polymorphic: true

      t.timestamps null: false
    end
    add_index :heimdall_authorizations, :role_id, name: "index_heimdall_auths_role_id"
    add_index :heimdall_authorizations, :group_id, name: "index_heimdall_auths_group_id"
    add_index :heimdall_authorizations, :authorizable_id, name: "index_heimdall_auths_authorizable_id"

  end
end
