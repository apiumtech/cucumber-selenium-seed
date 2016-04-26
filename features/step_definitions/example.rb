#browser_commands.rb

When "I navigate to $url" do |url|
  @browser.navigate.to "http://#{url}"
end

Then "the browser displays a website with the title $title" do |title|
  expect(@browser.title).to eq title
end

And "the website title is not $title" do |title|
  expect(@browser.title).to_not eq title
end
