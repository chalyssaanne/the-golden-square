def check_tasks(text)
  fail "No tasks found" if text.empty?
  text.include? "@TODO"
end