get '/:id/bookshelf' do
  erb :'users/bookshelf'
end

put '/book:id/repost' do
  @book = Book.find(params[:id])
  @book.make_available
  @book.save

  redirect "/#{current_user.id}/bookshelf"
end

put '/book:id/remove' do
  @book = Book.find(params[:id])
  @book.make_unavailable
  @book.save

  redirect "/#{current_user.first_name}/bookshelf"
end
