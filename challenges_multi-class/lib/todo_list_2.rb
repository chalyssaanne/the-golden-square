class TodoList
  def initialize
    @todo_list = []
  end

  def add(todo) 
    @todo_list << todo
  end

  def incomplete
    return @todo_list.map { | todo | todo.task }.join(", ")
  end

  def complete
   # "Completed: #{@todo_list.map { | todo | todo.completed }.join(" ")}"
    completed_tasks = @todo_list.map { | todo | todo.completed_list }
    
    arr = []

    completed_tasks.map do | todo | 
      arr << todo unless todo.empty?   #deletes empty arrays
    end
    return "Completed: #{arr.join(", ")}"
  end
      # if todo.empty?
      #   todo.delete   #because array returns an empty string if not completed
      # else
      #   arr = []
      #   arr << todo
      # end
      #return arr
      # if arr.length > 0
      #   return "Completed: #{arr.join(", ")}" 
      # else 
      #   return "Completed: #{arr.join}" 
      # end
      

    # if completed_tasks.length == 1
    #   return "Completed: #{completed_tasks.join}"
    # else
    #   return completed_tasks #"Completed: #{completed_tasks.join(" ")}"
    # end

  def give_up!
    @todo_list.map { | todo | todo.mark_done! }
  end
end