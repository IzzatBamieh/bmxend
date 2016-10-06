require 'rails_helper'

describe Bike do
  before { @bike = build(:bike) }

  subject { @bike }

  it { should respond_to(:name) }
  it { should respond_to(:model) }
  it { should respond_to(:place_of_purchase) }
  it { should respond_to(:serial_number) }
  it { should respond_to(:brand) }

  it { should be_valid }
end
