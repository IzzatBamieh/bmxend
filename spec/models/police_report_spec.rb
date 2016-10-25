require 'rails_helper'

describe PoliceReport do
  before { @police_report = build(:police_report) }

  subject { @police_report }

  it { should respond_to(:lat) }
  it { should respond_to(:lng) }
  it { should respond_to(:time_locked) }
  it { should respond_to(:time_discovered_stolen) }
  it { should respond_to(:status) }
  it { should respond_to(:bike_id) }
  it { should respond_to(:user_id) }

  it { should be_valid }
end
