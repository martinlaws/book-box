get '/location' do
  erb :'location/new'
end

post '/location/new' do

  @location = Location.new(
    address: params[:address]
  )

  if @location.save
    redirect '/'
  end

end
