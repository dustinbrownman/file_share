require 'spec_helper'

describe 'Uploads Pages' do
	subject { page }
	
	describe 'new upload form' do
		before { visit new_upload_path }
		
		it { should have_field 'upload[sender_attributes][name]' }
		it { should have_field 'upload[sender_attributes][email]' }
		it { should have_field 'upload[recipients_attributes][0][email]' }
		it { should have_field 'upload[documents_attributes][0][file]' }
	end

	describe 'uploading a document' do
		before { visit new_upload_path }

		it 'with valid information' do
			fill_in "Your name", with: 'Me'
			fill_in "Your email address", with: 'email@this.com'
			fill_in "Recipient's email address", with: 'someone@else.com'
			attach_file 'File', 'spec/test_doc.txt'
			click_button 'Upload'
			page.should have_content 'successfully'
		end
	end
end