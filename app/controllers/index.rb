get '/' do
  #Root
  if session[:user]!= nil
    erb :index
  else
    redirect "/sign_in"
  end
end

get '/sign_in' do
  erb :sign_in
end

get '/sign_up' do
  erb :sign_up
end

post '/sign_up' do
  user = User.create(email:params[:email], password:params[:password])
  session[:user] = user.id
  redirect "/"
end

post '/sign_in' do
  puts params[:password]
  user = User.find_by(email: params[:email])
    if user
      if user.password == params[:password]
        session[:user] = user.id
        redirect "/"
      end
    end
    @error ="wrong credentials"
        erb :sign_in
end

get '/sign_out' do
  erb :sign_out
end
post '/sign_out' do
  session.delete(:user)
  redirect "/"
end
