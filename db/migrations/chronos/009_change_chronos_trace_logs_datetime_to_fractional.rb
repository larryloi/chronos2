Sequel.migration do
  up do
    execute("ALTER TABLE chronos_trace_logs
                CHANGE COLUMN traced_at traced_at datetime(6) NOT NULL,
                CHANGE COLUMN synced_at synced_at datetime(6) NOT NULL,
                CHANGE COLUMN created_at created_at datetime(6) NULL;")
  end

  down do
    execute("ALTER TABLE chronos_trace_logs
                CHANGE COLUMN traced_at traced_at datetime(0) NOT NULL,
                CHANGE COLUMN synced_at synced_at datetime(0) NOT NULL,
                CHANGE COLUMN created_at created_at datetime(0) NULL;")
  end
end

