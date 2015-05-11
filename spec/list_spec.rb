require('spec_helper')


describe("List") do
  describe("#name") do
    it("returns the name of the list") do
      test_list = List.new({:name => "Tony", :id => nil})
      expect(test_list.name).to(eq("Tony"))
    end
  end
end
