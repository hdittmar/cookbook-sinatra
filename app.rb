require "sinatra"
require "sinatra/reloader" if development?
require "pry-byebug"
require "better_errors"
require_relative "files/cookbook.rb"
require_relative "files/recipe.rb"

set :bind, '0.0.0.0'

configure :development  do
  use BetterErrors::Middleware
  BetterErrors.application_root = File.expand_path("..", __FILE__)
end

csv_file = File.join(__dir__, '/database/recipes.csv')
COOKBOOK = Cookbook.new(csv_file)


get '/' do
  @recipes = COOKBOOK.all
  erb :index
end

get '/recipe/:index' do
  @recipe = COOKBOOK.all[params[:index].to_i]
  erb :recipe
end

get '/edit' do
  erb :edit
end

get '/list' do
  erb :show
end

get '/add' do
  erb :add_form
end

post '/add' do
  @new_name = params[:name] #|| "testname"
  @new_desc = params[:desc] #|| "testdesc"
  @new_diff = params[:difficulty]
  @new_time = params[:time]
  COOKBOOK.add_recipe

  erb :postadd # , :locals => {'name' => new_name, 'desc' => new_desc}
end

get '/destroy' do
  erb :destroy
end

get '/mark' do
  erb :mark
end

get '/import' do
  erb :import
end
