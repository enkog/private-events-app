require 'rails_helper'
require 'capybara/rspec'

RSpec.describe Event, type: :model do
    subject {
        described_class.new(title: "Microverse Students Meetup",
                            description: "This event bring all Microverse students together.",
                            location: "Zoom",
                            date: 03-01-2022,
                            creator_id: 4)
      }

      it "is not valid without a title" do
        subject.title = nil
        expect(subject).to_not be_valid
      end

      it "is not valid without a description" do
       subject.description = nil
        expect(subject).to_not be_valid
      end 

      it "is not valid without a location" do
       subject.location = nil
        expect(subject).to_not be_valid
      end 

      it "is not valid without a date" do
       subject.date = nil
        expect(subject).to_not be_valid
      end
    describe 'Associations' do
      it { expect(described_class.reflect_on_association(:creator).macro).to eq(:belongs_to) }
      it { expect(described_class.reflect_on_association(:attendees).macro).to eq(:has_many) }
    end
end