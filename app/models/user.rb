class User < ApplicationRecord
    require 'gmail'
   
    def self.connectToGmail
        gmail=Gmail.connect(:xoauth2,User.email,User.token)
        puts "jj",gmail
    end
end
