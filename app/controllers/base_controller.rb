class BaseController < ApplicationController
	layout "base"
  def index
  end

  def create
    auth_hash=request.env['omniauth.auth']
    session[:uid]=auth_hash.uid
    puts auth_hash
    puts "token",auth_hash.refresh_token
    
    puts "refresh_token",auth_hash.credentials.refresh_token
    puts "email",auth_hash.info[:email]
    if auth_hash.credentials.refresh_token
      user=User.new(name:auth_hash.info[:name],email:auth_hash.info[:email],token:auth_hash.credentials.token,uid:auth_hash.uid,refreshtoken:auth_hash.credentials.refresh_token)
      user.save
    else
      user=User.new(name:auth_hash.info[:name],email:auth_hash.info[:email],token:auth_hash.credentials.token,uid:auth_hash.uid)
    user.save
    end
    

  end
  
  def destroy
   puts session[:uid]
    session[:uid]=nil
    puts session[:uid]
    redirect_to root_path
  end


  def ckeditorView
    puts "oo"
  end
  
  def connectToMail
    @gmail=User.loginGmail    
    if User.sendMail(@gmail,params[:users])
      render 'mailSuccessMsg'
    end
  end

  def displaySentMail
      @gmail=User.loginGmail    
      User.sentMails(@gmail)     
  end

  

  
end
