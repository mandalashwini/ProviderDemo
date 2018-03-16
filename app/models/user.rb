class User < ApplicationRecord
    require 'gmail'
    

    def self.connectToGmail
       user=User.last
       gmail=Gmail.connect(:xoauth2,'ashwini.mandal@cuelogic.com',user[:token])
      # gmail=Gmail.connect('ashwini.mandal@cuelogic.com','Cuelogic')
       puts user[:email]
       puts user[:token]
       puts "jj",gmail.inspect
       
        
    end
end
