# lib/tasks/seeder.rake
# https://stackoverflow.com/questions/19872271/adding-a-custom-seed-file
# usage: rake db:seeder
#   seeds all files in db/seeds/*

desc "Run all files in db/seeds directory"

namespace :db do
  task seeder: :environment do
    Dir[File.join(Rails.root, 'db', 'seeds', '*.rb')].each do |filename|
      puts "seeding - #{filename}. (see lib/tasks/seeder.rake)"
      load(filename)
    end
  end
end