# frozen-string-literal: true
module Chronos2
  class Repository < Citrine::Repository[:sql]
    def default_migration_dir
      File.expand_path(File.join(File.dirname(__FILE__), 
                        "..", "..", "db", "migrations", "chronos"))
    end

    def default_migration_table
      "chronos_schema_info"
    end
  end
end
