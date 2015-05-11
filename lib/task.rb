class Task
  attr_reader(:description, :id, :list_id)

  define_method(:initialize) do |attributes|
    @description = attributes.fetch(:description)
    @id = attributes.fetch(:id)
    @list_id = attributes.fetch(:list_id)
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO tasks (description, list_id) VALUES ('#{@description}', #{@list_id}) RETURNING id;")
    @id = result.first.fetch("id").to_i
  end

  define_singleton_method(:all) do
    result = DB.exec("SELECT * FROM tasks;")
    tasks = []
    result.each do |object|
      description = object.fetch("description")
      id = object.fetch("id").to_i()
      list_id = object.fetch("list_id").to_i()
      tasks.push(Task.new({:description => description, :id => id, :list_id => list_id}))
    end
    tasks

  end

  define_method(:==) do |other_task|
    self.description == other_task.description
  end

  define_method(:delete) do
    DB.exec("DELETE FROM tasks where id = #{self.id};")
  end

  define_method(:update) do |attributes|
    @description = attributes.fetch(:description, @description)
    @list_id = attributes.fetch(:list_id, @list_id)
    DB.exec("UPDATE tasks SET description = '#{@description}' WHERE id = #{self.id};")
    DB.exec("UPDATE tasks SET list_id = #{@list_id} WHERE id = #{self.id};")
  end



end
