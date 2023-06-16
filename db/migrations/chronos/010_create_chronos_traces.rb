# frozen-string-literal: true
Sequel.migration do
  up do
    create_table :chronos_traces do
      String :job_id, primary_key: true, size: 45
      String :target, null: false, size: 45
      String :type, null: false, size: 45
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
