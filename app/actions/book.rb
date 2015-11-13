get '/book/new' do
  erb :'books/new'
end

post '/book/:id/remove' do
  @book = Book.find(params[:id])
  @book.remove
  @book.save
  redirect "/bookshelf#{current_user.id}"
end

post '/book/new' do

  @book = Book.new(
    title: params[:title],
    author: params[:author],
    genre: params[:genre],
    user_id: current_user.id
  )

  if @book.save
    redirect '/trade_wall'
  else
    erb :index
  end

end
