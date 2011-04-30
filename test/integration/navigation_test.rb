require 'test_helper'

class NavigationTest < ActiveSupport::IntegrationCase
  test ".md template handler" do
    visit '/handlers/redcarpet'
    expected = '<p>Redcarpet is <em>cooler</em> and <strong>faster</strong>!</p>'
    assert_match expected, page.body
    assert_match '<code>', page.body
  end

  test ".merb template handler" do
    visit '/handlers/merb'
    expected = '<p>MERB template handler is <strong>cool and fast</strong>!</p>'
    assert_match expected, page.body.strip
  end

  test "dual templates with .merb" do
    email = Notifier.contact("you@example.com")
    assert_equal 2, email.parts.size
    assert_equal "multipart/alternative", email.mime_type
    assert_equal "text/plain", email.parts[0].mime_type
    assert_equal "Dual templates **rock**!",
      email.parts[0].body.encoded.strip
    assert_equal "text/html", email.parts[1].mime_type
    assert_equal "<p>Dual templates <strong>rock</strong>!</p>",
      email.parts[1].body.encoded.strip
  end
end
