get '/' do
   if session[:user] != nil
     puts "index"
     erb :index

   else
     erb :sign_in
   end
end

post '/sign_in' do
  @user = User.find_by(email:params[:email])
  if @user.password != params[:password]
    @error = "wrong credentials"
    erb :sign_in
  else
    session[:user] = @user
    puts session[:user]
    erb :index
  end
end

get '/sign_out' do
  session.delete(:user)
  redirect "/"
end
post '/sign_out' do
  session.delete(:user)
  redirect "/"
end
