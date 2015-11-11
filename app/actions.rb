get '/' do
  erb :index
end

helpers do

  def current_user

    if session[:id] and user = User.find(session[:id])
      user
    end

  end
end

post '/signup' do

  @user = User.new(
    email: params[:email],
    password: params[:password],
    first_name: params[:first_name],
    last_name: params[:last_name],
    location: params[:location]
  )

  if user.save

    redirect '/trade_wall'

  else

    erb:index

  end
end
