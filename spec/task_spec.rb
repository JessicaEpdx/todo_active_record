require('spec_helper')

describe('Task') do
  describe('save') do
    it("saves a task") do
    task = Task.new({:description => "Eat all the foods", :id => nil, :list_id => 3})
    task.save()
    expect(Task.all()).to(eq([task]))
  end
end
end
