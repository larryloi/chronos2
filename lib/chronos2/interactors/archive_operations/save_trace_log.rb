# frozen-string-literal: true
module Chronos2
  module Interactors
    module ArchiveOperations
      class SaveTraceLog < Operation
        define_result

        pass :compose_trace_log
        step :save_trace_log

        def compose_trace_log(context)
          context[:trace_log] = trace_log(job(context))
        end

        alias_method :trace_repository, :replica

        def save_trace_log(context)
          trace_repository(context).run_sql(method(:create_trace_log),
                                            trace_log: context[:trace_log])

          trace_repository(context).run_sql(method(:upsert_trace),
                                            trace_log: context[:trace_log])
        end

        def target; :to_target; end

        protected

        def create_trace_log(db, trace_log:)
          db.from(:chronos_trace_logs).insert(trace_log)
        end

        def upsert_trace(db, trace_log:)
          unless db.from(:chronos_traces).where(:job_id => trace_log[:job_id]).all.empty?
            db.from(:chronos_traces)
              .where(:job_id => trace_log[:job_id])
              .update(:target => trace_log[:target], :type => trace_log[:type], :synced_at => trace_log[:synced_at], :traced_at => trace_log[:traced_at])
          else
            db.from(:chronos_traces)
              .insert(:job_id => trace_log[:job_id], :target => trace_log[:target], :type => trace_log[:type], :synced_at => trace_log[:synced_at], :traced_at => trace_log[:traced_at], :created_at =>     trace_log[:created_at])
          end

        end

        def trace_log(job)
          {
            id: ULID.generate,
            job_id: job[:id],
            target: job[target],
            type: job[:trace][:type],
            synced_at: job[:trace][:synced_at],
            traced_at: job[:trace][:traced_at],
            created_at: Time.now
          }
        end
      end
    end
  end
end
