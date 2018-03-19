class User < ApplicationRecord
    
    require 'rest-client'
    def self.loginGmail
        return self != nil ? Gmail.connect('ashwini.mandal@cuelogic.com','Cuelogic') : nil
    end

    def self.sendMail(gmail,usersData)
        email=gmail.compose do
                to "#{usersData[:to]}"
                subject "#{usersData[:subject]}"
                body "#{usersData[:content]}"
        end
         email.deliver! 
    end

    def self.sentMails(gmail)
        sent=gmail.labels.localize(:sent)
        puts "yyyy"
        puts gmail.mailbox(sent).emails[0].message
        binding.pry
       puts JSON.parse(gmail.mailbox(sent).emails[0].message)
      
    end

    def self.getMailDetails
      
        user=User.last
       # puts user[:token]
        #response = RestClient.get("https://www.googleapis.com/gmail/v1/users/#{user[:email]}/threads?labelIds=SENT&pageToken=2&maxResults=50&accessToken=#{user[:token]}")
        response = JSON.parse(RestClient.post 'https://accounts.google.com/o/oauth2/token', grant_type: 'refresh_token',
refresh_token:"#{user[:refreshtoken]}", client_id: '717036620525-f042ht0i5m4a42a4hr65m93ingvdt3rq.apps.googleusercontent.com',
client_secret: 'XGPQzwQGzIsTImllNsgOOgD4') 
        puts response
    end
end
