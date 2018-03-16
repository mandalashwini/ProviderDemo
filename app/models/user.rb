class User < ApplicationRecord
    
   
    def self.connectToGmail
        require 'gmail'
        gmail=Gmail.connect(:xoauth2,User.email,User.token)
        puts "jj",gmail
    end
end
