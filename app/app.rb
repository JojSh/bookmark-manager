require 'sinatra/base'
ENV['RACK_ENV'] ||= 'development'
require_relative 'data_mapper_setup'

class BookmarkManager < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'

  get '/' do
    erb(:homepage)
  end

  get '/links' do
    @links = Link.all
    @users = User.all
    erb(:links)
  end

  get '/add_link' do
    erb(:add_link)
  end

  get '/sign_up' do
    erb(:sign_up)
  end

  post '/register' do
    user = User.create(email: params[:address], hash_password: params[:pw])
    @users = User.all
    session[:user_id] = user.id
    # p @users.first.email
    redirect('/links')
  end

  post '/add_link' do
    link = Link.create(title: params[:title], url: params[:url])
    params[:tags].split.each { |tag| link.tags.create(tag_name: tag ) }
    redirect(:links)
  end

  get '/tags/:name' do
    tag = Tag.first(tag_name: params[:name])
    @links = tag ? tag.links : []
    erb(:links)
  end

  helpers do
    def this_user
      @this_user ||= User.get(session[:user_id])
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
