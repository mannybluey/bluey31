# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Bluey::Application.initialize!

Carmen.priority_countries = %w(US CA GB AR RU FR)

Uaid.supported_agents = [
  /safari [4]/,
  /chrome [89]/,
  /firefox [34]/,
  /ie [9]/
]
