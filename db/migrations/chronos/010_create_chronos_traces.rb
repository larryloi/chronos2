# frozen-string-literal: true
Sequel.migration do
  up do
    create_table :chronos_traces do
      String :job_id, primary_key: true
      String :target, null: false
      String :type, null: false
      column :synced_at, "datetime(6)", null: false
      column :traced_at, "datetime(6)", null: false
      column :created_at, "datetime(6)", null: false

      index [:target, :job_id, :synced_at]
      index [:synced_at]
    end
  end

  down do
    drop_table :chronos_traces
  end
end
