class BaseController < ApplicationController
	layout "base"
  def index
  end

  def create
    auth_hash=request.env['omniauth.auth']
    puts auth_hash
    puts "hfhghfd"
    puts auth_hash.info
    puts "yy",auth_hash.uid
    session[:token]=auth_hash.credentials.token
    session[:uid]=auth_hash.uid
    user=User.new(name:auth_hash.info[:name],email:auth_hash.info[:email],token:auth_hash.credentials.token,uid:auth_hash.uid)
    user.save

  end
  
  def destroy
   puts session[:uid]
    session[:uid]=nil
    puts "sdf"
    puts session[:uid]
    redirect_to root_path
  end


  def ckeditorView
  end
  
  def connectToMail
    require 'gmail'
    puts "hello"
    User.connectToGmail
     puts "rrr"
  end
end
