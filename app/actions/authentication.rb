get '/login' do
  erb :'users/login'
end

get '/signup' do
  erb :'users/signup'
end

get '/logout' do

  session.clear
  redirect "/login"

end

post '/login' do

  if @user = User.find_by_email(params[:email]).try(:authenticate, params[:password])
    session[:id] = @user.id
    redirect "/trade_wall"
  else
    session[:flash] = "Wrong email/password"
    erb :'users/login'
  end

end


post '/signup' do

  @user = User.new(
    email: params[:email],
    password: params[:password],
    first_name: params[:first_name],
    last_name: params[:last_name],
    latitude: params[:latitude],
    longitude: params[:longitude]
  )

  if @user.save
    session[:id] = @user.id
    session[:flash] = "Welcome, #{@user.first_name}!"
    redirect 'trade_wall'
  else
    erb :index
  end

end
get '/' do

  if @user = current_user
    redirect '/trade_wall'
  else
    redirect '/login'
  end

end

