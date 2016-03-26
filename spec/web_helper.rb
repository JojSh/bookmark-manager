def add_sky
  visit '/add_link'
  fill_in :title, with: 'Sky Sports'
  fill_in :url, with: 'www.skysports.com'
  fill_in :tags, with: 'sports'
  click_button 'Add link'
end

def add_pigeons
  visit '/add_link'
  fill_in :title, with: 'Pigeons'
  fill_in :url, with: 'www.pigeons.com'
  fill_in :tags, with: 'pigeons'
  click_button 'Add link'
end

def add_many_tags
  visit '/add_link'
  fill_in :title, with: 'Birdspotting'
  fill_in :url, with: 'www.spotbirds4fun.com'
  fill_in :tags, with: 'animals birds pigeons'
  click_button 'Add link'
end

def sign_up
  visit "/"
  click_button("Sign up")
  fill_in :address, with: "joj@pigeons.com"
  fill_in :pw, with: "pigeon1"
  click_button("Register")
end
