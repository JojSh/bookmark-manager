require 'sinatra/base'
ENV['RACK_ENV'] ||= 'development'
require_relative 'data_mapper_setup'

class BookmarkManager < Sinatra::Base

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
    User.create(email: params[:address], password: params[:pw])
    @users = User.all
    p @users.first.email
    redirect('/links')
  end


  post '/add_link' do
    link = Link.create(title: params[:title], url: params[:url])
    params[:tags].split.each { |tag| link.tags.create(tag_name: tag ) }



    #.split(" ")
    # tags = params[:tags].split(" ")
    # tags.each {|tag| link.tags.create(tag_name: tag)}
    # @string = tags.join(", ")
    redirect(:links)
  end

  get '/tags/:name' do
    tag = Tag.first(tag_name: params[:name])
    @links = tag ? tag.links : []
    erb(:links)
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
