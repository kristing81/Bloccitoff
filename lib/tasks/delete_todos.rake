task :delete_todo => :environment do 
  TodoReaper.run
end