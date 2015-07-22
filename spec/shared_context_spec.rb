RSpec.shared_context "shared stuff", :a => :b do
  before { @some_var = :some_value }
  def shared_method
    "it works"
  end
  let(:shared_let) { {'arbitrary' => 'object'} }
  subject do
    'this is the subject'
  end
end

# Declare a shared context and include it with `include_context` 
RSpec.describe "group that includes a shared context using 'include_context'" do
  include_context "shared stuff"

  it "has access to methods defined in shared context" do
    expect(shared_method).to eq("it works")
  end

  it "has access to methods defined with let in shared context" do
    expect(shared_let['arbitrary']).to eq('object')
  end

  it "runs the before hooks defined in the shared context" do
    expect(@some_var).to be(:some_value)
  end

  it "accesses the subject defined in the shared context" do
    expect(subject).to eq('this is the subject')
  end
end

# Declare a shared context, include it with `include_context` and extend it with an additional block
RSpec.describe "including shared context using 'include_context' and a block" do
  include_context "shared stuff" do
    let(:shared_let) { {'in_a' => 'block'} }
  end

  it "evaluates the block in the shared context" do
    expect(shared_let['in_a']).to eq('block')
  end
end

# Declare a shared context and include it with metadata 
RSpec.describe "group that includes a shared context using metadata", :a => :b do
  it "has access to methods defined in shared context" do
    expect(shared_method).to eq("it works")
  end

  it "has access to methods defined with let in shared context" do
    expect(shared_let['arbitrary']).to eq('object')
  end

  it "runs the before hooks defined in the shared context" do
    expect(@some_var).to be(:some_value)
  end

  it "accesses the subject defined in the shared context" do
    expect(subject).to eq('this is the subject')
  end
end

 # Declare a shared context and include it with metadata of an individual example 
RSpec.describe "group that does not include the shared context" do
  it "does not have access to shared methods normally" do
    expect(self).not_to respond_to(:shared_method)
  end

  it "has access to shared methods from examples with matching metadata", :a => :b do
    expect(shared_method).to eq("it works")
  end
end
