require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/flash'
require 'sqlite3'
require 'carrierwave'
require 'carrierwave/orm/activerecord'
require './models'

enable :sessions
set :database, {adapter: 'sqlite3', database: 'resource.sqlite3'}


# Will set a session number for the current_user
before do
  current_user
  @class = ""
end

# Wont allow acess to these pages unless signed in.
before ["/feed","/profile"] do
  redirect "/" unless @current_user
end

# Getting all the pages:
# Home
get '/' do
  erb :login
end
# Signup
get '/signup' do
  erb :signup
end
# Profile
get '/profile' do
  # @class = "profile"
  @user = User.all
  erb :profile
end
# Edit profile
get '/editprofile' do
  @user = @current_user
  erb :editprofile
end
# Feed
get '/feed' do
    # @sources = Source.all
    @sources = @current_user.sources
    @comment = Comment.all
    # @user = User.all
  erb :feed
end
# Public Feed
get '/publicfeed' do
    @sources = Source.all
    @user = User.all
    @comment = Comment.all
  erb :publicfeed
end

# get '/feed/:user_id' do
#   @sources = User.find(params[:user_id]).sources
#   erb :feed
# end

# Login: Checks the login info to database and creats a session
post '/' do
  user = User.find_by(username: params[:username])
  if user && user.password == params[:password]
    session[:user_id] = user.id
    flash[:message] = "Welcome!"
    redirect '/profile'
  else
    flash[:message] = "Wrong account information"
  end
  session[:user_id] = nil
end
#==================================
# ===Logout==========
get '/logout' do
  session[:user_id] = nil
  flash[:message] = "Logged Out"
  redirect '/'
end

# ============

# Sign Up: create new user to the database
post '/users' do
  @user = User.new(
    first: params[:first],
    last: params[:last],
    email: params[:email],
    username: params[:username],
    password: params[:password]
  )
  @user.save
    redirect '/profile'
end
# ========================
# Edit profile: update information for a current user
post '/useredit' do
  @current_user.update(
      first: params[:first],
      last: params[:last],
      email: params[:email],
      username: params[:username],
      password: params[:password]
  )
    redirect '/profile'
end
# ================================

# Add Post to feed page ==========
post '/profile' do
  @post = Source.new(
    title: params[:title],
    link: params[:link],
    image: params[:image],
    text: params[:text],
    theme: params[:theme],
    user_id: @current_user.id
  )
  @post.save
    redirect back
end

# Add comment to a post on the feed:
post '/addcomment' do
  @comment = Comment.new(
    comment: params[:comment]
  )
  @comment.save
  redirect back
end
# ===========================

#===== Delete action ==========
delete '/profile/:id' do
  user = User.find(params[:id])
  user.profile.destroy
  session[:user_id]=nil
  redirect to '/login'
end

# ===================

def current_user
  @current_user = User.find(session[:user_id]) if session[:user_id]
end
