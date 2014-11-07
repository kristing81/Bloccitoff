task :delete_todos => :environment do 
  Todo.where(["created_at <= ?", 8.days.ago]).where(:completed_at => nil).destroy_all
    puts "Deleted Old Todos."
end
