class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'

  # Add your routes here
  get "/" do
    { message: "Good luck with your project!" }.to_json
  end

  # GET request for fetching all job listings
get "/jobs" do
  jobs = Job.all

  jobs.to_json
end

# POST request for creating a new job listing
post "/jobs" do
  job = Job.new(params)
  if job.save
    { message: "Job listing created successfully!" }.to_json
  else
    { error: "Failed to create job listing" }.to_json
  end
end

end
