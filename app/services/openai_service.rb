require "openai"

class OpenaiService
  attr_reader :client, :prompt
  attr_writer :filter

  def initialize(prompt, filter)
    @client = OpenAI::Client.new
    @prompt = prompt
    @filter = filter
  end

  def call
    filter = "GIVE THE EXPLANATION, NOT THE ANSWER"
    response = client.chat(
      parameters: {
          model: "gpt-3.5-turbo",
          messages: [{ role: "user", content: "#{prompt} - #{filter}"],
          temperature: 0.7,
          stream: false,
          max_tokens: 100
      })
    return response["choices"][0]["message"]["content"]
  end
end
