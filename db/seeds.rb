
User.destroy_all
Project.destroy_all
Skill.destroy_all
Category.destroy_all
puts "DB cleaned!"
# user = User.create!(email: "dummy@gmail.com", password: "123456", first_name: "Dummy", last_name: "2.0", user_name: "I_am_a_Dummy")

avatars = [
  'https://images.unsplash.com/photo-1491349174775-aaafddd81942?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8cGVyc29ufGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60',
  'https://images.unsplash.com/photo-1500048993953-d23a436266cf?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTJ8fHBlcnNvbnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60',
  'https://images.unsplash.com/photo-1580489944761-15a19d654956?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTd8fHBlcnNvbnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60',
  'https://images.unsplash.com/photo-1599566150163-29194dcaad36?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTZ8fHBlcnNvbnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60',
  'https://images.unsplash.com/photo-1567532939604-b6b5b0db2604?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzF8fHBlcnNvbnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60'
]


projects = [
  'https://images.unsplash.com/photo-1522410818928-5522dacd5066?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2370&q=80',
  'https://images.unsplash.com/photo-1588591795084-1770cb3be374?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2370&q=80',
  'https://images.unsplash.com/photo-1598815272841-4e85a77e0a67?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80',
  'https://images.unsplash.com/photo-1594643357134-1baf950059e2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1365&q=80',
  'https://images.unsplash.com/photo-1493711662062-fa541adb3fc8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2370&q=80'
]

1.times do
  user = User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    username: Faker::Name.first_name,
    email: "dummy@gmail.com",
    password: 123456,
    location: Faker::Address.city,
    bio: Faker::Lorem.paragraph(sentence_count: 12),
    birthday:Faker::Date.birthday
  )
  file1 = URI.open(avatars.sample)
  user.photo.attach(io: file1, filename: user.username, content_type: 'image/jpeg')
end

puts "user #{User.count} created"



category = Category.create(name: "Gardening")
category2 = Category.create(name: "Fishing")
category3 = Category.create(name: "Playing")
category4 = Category.create(name: "Community")
category5 = Category.create(name: "Web Development")
category6 = Category.create(name: "Crypto Currencies")

3.times do
  project =  Project.create!(
    title: Faker::Lorem.paragraph(sentence_count: 1),
    description: Faker::Lorem.paragraph(sentence_count: 15),
    location: Faker::Address.city,
    category_id: category.id,
    user_id: User.all.sample.id
  )
  file1 = URI.open(projects.sample)
  file2 = URI.open(projects.sample)


  project.photos.attach([{ io: file1, filename: project.title, content_type: 'image/jpeg' },
    { io: file2, filename: project.title, content_type: 'image/jpeg' }])
end

15.times do
  Skill.create!(
    name: Faker::Hobby.activity,
  )
end

puts "projects #{Project.count} created"
