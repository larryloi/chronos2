# frozen-string-literal: true
module Chronos2
  module Interactors
    module PurgeOperations
      class SaveTraceLog < ArchiveOperations::SaveTraceLog
        alias_method :trace_repository, :origin

        def target; :from_target; end
      end
    end
  end
end
