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








end
