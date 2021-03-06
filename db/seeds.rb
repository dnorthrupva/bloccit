include RandomData

 # Create Users
 5.times do
   user = User.create!(
 # #3
   name:     RandomData.random_name,
   email:    RandomData.random_email,
   password: RandomData.random_sentence,
   role: 'member'
   )
 end
 users = User.all

#Create topics
15.times do
    Topic.create!(
    name: RandomData.random_sentence,
    description: RandomData.random_paragraph
  )
end
topics = Topic.all

  #Create Posts
50.times do

    post = Post.create!(
       user:   users.sample,
        topic: topics.sample,
        title: RandomData.random_sentence,
        body: RandomData.random_paragraph
    )
    post.update_attribute(:created_at, rand(10.minutes .. 1.year).ago)

   rand(1..5).times { post.votes.create!(value: [-1, 1].sample, user: users.sample) }

end
posts = Post.all

#Create Comments
100.times do
        Comment.create!(
        user: users.sample,
        post: posts.sample,
        body: RandomData.random_paragraph
        )
end

#Create Ads
50.times do

  Advertisement.create!(
  title: RandomData.random_sentence,
  copy: RandomData.random_paragraph,
  price: rand(0..100)
  )
end

#Create Questions
20.times do

  Question.create!(
  title: RandomData.random_sentence,
  body: RandomData.random_paragraph,
  resolved: false
  )
end

#Create Sponsored_Post
50.times do

        SponsoredPost.create!(
          topic: topics.sample,
        title: RandomData.random_sentence,
        body: RandomData.random_sentence,
        price: rand(0..100)
    )
end

 # Create an admin
 admin = User.create!(
   name:     'Admin User',
   email:    'admin@example.com',
   password: 'helloworld',
   role:     'admin'
 )
 
 # Create a member
 member = User.create!(
   name:     'Member User',
   email:    'member@example.com',
   password: 'helloworld'
 )

# Create a Mod
member = User.create!(
    name:   'Mod User',
    email:   'mod@example.com',
    password: 'helloworld',
    role:       'moderator'
    )

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Post.count} posts created"
puts "#{Topic.count} topics created!"
puts "#{Comment.count} comments created"
puts "#{Advertisement.count} Ads Created!"
puts "#{Question.count} Questions created!"
puts "#{SponsoredPost.count} SponsoredPost Added!"
puts "#{Vote.count} votes created"


Post.find_or_create_by(title: "Hello, everyone!", body: "Teodoro here!")
puts "#{Post.count} posts created!"
Advertisement.find_or_create_by(title: "Ad #1!", copy: "Yessir", price: 4)
puts "#{Advertisement.count} ads created!"
Question.find_or_create_by(title: "How are you?", body: "What did you do today?", resolved: false)
puts "#{Question.count} question created!"
