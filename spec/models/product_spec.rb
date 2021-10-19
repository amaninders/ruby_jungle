require 'rails_helper'

RSpec.describe Product, type: :model do
  
	subject {
    described_class.new(name: "Anything",
                        price: 40.0,
                        quantity: 10)
  }

  it "is not valid without category" do
    expect(subject).to_not be_valid
		expect(subject.errors.full_messages[0]).to eq "Category can't be blank"
  end

  it "is not valid without a name" do
    subject.name = nil
    expect(subject).to_not be_valid
		expect(subject.errors.full_messages[0]).to eq "Name can't be blank"
  end

  it "is not valid without a price" do
    subject.price = nil
    expect(subject).to_not be_valid
		expect(subject.errors.full_messages[0]).to eq "Category can't be blank"
  end

  it "is not valid without a quantity" do
    subject.quantity = nil
    expect(subject).to_not be_valid
		expect(subject.errors.full_messages[0]).to eq "Quantity can't be blank"
  end
end