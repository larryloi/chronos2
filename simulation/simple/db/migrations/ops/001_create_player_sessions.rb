# frozen-string-literal: true
Sequel.migration do
  up do
    create_table :player_sessions do
      String :id, primary_key: true
      String :data
      DateTime :created_at
      DateTime :updated_at

      index :updated_at
    end
  end

  down do
    drop_table :player_sessions
  end
end