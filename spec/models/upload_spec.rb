require 'spec_helper'

describe Upload do
	it { should have_many :documents }
	it { should have_many :recipients }
	it { should have_one :sender }
	it { should accept_nested_attributes_for :documents }
	it { should accept_nested_attributes_for :recipients }
	it { should accept_nested_attributes_for :sender }

	describe 'validations' do
		it 'should require a sender' do
			upload = FactoryGirl.build(:upload, id: 1)
			upload.documents << FactoryGirl.create(:document)
			upload.recipients << FactoryGirl.create(:recipient)
			upload.should_not be_valid
		end

		it 'should require at least one recipient' do
			upload = FactoryGirl.build(:upload, id: 1)
			upload.sender = FactoryGirl.create(:sender)
			upload.documents << FactoryGirl.create(:document)
			upload.should_not be_valid
		end

		it 'should require at least one document' do
			upload = FactoryGirl.build(:upload, id: 1)
			upload.sender = FactoryGirl.create(:sender)
			upload.recipients << FactoryGirl.create(:recipient)
			upload.should_not be_valid
		end
	end
end
