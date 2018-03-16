class MailOperations
    require 'gmail'
    def self.connectToMail
        gmail=Gmail.connect(:xoauth2,User.email,User.token)
        puts "jj",gmail
    end
end