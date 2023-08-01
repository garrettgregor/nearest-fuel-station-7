require "rails_helper"

RSpec.describe "/", type: :feature do
  describe "landing page" do
    it "should be able to choose from a list of stations" do
      visit root_path

      select("Griffin Coffee", from: :location)
      click_button("Find Nearest Station")

      expect(current_path).to eq(search_path)
      expect(page).to have_content("Name: Edgewater Public Market - Tesla Supercharger")
      expect(page).to have_content("Address: 5505 W 20th Ave, Edgewater, CO 80214")
      expect(page).to have_content("Fuel Type: Electric")
      expect(page).to have_content("Access Times: 24 hours daily")
      expect(page).to have_content("Directions:")
      expect(page).to have_content("Head east on W 25th Ave. Go for 246 ft.")
      expect(page).to have_content("Turn right onto Sheridan Blvd (CO-95). Go for 0.4 mi.")
      expect(page).to have_content("Turn right. Go for 420 ft.")
      expect(page).to have_content("Arrive at your destination.")
    end
  end
end
