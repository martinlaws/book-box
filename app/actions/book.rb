get '/book/new' do
  erb :'books/new'
end

post '/book/:id/remove' do
  @book = Book.find(params[:id])
  @book.remove
  @book.save
  redirect "/bookshelf#{session[:id]}"
end

post '/book/new' do

  @book = Book.new(
    title: params[:title],
    author: params[:author],
    genre: params[:genre],
    user_id: session[:id]
  )

  if @book.save
    redirect "/#{current_user.first_name}/bookshelf"
  else
    erb :'books/new'
  end

end

get '/book/:title' do
  @book = Book.find_by(title: params[:title])
  erb :'books/show'
end
