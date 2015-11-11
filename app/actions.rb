get '/' do
  if @user = current_user
    redirect '/posts'
  else
    redirect '/login'
  end
end

get '/login'
  erb :'/users/login'
end

helpers do
  def current_user
    if session[:id] && user = User.find(session[:id])
      user
    end
  end # ends current_user helper method
end # ends helpers

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
    erb :index
  end
end
