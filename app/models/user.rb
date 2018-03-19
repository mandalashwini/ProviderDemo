class User < ApplicationRecord
    
    def self.loginGmail
        return self != nil ? Gmail.connect('ashwini.mandal@cuelogic.com','Cuelogic') : nil
    end

    def self.sendMail(gmail,usersData)
        email=gmail.compose do
                to "#{usersData[:to]}"
                subject "#{usersData[:subject]}"
                body "#{usersData[:content]}"
        end
       if  email.deliver! 
        puts "success"
       else
        puts "fail.."
       end
    end
end
