User.destroy_all
Project.destroy_all
puts "DB cleaned!"

project_photos = [
  'https://images.unsplash.com/photo-1525201548942-d8732f6617a0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8Z3VpdGFyfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60',
  'https://images.unsplash.com/photo-1558098329-a11cff621064?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8Z3VpdGFyfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60',
  'https://images.unsplash.com/photo-1594643357134-1baf950059e2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8N3x8aG9iYmllc3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60',
  'https://images.unsplash.com/photo-1598815272841-4e85a77e0a67?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8aG9iYmllc3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60',
  'https://images.unsplash.com/photo-1596364725424-7673f05f64b1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTF8fGhvYmJpZXN8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60',
  'https://images.unsplash.com/photo-1584992236310-6edddc08acff?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTJ8fGhvYmJpZXN8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60',
  'https://images.unsplash.com/photo-1610558128766-64f6b95ba135?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fGhvYmJpZXN8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60',
  'https://images.unsplash.com/photo-1621781727164-8121aec35c88?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTl8fGhvYmJpZXN8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60',
]

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
  project = Project.create!(
    title: Faker::Lorem.paragraph(sentence_count: 1),
    description: Faker::Lorem.paragraph(sentence_count: 15),
    location: Faker::Address.city,
    category_id: 1,
    user_id: User.all.sample.id
  )
  file1 = URI.open(project_photos.sample)
  file2 = URI.open(project_photos.sample)
  file3 = URI.open(project_photos.sample)
  file4 = URI.open(project_photos.sample)
  file5 = URI.open(project_photos.sample)

  project.photos.attach([{ io: file1, filename: project.title, content_type: 'image/jpeg' },
    { io: file2, filename: project.title, content_type: 'image/jpeg' },
    { io: file3, filename: project.title, content_type: 'image/jpeg' },
    { io: file4, filename: project.title, content_type: 'image/jpeg' },
    { io: file5, filename: project.title, content_type: 'image/jpeg' }]
  )
end

puts "projects #{Project.count} created"
