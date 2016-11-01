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

Airport.create!(code: "NYC")
Airport.create!(code: "SFO")
Airport.create!(code: "ATL")
Airport.create!(code: "GSP")
Airport.create!(code: "LAX")
Airport.create!(code: "ORD")
Airport.create!(code: "MDW")
Airport.create!(code: "MIA")
Airport.create!(code: "CLT")

8.times do |n|
  t = Time.now
  departure = t + (n * 10)
  duration = 1 * n
  origin = Airport.all[n-1]
  destination = Airport.all[n]
  Flight.create!( departure: departure, 
                  duration: duration, 
                  origin: origin, 
                  destination: destination)
end
