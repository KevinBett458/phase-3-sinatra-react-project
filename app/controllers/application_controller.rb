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

  # GET request for fetching a specific job listing
  get "/jobs/:id" do
    job = Job.find(params[:id])
    job.to_json
  rescue ActiveRecord::RecordNotFound
    { error: "Job listing not found" }.to_json
  end

  # PATCH request for updating a specific job listing
  patch "/jobs/:id" do
    job = Job.find(params[:id])
    if job.update(params)
      { message: "Job listing updated successfully!" }.to_json
    else
      { error: "Failed to update job listing" }.to_json
    end
  rescue ActiveRecord::RecordNotFound
    { error: "Job listing not found" }.to_json
  end

  # DELETE request for deleting a specific job listing
  delete "/jobs/:id" do
    job = Job.find(params[:id])
    if job.destroy
      { message: "Job listing deleted successfully!" }.to_json
    else
      { error: "Failed to delete job listing" }.to_json
    end
  rescue ActiveRecord::RecordNotFound
    { error: "Job listing not found" }.to_json
  end

  # Define a route to fetch all categories
get '/categories' do
  categories = Category.all
  categories.to_json
end
end
