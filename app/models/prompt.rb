class Prompt < ActiveRecord::Base
  belongs_to :user

  validates :question, presence: true
  validates :answer, presence: true

  after_create :generate_answer

  private

  def generate_answer
    response = ChatGPTService.new.generate_answer(question)
    update(answer: response) if response.present?
  end

end
