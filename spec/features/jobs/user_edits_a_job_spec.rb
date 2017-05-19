require 'rails_helper'

describe "User edits a job" do
  it "visits the company job path" do
    company = Company.create!(name: "Pied Piper")
    job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Seattle")

    visit company_job_path(company, job)

    expect(page).to have_content("Pied Piper")
    click_on "Update Job"
    
    expect(current_path).to eq("/companies/#{company.id}/jobs/#{job.id}/edit")
    fill_in "job[title]", with: "Ninja"
    fill_in "job[level_of_interest]", with: 90

    click_button "Update"

    expect(current_path).to eq("/companies/#{company.id}/jobs/#{job.id}")
    expect(page).to have_content("Ninja")
    expect(page).to have_content("90")
    expect(page).to have_content("Seattle")
  end
end