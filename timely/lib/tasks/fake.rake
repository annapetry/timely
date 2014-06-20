# how to create a rake task for generating this fake data

# First, in '/lib/tasks' create a new file 'fake.rake'

# ':environment' makes sure the environment is loaded before running the task

# then, run 'rake fake' in the terminal to execute

task :fake  => :environment do
  100.times do
  	Customer.create(name: Faker::Company.name,
  									city: Faker::Address.city,
  									zipcode: Faker::Address.zip.to_i,
  									state: Faker::Address.state_abbr,
  									email: Faker::Internet.email,
  									employees: (rand * 100).to_i)
  end
end
  