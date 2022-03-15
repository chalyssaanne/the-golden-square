class TodoList

  def initialize
    @my_todo_list = []
  end

  def add(task)
    fail "No task added." if task.empty?
    fail "Task already in to-do list!" if @my_todo_list.include? task
    @my_todo_list << task
    return "Task added: #{task}!"
  end

  def todo_list
    return "Todo List: #{@my_todo_list.join(", ")}"
  end

  def done(task)
    fail "Task not found." unless @my_todo_list.include? task
    @my_todo_list.delete(task)
    return "Task completed: #{task}"
  end

end

