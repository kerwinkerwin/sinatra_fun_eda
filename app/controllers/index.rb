get '/' do
   if session[:user]
     erb :index
   else
     erb :sign_in
   end
end

get '/sign_in' do
  erb :sign_in
end

get '/sign_up' do
  erb :sign_up
end

post '/sign_up' do
  if(User.find_by(email:params[:email]))
    @error = "sorry that email is already registered"
    erb :sign_up
  else
    @user = User.create(email:params[:email],password:params[:password])
    session[:user] = @user
    erb :index
  end
end

post '/sign_in' do
  puts params[:email]
  puts params[:password]
  @user = User.find_by(email:params[:email])
  puts @user
  if @user
    if @user.password != params[:password]
      @error = "wrong credentials"
      erb :sign_in
    else
      session[:user] = @user
      erb :index
    end
  else
    @error="please enter email"
    erb :sign_in
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
