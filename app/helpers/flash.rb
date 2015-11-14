before do
  @flash = session[:flash]
  session.delete(:flash)
end

