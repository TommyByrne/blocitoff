# Load the Rails application.
require File.expand_path('../application', __FILE__)

Date::DATE_FORMATS[:duedate] = "Due on %m/%d/%Y"
Time::DATE_FORMATS[:duedate] = "Due on %m/%d/%Y"

# Initialize the Rails application.
Rails.application.initialize!
