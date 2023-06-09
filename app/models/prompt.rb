class Prompt < ActiveRecord::Base
  belongs_to :user

  validates :question, presence: true
  after_create :generate_answer

  private

  def generate_answer
    response = ChatGptService.new.generate_answer(question, 100)
    update(answer: response) if response.present?
  end

end
