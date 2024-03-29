# frozen-string-literal: true
Sequel.migration do
  up do
    create_table :chronos_archive_transaction_logs do
      String :id, primary_key: true, size: 45
      String :archive_job_id, null: false, size: 45
      String :target_uuid, size: 45
      Bignum :target_id
      DateTime :traced_at, null: false
      DateTime :opened_at, null: false
      DateTime :closed_at, null: false

      index [:target_uuid, :archive_job_id], unique: true, name: "chronos_atxs_tuuid_ajid"
      index [:target_id, :archive_job_id], unique: true, name: "chronos_atxs_tid_ajid"
      index [:archive_job_id, :traced_at]
      index [:archive_job_id, :closed_at]
      index [:closed_at]
    end
  end

  down do
    drop_table :chronos_archive_transaction_logs
  end
end
