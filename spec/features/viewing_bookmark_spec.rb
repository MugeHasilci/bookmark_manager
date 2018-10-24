
feature 'Viewing bookmarks' do
  scenario 'A user can see bookmarks' do
    conn = PG.connect(dbname: 'bookmark_manager_test')
    conn.exec("INSERT INTO bookmarks (url) VALUES('http://www.makersacademy.com');")
    conn.exec("INSERT INTO bookmarks (url) VALUES('http://www.destroyallsoftware.com');")
    conn.exec("INSERT INTO bookmarks (url) VALUES('http://www.google.com');")

     visit('/bookmarks')
    expect(page).to have_content "http://www.makersacademy.com"
    expect(page).to have_content "http://www.destroyallsoftware.com"
    expect(page).to have_content "http://www.google.com"
  end

  feature 'Add new bookmarks' do
    scenario 'User can add bookmarks' do
      visit('/add-bookmarks')
      fill_in('url', :with => "http://facebook.com")
      click_button('Submit')
      expect(page).to have_content "http://facebook.com"
    end
  end
end
