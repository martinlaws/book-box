get '/bookshelf:id' do
  erb :'users/bookshelf'
end

put '/book:id/repost' do
  @book = Book.find(params[:id])
  @book.availability = true
  @book.save

  erb :'/users/bookshelf'
end

put '/book:id/remove' do
  @book = Book.find(params[:id])
  @book.availability = false
  @book.save

  erb :'/users/bookshelf'
end

