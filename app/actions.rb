require 'pry'
helpers do

  def current_user
    if session[:id] && user = User.find(session[:id])
      user
    end
  end

end

before do
  @flash = session[:flash]
  session.delete(:flash)
end

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

get '/trade_wall' do
  @books = Book.all

  erb :'books/trade_wall'
end

get '/book/new' do
  erb :'books/new'
end

post '/book/new' do

  @book = Book.new(
    title: params[:title],
    author: params[:author],
    genre: params[:genre],
    user_id: current_user.id,
  )

  if @book.save
    redirect '/trade_wall'
  else
    erb :index
  end


end

post '/login' do

  if @user = User.find_by_email(params[:email]).try(:authenticate, params[:password])
    session[:id] = @user.id
    redirect "/trade_wall"
  else
    @error = "Wrong email/password"
    erb :'users/login'
  end

end


post '/signup' do

  @user = User.new(
    email: params[:email],
    password: params[:password],
    first_name: params[:first_name],
    last_name: params[:last_name],
    #location: params[:location]
  )

  if @user.save
    session[:id] = @user.id
    session[:flash] = "Welcome!"
    redirect 'trade_wall'
  else
    erb :index
  end

end
