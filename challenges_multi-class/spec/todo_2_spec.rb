require 'todo_2'

RSpec.describe "Todo" do

  describe "#task" do
    it "returns the task" do
      todo = Todo.new("Make cake")
      todo_2 = Todo.new("Pay gas bill")
      expect(todo.task).to eq "Make cake"
      expect(todo_2.task).to eq "Pay gas bill"
    end
  end

  # describe "#mark_done!" do
  #   context "when mark_done is called on a task that is already done" do
  #     it "fails" do
  #       todo = Todo.new("Make cake")
  #       todo.mark_done!
  #       expect { todo.mark_done! }.to raise_error "Already marked as done!"
  #     end
  #   end
  # end

  describe "#done?" do
    context "when done? is called on a task that is marked done" do
      it "returns true" do
        todo = Todo.new("Make cake")
        todo.mark_done!
        expect(todo.done?).to eq true
      end
    end

    context "when done? is called on a task that is not marked done" do
      it "returns false" do
        todo = Todo.new("Make cake")
        expect(todo.done?).to eq false
      end
    end
  end

end