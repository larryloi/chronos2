Sequel.migration do
  up do
    execute("ALTER TABLE chronos_archive_transaction_logs
                CHANGE COLUMN traced_at traced_at datetime(6) NOT NULL,
                CHANGE COLUMN opened_at opened_at datetime(6) NOT NULL,
                CHANGE COLUMN closed_at closed_at datetime(6) NULL;")
  end

  down do
    execute("ALTER TABLE chronos_archive_transaction_logs
                CHANGE COLUMN traced_at traced_at datetime(0) NOT NULL,
                CHANGE COLUMN opened_at opened_at datetime(0) NOT NULL,
                CHANGE COLUMN closed_at closed_at datetime(0) NULL;")
  end
end

