ENV['RACK_ENV'] = 'test'

require('rspec')
require('task')
require('list')
require('pg')

# 
# RSpec.configure do |config|
#   config.after(:each) do
#     DB.exec("DELETE FROM tasks *;")
#     DB.exec("DELETE FROM lists *;")
#   end
# end
