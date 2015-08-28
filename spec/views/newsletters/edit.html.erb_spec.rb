require 'rails_helper'

RSpec.describe "newsletters/edit", :type => :view do
  before(:each) do
    @newsletter = assign(:newsletter, Newsletter.create!(
      :last_name => "MyString",
      :first_name => "MyString",
      :email => "MyString"
    ))
  end

  it "renders the edit newsletter form" do
    render

    assert_select "form[action=?][method=?]", newsletter_path(@newsletter), "post" do

      assert_select "input#newsletter_last_name[name=?]", "newsletter[last_name]"

      assert_select "input#newsletter_first_name[name=?]", "newsletter[first_name]"

      assert_select "input#newsletter_email[name=?]", "newsletter[email]"
    end
  end
end
