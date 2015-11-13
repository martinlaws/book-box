get '/trade_wall' do
  @books = Book.all

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
    redirect '/trade_wall'
  else
    erb :index
  end

end

