require 'rails_helper'

RSpec.describe "newsletters/new", :type => :view do
  before(:each) do
    assign(:newsletter, Newsletter.new(
      :last_name => "MyString",
      :first_name => "MyString",
      :email => "MyString"
    ))
  end

  it "renders new newsletter form" do
    render

    assert_select "form[action=?][method=?]", newsletters_path, "post" do

      assert_select "input#newsletter_last_name[name=?]", "newsletter[last_name]"

      assert_select "input#newsletter_first_name[name=?]", "newsletter[first_name]"

      assert_select "input#newsletter_email[name=?]", "newsletter[email]"
    end
  end
end
