class Job < ActiveRecord::Base
  belongs_to :category

  attribute :salary, :integer
  attribute :location, :string
  attribute :requirements, :string

end
