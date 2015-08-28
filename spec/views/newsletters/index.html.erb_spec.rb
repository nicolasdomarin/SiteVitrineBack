require 'rails_helper'

RSpec.describe "newsletters/index", :type => :view do
  before(:each) do
    assign(:newsletters, [
      Newsletter.create!(
        :last_name => "Last Name",
        :first_name => "First Name",
        :email => "Email"
      ),
      Newsletter.create!(
        :last_name => "Last Name",
        :first_name => "First Name",
        :email => "Email"
      )
    ])
  end

  it "renders a list of newsletters" do
    render
    assert_select "tr>td", :text => "Last Name".to_s, :count => 2
    assert_select "tr>td", :text => "First Name".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
  end
end
