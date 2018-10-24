require 'sinatra/base'
require './lib/bookmark'


class BookmarkManager < Sinatra::Base
  get '/' do
    erb :'bookmarks/index'
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :'bookmarks/bookmark'
end

 get '/add-bookmarks' do
   erb :'bookmarks/add_bookmarks'
 end

 post '/saved-bookmarks' do
   Bookmark.create(params['url'])
   redirect '/bookmarks'
 end

  run! if app_file == $0
end
