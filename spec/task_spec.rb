require('spec_helper')

describe('Task') do
  describe('save') do
    it("saves a task") do
    task = Task.new({:description => "Eat all the foods", :id => nil, :list_id => 3})
    task.save()
    expect(Task.all()).to(eq([task]))
  end
end

describe("#delete") do
  it("deletes a task") do
    task = Task.new({:description => "Eat all the foods", :id => nil, :list_id => 3})
    task.save()
    task.delete()
    expect(Task.all()).to(eq([]))
  end
end

describe('#update') do
  it("updates list id or description of task") do
    task = Task.new({:description => "Eat all the foods", :id => nil, :list_id => 3})
    task.save()
    task.update({:description => "Walk the dog"})
    expect(task.description()).to(eq("Walk the dog"))
    task.update({:list_id => 5})
    expect(task.list_id()).to(eq(5))
  end
end


end
