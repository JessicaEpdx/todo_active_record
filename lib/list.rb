
class List
  attr_reader :id, :name

  define_method(:initialize) do |attributes|
    @id = attributes.fetch(:id)
    @name = attributes.fetch(:name)

  end

  define_method(:save) do
    result= DB.exec("INSERT INTO lists (name) VALUES ('#{@name}') RETURNING id;")
    @id = result.first.fetch("id").to_i
  end

  define_method(:==) do |other_list|
    self.name == other_list.name
  end

  define_singleton_method(:all) do
    result= DB.exec("SELECT * FROM lists;")
    arr = []
    result.each do |object|
    name = object.fetch("name")
    id = object.fetch("id").to_i
    arr.push(List.new({:name => name, :id => id}))
  end
  arr
  end

  define_method(:update) do |changes|
    @name = changes[:name]
    DB.exec("UPDATE lists SET name = '#{@name}' WHERE id = #{self.id};")
  end

  define_method(:delete) do
    DB.exec("DELETE FROM lists WHERE id = #{self.id};")
  end

  define_method(:tasks) do
    result = DB.exec("SELECT * FROM tasks WHERE list_id = #{self.id};")
    tasks_in_list = [ ]
    result.each() do |task_object|
      description = task_object.fetch("description")
      list_id = task_object.fetch("list_id").to_i
      id = task_object.fetch("id").to_i
      tasks_in_list.push(Task.new({:description => description, :list_id => list_id, :id => id}))
    end
    tasks_in_list
  end


  define_singleton_method(:find) do |given_id|
    result = DB.exec("SELECT * FROM lists WHERE id = #{given_id};")
    found_list = nil
    result.each() do |list|
      name = list.fetch("name")
      id = given_id
      found_list = List.new({:name => name, :id => id})
    end
    found_list
  end



end
