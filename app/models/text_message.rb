class TextMessage < ActiveRecord::Base

  def self.send(mechanic_phone)
    twilio_sid = 'ACd6d900e07f5493c3464583803fbbf7a7'
    twilio_token = '86a4f4637d6d43209027ea628c885e49'
    twilio_phone_number = '+19292003142'
    @client = Twilio::Rest::Client.new(twilio_sid,twilio_token)

    @client.account.sms.messages.create(
      from: twilio_phone_number,
      to: mechanic_phone,
      body: "This is a test from george"
      )
  end

end