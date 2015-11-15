get '/user/:id' do
  @user = User.find(params[:id])
  erb :'users/show'
end

get "/:id/edit" do
  erb :'/users/edit_profile'
end

put "/:id/edit" do
  @user = User.find(params[:id])
  @user.update(
    email: params[:email],
    password: params[:password],
    first_name: params[:first_name],
    last_name: params[:last_name],
    location: params[:location]
  )
end
