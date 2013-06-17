require "spec_helper"

describe "Competitions" do
  describe "creating competitions" do
    before do
      visit "/competitions/new"
      fill_in "Name", :with => "Hessen Open 2013"
      click_button "Create Competition"
      visit "/competitions"
    end

    it "creates new competitions" do
      within("ol.competitions") do
        expect(page).to have_content("Hessen Open 2013")
      end
    end
  end
end
