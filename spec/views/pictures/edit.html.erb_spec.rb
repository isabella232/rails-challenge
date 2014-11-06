require 'rails_helper'

RSpec.describe "pictures/edit", :type => :view do
  before(:each) do
    @picture = assign(:picture, Picture.create!(
      :title => "MyString",
      :description => "MyString"
    ))
  end

  it "renders the edit picture form" do
    render

    assert_select "form[action=?][method=?]", picture_path(@picture), "post" do

      assert_select "input#picture_title[name=?]", "picture[title]"

      assert_select "input#picture_description[name=?]", "picture[description]"
    end
  end
end
