Sequel.migration do
  up do
    alter_table(:chronos_trace_logs) do
      add_index([:type, :job_id, :target], name: :chronos_trace_logs_type_job_id_target_id)
    end
  end

  down do
    alter_table(:chronos_trace_logs) do
      drop_index([:type, :job_id, :target], name: :chronos_trace_logs_type_job_id_target_id)
    end
  end
end

