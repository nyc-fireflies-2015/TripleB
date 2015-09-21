
class TextMessage < ActiveRecord::Base

  def self.config
    twilio_sid = 'ACd5d81589e2835930ec8dd5d2099d4e93'
    twilio_token = '5c05cc9d90d20d5a5968d6a848b5d9cb'
    twilio_phone_number = '+19292003142'
    @client = Twilio::REST::Client.new(twilio_sid,twilio_token)
  end

  def self.send_to_mechanic(user,mech_number,user_number,distance,duration)
    self.config
    @client.account.messages.create({
      :from => '+19292003142',
      :to => '+1' + mech_number,
      :body => "Thanks for offering to help, you are #{distance} away from #{user}. Your trip duration is #{duration}. Get in touch with them by texting #{user_number}",
    })
  end

  def self.send_to_user(mechanic,mech_number,user_number,distance,duration)
    self.config
    @client.account.messages.create({
      :from => '+19292003142',
      :to => '+1' + user_number,
      :body => "Help is on the way, #{mechanic} is #{distance} away. Estimated trip time is #{duration} Get in touch with them by texting #{mech_number}.",
    })
  end

end