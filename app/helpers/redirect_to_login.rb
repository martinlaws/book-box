before '/trade_wall' do

  unless current_user
    redirect '/login'
  end

end

before '/users*' do

  unless current_user
    redirect '/login'
  end

end
