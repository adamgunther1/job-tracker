require 'rails_helper'

describe "User deletes existing job" do
  scenario "a user can delete a job" do
    company = Company.create(name: "Starbucks")
    city = City.create(name: "Seattle")
    job = company.jobs.create!(title: "Developer", level_of_interest: 70, city_id: city.id)
    
    visit company_job_path(company, job)
    expect(page).to have_content("Starbucks")

    click_on "Delete Job"

    expect(page).to have_content("job 'Developer' Deleted!")
    expect(current_path).to eq("/companies/#{company.id}/jobs")
  end
end
