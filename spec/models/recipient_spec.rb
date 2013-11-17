require 'spec_helper'

describe Recipient do
	it { should belong_to :upload}
	it { should validate_presence_of :email }
end
