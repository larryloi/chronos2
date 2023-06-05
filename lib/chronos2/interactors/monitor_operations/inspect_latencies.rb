# frozen-string-literal: true
module Chronos2
  module Interactors
    module MonitorOperations
      class InspectLatencies < Operation
        define_result do
          define_attribute(:latencies) { |ctx| ctx[:trace_logs] }
          define_attribute(:abnormal_latencies) { |ctx| ctx[:abnormal_trace_logs] }
        end

        step :retrieve_trace_logs
        pass :calculate_latencies
        pass :check_abnormal_latencies

        protected

        def origin(context)
          actor("#{job(context)[:trace_from]}_repository")
        end

        undef_method :replica

        def retrieve_trace_logs(context)
          context[:trace_logs] = 
            origin(context).run_sql(method(:trace_logs), job: job(context)) || {}
        end

        def trace_logs(db, job:)
          db.from(:chronos_traces)
            .select(:job_id, :target, Sequel[:synced_at].as(:last_synced_at))
            .where(type: job[:trace_type]).where(job_id:job[:job_id])
            .as_hash(:job_id)
        end

        def calculate_latencies(context)
          context[:trace_logs].each_value do |trace_log|
            trace_log[:latency] = Time.now - trace_log[:last_synced_at]
          end
        end

        def check_abnormal_latencies(context)
          context[:abnormal_trace_logs] =
            context[:trace_logs].inject({}) do |r, (job_id, trace_log)|
              if trace_log[:latency] > job(context)[:abnormal_latency]
                r[job_id] = trace_log
              end
              r
            end
        end
      end
    end
  end
end
