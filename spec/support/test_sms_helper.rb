module TestSmsHelper
  Message = Struct.new(:from, :to, :body)

  # idea from: https://robots.thoughtbot.com/testing-sms-interactions
  class MockTwilioSms
    cattr_accessor :messages
    self.messages = []

    def messages
      self
    end

    def create(from:, to:, body:)
      new_message = Message.new(from, to, body)
      self.class.messages << new_message
      new_message
    end
  end

end
