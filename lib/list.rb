
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










end
