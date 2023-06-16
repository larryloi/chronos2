# frozen-string-literal: true
Sequel.migration do
  up do
    create_table :chronos_trace_logs do
      String :id, primary_key: true, size: 45
      String :job_id, null: false, size: 45
      String :target, null: false, size: 45
      String :type, null: false, size: 45
      DateTime :synced_at, null: false
      DateTime :traced_at, null: false
      DateTime :created_at, null: false

      index [:job_id, :created_at]
      index [:target, :job_id, :synced_at]
      index [:created_at]
    end
  end

  down do
    drop_table :chronos_trace_logs
  end
end
