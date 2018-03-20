class BaseController < ApplicationController
	layout "base"
  def index
  end

  def create
        auth_hash=request.env['omniauth.auth']
        session[:uid]=auth_hash.uid
        puts "aaa",auth_hash
        expiresAt=User.setExpireAtFormat(auth_hash.credentials.expires_at)
          if auth_hash.credentials.refresh_token
          user=User.new(name:auth_hash.info[:name],email:auth_hash.info[:email],token:auth_hash.credentials.token,uid:auth_hash.uid,refreshtoken:auth_hash.credentials.refresh_token,expiresat:expiresAt)
          user.save
        else
          user=User.where(email:auth_hash.info[:email]).update(token:auth_hash.credentials.token,uid:auth_hash.uid,expiresat:expiresAt)
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
      #@gmail=User.loginGmail    
      #User.sentMails(@gmail) 
      if User.validateAccessToken == 1
        responseData=getAccessToken
        User.last.update(token:responseData,expiresat:Time.now_to_s)
      end      
  end 
end


