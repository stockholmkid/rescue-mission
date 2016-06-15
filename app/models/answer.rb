class Answer < ActiveRecord::Base
  belongs_to :question
  validates :response, presence: true, length: { minimum: 50}
  validates :question, presence: true
end
