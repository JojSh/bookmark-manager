require 'sinatra/base'
ENV['RACK_ENV'] ||= 'development'
require_relative 'data_mapper_setup'
require 'sinatra/flash'

class BookmarkManager < Sinatra::Base

  enable :sessions
  register Sinatra::Flash
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
    @user = User.new
    erb(:sign_up)
  end

  post '/register' do
    @user = User.new(email: params[:email],
                       hash_password: params[:pw],
                       password_confirmation: params[:pwc])
    # @users = User.all
    if @user.save #false if model is not saved to database
      session[:user_id] = @user.id
      redirect('/links')
    else
      flash.now[:errors] = @user.errors.full_messages
      erb(:sign_up)
    end
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
