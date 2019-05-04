require 'sinatra'
require 'sinatra/contrib' #the reloader package
require 'sinatra/reloader' if development?
require_relative './model/post'
require 'pg'
require_relative './controllers/posts_controller'
use Rack::MethodOverride
run PostController
