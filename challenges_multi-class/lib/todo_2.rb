class Todo
  def initialize(task) 
    @task = task
    @completed = []
  end

  def task
    return @task
  end

  def mark_done!
    # fail "Already marked as done!" if @completed.include? @task
    @completed << @task
  end

  def completed_list
    @completed
  end

  def done?
    return @completed.include? @task
  end

end