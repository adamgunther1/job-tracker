# Company.destroy_all
# Job.destroy_all

# COMPANIES = ["ESPN", "Aetna", "United Airlines", "Denver Public Schools", "Shopify", "Starbucks", "Pivotal Labs", "Captain U"]
# JOBS = ["Engineering", "Development", "Dev Ops", "Quality Assurance", "Teacher", "Product Manager", "Consultant", "Community Manager"]
# CITIES = ["Seattle", "Denver", "Portland", "Indianapolis", "Madison", "Orlando", "San Diego", "Austin", "Las Vegas", "Little Rock", "Boise", "Eugene", "Oakland"]

# COMPANIES.each do |name|
#   company = Company.create!(name: name)
#   puts "Created #{company.name}"
#   10.times do |num|
#     company.jobs.create!(title: JOBS.sample, description: "What a great position!", level_of_interest: num + rand(100), city: CITIES.sample)
#     puts "  Created #{company.jobs[num].title}"
#   end
# end

Company.destroy_all
Job.destroy_all
City.destroy_all

COMPANIES = ["ESPN", "Aetna", "United Airlines", "Denver Public Schools", "Shopify", "Starbucks", "Pivotal Labs", "Captain U"]
JOBS = ["Engineering", "Development", "Dev Ops", "Quality Assurance", "Teacher", "Product Manager", "Consultant", "Community Manager"]
CITIES = ["Seattle", "Denver", "Portland", "Indianapolis", "Madison", "Orlando", "San Diego", "Austin", "Las Vegas", "Little Rock", "Boise", "Eugene", "Oakland"]
CATERGORIESJOBS = ["Technical", "Technical", "Technical", "Management", "Education", "Management", "Service", "Community"]
CATEGORIES = CATERGORIESJOBS.uniq

CATEGORIES.each do |category|
  Category.create!(name: category)
  puts "Created #{category}"
end

city_objects = []
CITIES.each do |city|
  city_objects << City.create!(name: city)
end

COMPANIES.each do |name|
  company = Company.create!(name: name)
  puts "Created #{company.name}"
  10.times do |num|
    job = JOBS.sample
    category = Category.find_by(name: CATERGORIESJOBS[JOBS.index(job)])
    company.jobs.create!(title: job, description: "What a great position!", level_of_interest: num + rand(100), city_id: city_objects.sample.id, category_id: category.id)
    puts "  Created #{company.jobs[num].title}"
  end
end