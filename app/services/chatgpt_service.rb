class ChatGPTService
  include HTTParty
  base_uri 'https://api.openai.com/v1'
  headers 'Content-Type' => 'application/json'
  headers 'Authorization' => "Bearer #{ENV['OPENAI_API_KEY']}"

  def initialize
    @path = '/chat/completions'
  end

  def generate_answer(question, length)
    response = self.class.post(
      @path,
      body: {
        'model' => 'gpt-3.5-turbo',
        'messages' => [{ 'role' => 'system', 'content' => 'You are a helpful assistant.' }, { 'role' => 'user', 'content' => question }],
        'max_tokens' => length,
        'stop' => ['\n', 'User:', 'Assistant:']
      }.to_json
    )
    response['choices'].first['message']['content'] if response['choices']
  rescue StandardError => e
    # Handle the error, log the details, or raise a custom exception
    puts "API request failed: #{e.message}"
    nil
  end
end
