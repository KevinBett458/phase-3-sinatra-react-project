require 'faker'

puts "🌱 Seeding spices..."

def generate_job_listing(category_name)
  category = Category.find_or_create_by(name: category_name)

  title = Faker::Job.title
  company = Faker::Company.name
  salary = Faker::Number.between(from: 30000, to: 100000)
  location = Faker::Address.city

  {
    category: category,
    title: title,
    company: company,
    salary: salary,
    location: location,
  }
end

# Define the categories of jobs
categories = [
  "Tech",
  "Marketing",
  "Finance",
  "Sales",
  "Engineering",
  "Design",
  "Human Resources",
  "Healthcare",
  "Education",
  "Hospitality",
  "Customer Service",
  "Legal",
  "Media",
  "Retail",
  "Operations",
  "Administrative",
  "Consulting",
  "Research",
  "Logistics",
  "Government"
]

# Generate a list of 10 job listings for each category
job_listings = categories.flat_map do |category_name|
  Array.new(10) { generate_job_listing(category_name) }
end

# Create job listings in the database
job_listings.each do |job|
  Job.create(job)
end

puts "✅ Done seeding!"
