include RandomData

50.times do

    Post.create!(
        title: RandomData.random_sentence,
        body: RandomData.random_paragraph
    )
end
posts = Post.all
100.times do
    Comment.create!(
        post: posts.sample,
        body: RandomData.random_paragraph
        )
end

50.times do

  Advertisement.create!(
  title: RandomData.random_sentence,
  copy: RandomData.random_paragraph,
  price: rand(0..100)
  )
end
20.times do

  Question.create!(
  title: RandomData.random_sentence,
  body: RandomData.random_paragraph,
  resolved: false
  )
end
puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
puts "#{Advertisement.count} Ads Created!"
puts "#{Question.count} Questions created!"


Post.find_or_create_by(title: "Hello, everyone!", body: "Teodoro here!")
puts "#{Post.count} posts created!"
Advertisement.find_or_create_by(title: "Ad #1!", copy: "Yessir", price: 4)
puts "#{Advertisement.count} ads created!"
Question.find_or_create_by(title: "How are you?", body: "What did you do today?", resolved: false)
puts "#{Question.count} question created!"
