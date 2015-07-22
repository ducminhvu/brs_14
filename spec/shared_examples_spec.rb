require "set"

 # Shared examples group included in two groups in one file 
RSpec.shared_examples "a collection" do
  let(:collection) { described_class.new([7, 2, 4]) }

  context "initialized with 3 items" do
    it "says it has three items" do
      expect(collection.size).to eq(3)
    end
  end

  describe "#include?" do
    context "with an item that is in the collection" do
      it "returns true" do
        expect(collection.include?(7)).to be_truthy
      end
    end

    context "with an item that is not in the collection" do
      it "returns false" do
        expect(collection.include?(9)).to be_falsey
      end
    end
  end
end

RSpec.describe Array do
  it_behaves_like "a collection"
end

RSpec.describe Set do
  it_behaves_like "a collection"
end

 # Providing context to a shared group using a block 
RSpec.shared_examples "a collection object" do
  describe "<<" do
    it "adds objects to the end of the collection" do
      collection << 1
      collection << 2
      expect(collection.to_a).to match_array([1, 2])
    end
  end
end

RSpec.describe Array do
  it_behaves_like "a collection object" do
    let(:collection) { Array.new }
  end
end

RSpec.describe Set do
  it_behaves_like "a collection object" do
    let(:collection) { Set.new }
  end
end

 # Passing parameters to a shared example group 
RSpec.shared_examples "a measurable object" do |measurement, measurement_methods|
  measurement_methods.each do |measurement_method|
    it "should return #{measurement} from ##{measurement_method}" do
      expect(subject.send(measurement_method)).to eq(measurement)
    end
  end
end

RSpec.describe Array, "with 3 items" do
  subject { [1, 2, 3] }
  it_should_behave_like "a measurable object", 3, [:size, :length]
end

RSpec.describe String, "of 6 characters" do
  subject { "FooBar" }
  it_should_behave_like "a measurable object", 6, [:size, :length]
end

# Aliasing `it_should_behave_like` to `it_has_behavior`
RSpec.configure do |c|
  c.alias_it_should_behave_like_to :it_has_behavior, "has behavior:"
end

RSpec.shared_examples "sortability" do
  it "responds to <=>" do
    expect(sortable).to respond_to(:<=>)
  end
end

RSpec.describe String do
  it_has_behavior "sortability" do
    let(:sortable) { "sample string" }
  end
end

 # Sharing metadata automatically includes shared example groups 
RSpec.shared_examples "shared stuff", :a => :b do
  it 'runs wherever the metadata is shared' do
  end
end

RSpec.describe String, :a => :b do
end

 # Shared examples are nestable by context 
RSpec.describe "shared examples" do
  context "per context" do

    shared_examples "shared examples are nestable" do
      specify { expect(true).to eq true }
    end

    it_behaves_like "shared examples are nestable"
  end
end

 # Shared examples are accessible from offspring contexts 
RSpec.describe "shared examples" do
  shared_examples "shared examples are nestable" do
    specify { expect(true).to eq true }
  end

  context "per context" do
    it_behaves_like "shared examples are nestable"
  end
end

 # Shared examples are isolated per context 
RSpec.describe "shared examples" do
  context "test" do
    shared_examples "shared examples are isolated" do
      specify { expect(true).to eq true }
    end

    context do
      it_behaves_like "shared examples are isolated"
    end
  end
end

 # Custom example group aliases with metadata
RSpec.configure do |c|
  c.alias_example_group_to :detail, :detailed => true
end

RSpec.detail "a detail" do
  it "can do some less important stuff" do
  end
end

RSpec.describe "a thing" do
  describe "in broad strokes" do
    it "can do things" do
    end
  end

  detail "something less important" do
    it "can do an unimportant thing" do
    end
  end
end
