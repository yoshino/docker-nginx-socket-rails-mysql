10.times do |n|
  User.create!(name: "name#{n}", email: "test#{n}@example.com")
end
