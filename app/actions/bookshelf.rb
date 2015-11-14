get '/:id/bookshelf' do
  erb :'users/bookshelf'
end

put '/book:id/repost' do
  @book = Book.find(params[:id])
  @book.make_available
  @book.save

  erb :'/users/bookshelf'
end

put '/book:id/remove' do
  @book = Book.find(params[:id])
  @book.make_unavailable
  @book.save

  erb :'/users/bookshelf'
end

