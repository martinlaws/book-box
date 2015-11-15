get '/' do

  if @user = current_user
    redirect '/trade_wall'
  else
    redirect '/login'
  end

end

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
  @user = User.find_by(email: params[:email])

  if @user && @user.authenticate(params[:password])
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
  )

  if @user.save
    @user.set_location(:address => params[:address])
    session[:id] = @user.id
    session[:flash] = "Welcome, #{@user.first_name}!"
    redirect 'trade_wall'
  else
    erb :'users/signup'
  end

end

post '/edit_profile' do
  @user.email = params[:email]
  @user.password = params[:password]
  @user.set_location(:address => params[:address])
  if @user.save
    session[:id] = @user.id
    session[:flash] = "Profile info changed successfully, #{@user.first_name}!"
    redirect 'trade_wall'
  else
    erb :'users/edit_profile'
  end
end