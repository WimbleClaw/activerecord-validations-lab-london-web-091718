class Post < ActiveRecord::Base
  #ActiveModel::Validator

  validates :title, presence: true

  validates :content, length: { minimum: 10 }

  validates :summary, length: {maximum: 100}

  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}

  validate :clickbate


  def clickbate
    words = [/Won't Believe/i, /Secret/i, /Top
    [1-100]*/i, /Guess/i]
    included = words.any? {|word| word.match title}
    if !included
      errors.add(:title, "needs to be clickbait-y")
    end
  end
end
