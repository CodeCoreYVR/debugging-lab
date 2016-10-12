QUESTIONS_TO_CREATE = 250

def create_answer
  Answer.create(body: Faker::Pokemon.name)
end

QUESTIONS_TO_CREATE.times do
    Question.create title:      Faker::StarWars.quote,
                    body:       Faker::Hipster.paragraph,
                    view_count: rand(100)
end

Question.all.each do |question|
  rand(2..4).times do
    question.answers << create_answer
  end
end

puts Cowsay.say "Created #{QUESTIONS_TO_CREATE} questions"
