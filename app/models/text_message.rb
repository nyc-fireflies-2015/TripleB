class TextMessage < ActiveRecord::Base

  def self.send
    twilio_sid = 'ACd5d81589e2835930ec8dd5d2099d4e93'
    twilio_token = '5c05cc9d90d20d5a5968d6a848b5d9cb'
    twilio_phone_number = '+19292003142'
    @client = Twilio::REST::Client.new(twilio_sid,twilio_token)

    @client.account.messages.create({
      :from => '+19292003142',
      :to => '+19542950857',
      :body => 'hello this is another test',
})
  end

end