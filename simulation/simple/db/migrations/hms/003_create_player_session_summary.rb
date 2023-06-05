# frozen-string-literal: true
Sequel.migration do
  up do
    create_table :player_session_snapshots do
      String :id, primary_key: true
      String :snapshot_id, null: false
      String :data, null: false
      DateTime :created_at, null: false
      DateTime :updated_at, null: false

      index :updated_at
    end
  end

  down do
    drop_table :player_session_snapshots
  end
end