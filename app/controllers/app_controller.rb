require './config/environment'

class AppController < Sinatra::Base
  #skeleton put in place

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "timetoduel" #ENV.fetch('SESSION_SECRET')
  end

  get "/" do
    if logged_in?
      redirect "/users/#{current_user.id}"
    else
      erb :index
    end
  end


  helpers do
    def logged_in?
      !!session[:user_id]
    end

    def current_user
      @current_user ||= User.find(session[:user_id])
    end

    def authorized?(id)
      current_user.id == id
    end
  end


end
