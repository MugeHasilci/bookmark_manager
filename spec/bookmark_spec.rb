require 'bookmark'
require 'pg'

describe Bookmark do
  describe '.all' do
    it 'returns all bookmarks' do
      conn = PG.connect(dbname: 'bookmark_manager_test')
      conn.exec("INSERT INTO bookmarks (url) VALUES('http://www.makersacademy.com');")
      conn.exec("INSERT INTO bookmarks (url) VALUES('http://www.destroyallsoftware.com');")
      conn.exec("INSERT INTO bookmarks (url) VALUES('http://www.google.com');")


      bookmarks = Bookmark.all
      expect(bookmarks).to include('http://www.makersacademy.com')
      expect(bookmarks).to include('http://www.destroyallsoftware.com')
      expect(bookmarks).to include('http://www.google.com')
    end
  end

  describe '.create' do
    it 'should create new bookmarks' do
      bookmark = Bookmark.create('http://www.google.com')
      conn = PG.connect(dbname: 'bookmark_manager_test')
      bookmarks = conn.exec("SELECT * FROM bookmarks;")
      expect(bookmarks[0]['url']).to eq('http://www.google.com')

    end
  end
end
