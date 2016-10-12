class Answer < ApplicationRecord
  # this line assumes that the answers table has a field called question_id
  # this gives us a handy method to fetch the associated question with an answer:
  # a = Answer.last
  # q = a.question
  belongs_to :question
  
  validates :body, presence: true, uniqueness: {scope: :question_id}
  validate :no_profanity

  PROFANE_WORDS = [
    'poo',
    'rooster',
    'poop',
    'stick',
    'ball',
    'balls',
    'php',
    'emacs'
  ]

  def no_profanity
    if /#{PROFANE_WORDS.join('|')}/ === body
      errors.add(StandardError.new(:body), "Don't be rude!")
    end
  end
end
