require 'rails_helper'

RSpec.describe "Scientist Show Spec" do
  before(:each) do
    @lab1 = Lab.create!(name: "Sciency Showroom")
    @experiment1 = Experiment.create!(name: "Spooky", objective: "Spookifies yourself.", num_months: 5)
    @scientist1 = @lab1.scientists.create!(name: "Mark", specialty: "Biology", university: "Science U")
    ScientistExperiment.create!(scientist_id: @scientist1.id, experiment_id: @experiment1.id)
  end


  describe "When I visit a scientist's show page" do
    it "I see all of that scientist's information (name, specialty, university where they got their degree)" do
      visit "/scientists/#{@scientist1.id}"
      save_and_open_page

      expect(page).to have_content(@scientist1.name)
      expect(page).to have_content(@scientist1.specialty)
      expect(page).to have_content(@scientist1.university)

      # I see the name of the lab where this scientist works
      expect(page).to have_content(@lab1.name)

      # I see the names of all of the experiments this scientist is running.
      expect(page).to have_content(@experiment1.name)

    end
  end
end
