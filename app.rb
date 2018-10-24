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

  run! if app_file == $0
end
