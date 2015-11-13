get '/trade_wall' do
  @books = Book.where('user_id != ?', session[:id]).includes(:user)

  erb :'books/trade_wall'
end


post '/trade/new:id' do

  @book = Book.find(params[:id])

  @trade = Trade.new(
    book_id: @book.id,
    posting_user: @book.user_id,
    receiving_user: current_user.id,
  )

  if @trade.save
    @book.availability = false
    @book.save
    redirect '/trade_wall'
  else
    redirect '/trade_wall'
  end

end

put '/accept_trade:id' do
  @trade = Trade.find(params[:id])
  @book = Book.find(@trade.book_id)

  @trade.status = "completed"
  @book.user_id = @trade.receiving_user
  @book.save
  @trade.save

  erb :'users/bookshelf'
end

put '/decline_trade:id' do
  @trade = Trade.find(params[:id])

  if @trade
    @book = Book.find(@trade.book_id)
    @book.availability = true
    @book.save

    @trade.delete

    erb :'users/bookshelf'
  else
    erb :'users/bookshelf'
  end

end
