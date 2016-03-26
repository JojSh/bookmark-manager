class BookmarkManager < Sinatra::Base

  get '/users/new' do
    @user = User.new
    erb(:"users/new")
  end

  post '/register' do
    @user = User.new(email: params[:email],
                       password: params[:pw],
                       password_confirmation: params[:pwc])
    # @users = User.all
    if @user.save #false if model is not saved to database
      session[:user_id] = @user.id
      redirect('/links')
    else
      flash.now[:errors] = @user.errors.full_messages
      erb(:"users/new")
    end
  end

end
