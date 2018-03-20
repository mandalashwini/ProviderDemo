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
        puts gmail.mailbox(sent).emails[0]
    end

    def self.validateAccessToken
            user=User.last
         timeDiff=((user.expiresat.to_time)-Time.now).to_i 
           time=timeDiff/3600
    end

    def self.setExpireAtFormat(expiresAt)
        time=expiresAt.to_i
        expires_at=Time.at(time)
    end


    def self.getAccessToken
      
        user=User.last
        response = JSON.parse(RestClient.post 'https://accounts.google.com/o/oauth2/token', grant_type: 'refresh_token',
refresh_token:"#{user[:refreshtoken]}", client_id: '717036620525-f042ht0i5m4a42a4hr65m93ingvdt3rq.apps.googleusercontent.com',
client_secret: 'XGPQzwQGzIsTImllNsgOOgD4') rescue nil
         response['access_token']
    end
       
    
    
    def self.getMailThreads
            user=User.last
            email=user.email
            token=user.token
        response = RestClient.get("https://www.googleapis.com/gmail/v1/users/#{email}/threads?labelIds=SENT&access_token=#{token}")
        puts response
     end
     def userLogin
        puts
     end
end
