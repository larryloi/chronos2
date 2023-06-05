Sequel.migration do
  up do
    execute("ALTER TABLE chronos_archive_transaction_logs row_format=COMPRESSED KEY_BLOCK_SIZE=8;")
  end

  down do
    execute("ALTER TABLE chronos_archive_transaction_logs row_format=DYNAMIC;")
  end
end

