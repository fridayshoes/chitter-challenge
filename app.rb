require 'sinatra/base'
require 'sinatra/reloader'
require './lib/peeps'
require './lib/users'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb :index
  end

  get '/peeps' do
    # @peeps = [
    #   "hello everyone",
    #   "Still got this bloomin lurgy and high temperature.",
    #   "Why is he sniffing so much?",
    #   "I am in the curry house",
    # ]
    @peeps = Peeps.all
    erb :'peeps/peep_list'
  end

  # posts the signup data from the signup form
  post '/signup' do
    User.create(name: params[:name], username: params[:username], email: params[:email], password: params[:password])
    redirect '/login'
  end

  # gets the signup data from the signup form
  get '/signup' do

  end

  get '/login' do
    erb :login
  end

  run! if app_file == $0
end