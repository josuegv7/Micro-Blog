require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/flash'
require 'sqlite3'
require './models'

enable :sessions
set :database, {adapter: 'sqlite3', database: 'resource.sqlite3'}

before do
  current_user
end

# HOME
get '/' do
  erb :login
end

# signup
get '/signup' do
  erb :signup
end

# profile
get '/profile' do
  erb :profile
end

# feed
get '/feed' do
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
    flash[:message] = "Ooops, did you forget your account information?  I don't recognize that user/pass combo."
  end
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
    redirect '/'
end


# Add Post
post '/sources' do
  post = Source.new(
    title: params[:title],
    link: params[:link],
    rtype: params[:rtype],
    image: params[:image],
    text: params[:text],
    theme: params[:theme]
  )
  post.save
    redirect '/feed'
end

def current_user
  @current_user = User.find(session[:user_id]) if session[:user_id]
end
