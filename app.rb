require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/flash'
require 'sqlite3'
require 'carrierwave'
require 'carrierwave/orm/activerecord'
require 'mini_magick'
require './models'

enable :sessions
set :database, {adapter: 'sqlite3', database: 'resource.sqlite3'}

before do
  current_user
  @class = ""
end
before ["/feed","/profile"] do
  redirect "/" unless @current_user
end

# HOME
get '/' do
  erb :login
end
# Signup
get '/signup' do
  erb :signup
end
# Profile
get '/profile' do
  @class = "profile"
  @user = User.all
  erb :profile
end

get '/sources' do
  post = Source.new
  erb :feed
end

# Feed
get '/feed' do
    @sources = Source.all
    # @user = User.all
  erb :feed
end

# Login Post:
post '/' do
  user = User.find_by(username: params[:username])
  if user && user.password == params[:password]
    session[:user_id] = user.id
    flash[:message] = "Welcome Back!!"
    redirect '/profile'
  else
    flash[:message] = "Did you forget your account information?"
  end
  session[:user_id] = nil
end

# Sign Up Post
post '/users' do
  user = User.new(
    first: params[:first],
    last: params[:last],
    email: params[:email],
    username: params[:username],
    password: params[:password]
  )
  user.save
    redirect '/profile'
end

# Add Post
post '/profile' do
  post = Source.new(
    title: params[:title],
    link: params[:link],
    rtype: params[:rtype],
    image: params[:image],
    text: params[:text],
    theme: params[:theme],
    user_id: @current_user.id
  )
  post.save
    redirect back
end



get '/logout' do
  session[:user_id] = nil
  flash[:message] = "Logged Out"
  redirect '/'
end

def current_user
  @current_user = User.find(session[:user_id]) if session[:user_id]
end
