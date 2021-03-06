class InstallSomeContribPackages < ActiveRecord::Migration
  def up
  	execute "CREATE EXTENSION unaccent;"
    execute "CREATE EXTENSION pg_trgm;"
    execute "CREATE EXTENSION fuzzystrmatch;"
  end

  def down
  	execute "DROP EXTENSION unaccent;"
    execute "DROP EXTENSION pg_trgm;"
    execute "DROP EXTENSION fuzzystrmatch;"
  end
end
