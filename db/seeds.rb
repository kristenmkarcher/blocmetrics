5.times do
  RegisteredApplication.create(
    name: Faker::App.name,
    url: Faker::Internet.url
  )
end
50.times do
  Event.create(
    name: Faker::Hipster.sentence,
    registered_application_id: RegisteredApplication.all.ids.sample
  )
end
puts "Seed finished"
puts "#{RegisteredApplication.count} registered applications created"
puts "#{Event.count} events created"
