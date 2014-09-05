class Todo < ActiveRecord::Base
  
  validates :description, presence: true
  belongs_to :list
  belongs_to :user


  after_save :delete_completed_todo

  def delete_completed_todo
    if self.complete
      self.destroy
    end
  end

  def expiry_date
    self.created_at+1.week
  end
end
