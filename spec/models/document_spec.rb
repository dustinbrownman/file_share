require 'spec_helper'

describe Document do
	it { should belong_to :upload }
	it { should have_attached_file :attachment }
	it { should validate_attachment_presence :attachment }
end
