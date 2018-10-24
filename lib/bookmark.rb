require 'pg'

class Bookmark
  def self.all
  conn = dbconnect
    result = conn.exec( "SELECT * FROM bookmarks" )
    result.map { |bookmark| bookmark['url'] }
  end

  def self.create(url)
     conn = dbconnect
     conn.exec("INSERT INTO bookmarks (url) VALUES('#{url}');")

  end

  def self.dbconnect
    if ENV['RACK_ENV'] == 'test'
      PG.connect(dbname: 'bookmark_manager_test')
    else
       PG.connect(dbname: 'bookmark_manager')
    end
  end
end
