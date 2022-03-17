require 'todo_2'
require 'todo_list_2'

RSpec.describe "integration" do

  describe "#incomplete" do
    context "when a task is added and is not completed" do
      it "returns all incomplete tasks" do
        todo_list = TodoList.new
        todo = Todo.new("Make cake")
        todo_2 = Todo.new("Pay gas bill")
        todo_list.add(todo)
        todo_list.add(todo_2)
        expect(todo_list.incomplete).to eq "Make cake, Pay gas bill"
      end
    end

    context "when all tasks are completed" do
      it "returns a list of completed tasks" do
        todo_list = TodoList.new
        todo = Todo.new("Make cake")
        todo_2 = Todo.new("Pay gas bill")
        todo_3 = Todo.new("Walk the cat")
        todo_list.add(todo)
        todo_list.add(todo_2)
        todo_list.add(todo_3)
        todo.mark_done!
        expect(todo_list.complete).to eq "Completed: Make cake"
      end
    end

    describe "#give_up!" do
      it "marks all todos as complete" do
        todo_list = TodoList.new
        todo = Todo.new("Make cake")
        todo_2 = Todo.new("Pay gas bill")
        todo_3 = Todo.new("Walk the cat")
        todo_list.add(todo)
        todo_list.add(todo_2)
        todo_list.add(todo_3)
        todo_list.give_up!
        expect(todo_list.complete).to eq "Completed: Make cake, Pay gas bill, Walk the cat"
      end
    end
  end

end