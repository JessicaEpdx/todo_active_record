require('spec_helper')


describe("List") do
  describe("#name") do
    it("returns the name of the list") do
      test_list = List.new({:name => "Tony", :id => nil})
      expect(test_list.name).to(eq("Tony"))
    end
  end

  describe("#id") do
    it("returns the id of the list") do
      test_list = List.new({:name => "Tony", :id => nil})
      test_list.save()
      expect(test_list.id).to(be_an_instance_of(Fixnum))
    end
  end

  describe(".save") do
    it("saves the list in database") do
      test_list = List.new({:name => "Barb", :id => nil})
      test_list.save()
      expect(List.all()).to(eq([test_list]))
    end
  end

  describe("#update") do
    it("changes the name in the list") do
      test_list = List.new({:name => "Tony", :id => nil})
      test_list.save()
      test_list.update({:name => "Tommy"})
      expect(test_list.name).to(eq("Tommy"))
    end
  end

  describe("#delete") do
    it("deletes a name on the list") do
      test_list = List.new({:name => "Tony", :id => nil})
      test_list.save()
      test_list.delete()
      expect(List.all()).to(eq([]))
    end
  end

  describe("#tasks") do
    it("returns all tasks from list") do
      test_list = List.new({:name => "Tony", :id => nil})
      test_list.save()
      task = Task.new({:description => "Whatever", :list_id => test_list.id, :id => nil})
      task.save
      expect(test_list.tasks()).to(eq([task]))
    end
  end

  describe('.find') do
    it("finds a list by id") do
      test_list = List.new({:name => "Tony", :id => nil})
      test_list.save()
      expect(List.find(test_list.id)).to(eq(test_list))

    end
  end







end
