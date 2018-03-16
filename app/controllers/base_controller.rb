class BaseController < ApplicationController
	layout "base"
  def index
  end

  def create
    auth_hash=request.env['omniauth.auth']
    session[:uid]=auth_hash.uid
    puts auth_hash
    puts "token",auth_hash.credentials.token
    #puts "token".auth_hash.credentials.refresh_token
    puts "email",auth_hash.info[:email]
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
    puts "oo"
  end
  
  def connectToMail
    puts "yyy"
    User.connectToGmail
    puts "rrr"
  end
  
end
