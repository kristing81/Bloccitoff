class TodoReaper
  def self.run
    Todo.where("created_at <= ?", Time.now - 7.days).destroy_all
  end
end