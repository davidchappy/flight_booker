# Clear all DB tables when seeding
if Rails.env.development?
  ActiveRecord::Base.establish_connection
  ActiveRecord::Base.connection.tables.each do |table|
    next if table == 'schema_migrations'

    # MySQL and PostgreSQL
    ActiveRecord::Base.connection.execute("TRUNCATE #{table}")

    # SQLite
    # ActiveRecord::Base.connection.execute("DELETE FROM #{table}")
  end
end

