# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Project.destroy_all
puts "DB cleaned!"
# user = User.create!(email: "dummy@gmail.com", password: "123456")

# guitar-photos = [
#   'https://images.unsplash.com/photo-1525201548942-d8732f6617a0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8Z3VpdGFyfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60',
#   'https://images.unsplash.com/photo-1558098329-a11cff621064?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8Z3VpdGFyfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60',
# ]

avatars = [
  'https://images.unsplash.com/photo-1491349174775-aaafddd81942?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8cGVyc29ufGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60',
  'https://images.unsplash.com/photo-1500048993953-d23a436266cf?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTJ8fHBlcnNvbnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60',
  'https://images.unsplash.com/photo-1580489944761-15a19d654956?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTd8fHBlcnNvbnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60',
  'https://images.unsplash.com/photo-1599566150163-29194dcaad36?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTZ8fHBlcnNvbnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60',
  'https://images.unsplash.com/photo-1567532939604-b6b5b0db2604?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzF8fHBlcnNvbnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60'
]

5.times do
  user = User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    username: Faker::Name.first_name,
    email: Faker::Internet.email,
    password: 123456,
    location: Faker::Address.city,
    bio: Faker::Lorem.paragraph(sentence_count: 12),
    birthday:Faker::Date.birthday
  )
  file1 = URI.open(avatars.sample)
  user.photo.attach(io: file1, filename: user.username, content_type: 'image/jpeg')
end

puts "user #{User.count} created"

10.times do
  project =  Project.create!(
    title: Faker::Lorem.paragraph(sentence_count: 1),
    description: Faker::Lorem.paragraph(sentence_count: 15),
    location: Faker::Address.city,
    category_id: 1,
    user_id: User.all.sample.id
  )
  file1 = URI.open(avatars.sample)
  file2 = URI.open(avatars.sample)
  file3 = URI.open(avatars.sample)
  file4 = URI.open(avatars.sample)
  file5 = URI.open(avatars.sample)

  project.photos.attach([{ io: file1, filename: project.title, content_type: 'image/jpeg' },
    { io: file2, filename: project.title, content_type: 'image/jpeg' },
    { io: file3, filename: project.title, content_type: 'image/jpeg' },
    { io: file4, filename: project.title, content_type: 'image/jpeg' },
    { io: file5, filename: project.title, content_type: 'image/jpeg' }])
end

puts "projects #{Project.count} created"
