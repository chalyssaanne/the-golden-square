require 'todo_list'

RSpec.describe "TodoList class" do
  
  context "given a string add to the to-do list" do
    it "adds the task to the to-do list and returns a message" do
      todo = TodoList.new 
      expect(todo.add("Walk the cat")).to eq "Task added: Walk the cat!"
    end
  end

  context "given a task thats completed" do
    it "returns a message" do
      todo = TodoList.new 
      todo.add("Walk the cat")
      expect(todo.done("Walk the cat")).to eq "Task completed: Walk the cat"
    end

    it "deletes the task from the list" do
      todo = TodoList.new 
      todo.add("Walk the cat")
      todo.add("Feed the birds") 
      todo.add("Pay bills")
      todo.done("Walk the cat")
      expect(todo.todo_list).to eq "Todo List: Feed the birds, Pay bills"
    end
  end

  context "when todo_list is called" do
    it "returns a list of the current to-do list " do
      todo = TodoList.new
      todo = TodoList.new
      todo.add("Walk the cat")
      todo.add("Feed the birds") 
      todo.add("Pay bills")
      expect(todo.todo_list).to eq "Todo List: Walk the cat, Feed the birds, Pay bills"    
    end
  end

  context "given an empty string" do
    it "fails" do
      todo = TodoList.new
      expect { todo.add("") }. to raise_error "No task added."
    end
  end

  context "given a task that's already in the todo list" do
    it "fails" do
      todo = TodoList.new
      todo.add("Walk the cat")
      expect { todo.add("Walk the cat") }.to raise_error "Task already in to-do list!"
    end
  
  end
  
  context "given a task does not exist" do
    it "fails" do
      todo = TodoList.new
      todo.add("Walk the cat")
      expect { todo.done("Wash car")}. to raise_error "Task not found."
    end
  end

end