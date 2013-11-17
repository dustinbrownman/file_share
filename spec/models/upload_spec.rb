require 'spec_helper'

describe Upload do
	it { should have_many :documents }
	it { should have_many :recipients }
	it { should have_one :sender }
	it { should accept_nested_attributes_for :documents }
	it { should accept_nested_attributes_for :recipients }
	it { should accept_nested_attributes_for :sender }
end
