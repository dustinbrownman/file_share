require 'spec_helper'

describe Sender do
	it { should belong_to :upload }
	it { should validate_presence_of :name }
	it { should validate_presence_of :email }
end
