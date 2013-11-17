require 'spec_helper'

describe 'Uploads Pages' do
	subject { page }
	
	describe 'new upload form' do
		before { visit new_upload_path }
		
		it { should have_field 'upload[sender_attributes][name]' }
		it { should have_field 'upload[sender_attributes][email]' }
		it { should have_field 'upload[recipients_attributes][0][email]' }
		it { should have_field 'upload[documents_attributes][0][attachment]' }
	end

	describe 'uploading a document' do
		before { visit new_upload_path }

		it 'with valid information' do
			fill_in "Your name", with: 'Me'
			fill_in "Your email address", with: 'email@this.com'
			fill_in "Recipient's email address", with: 'someone@else.com'
			attach_file 'Attachment', 'spec/test_doc.txt'
			click_button 'Upload'
			page.should have_content 'successfully'
		end

		it 'missing sender information' do
			fill_in "Your email address", with: 'email@this.com'
			fill_in "Recipient's email address", with: 'someone@else.com'
			attach_file 'Attachment', 'spec/test_doc.txt'
			click_button 'Upload'
			page.should have_content 'blank'
		end

		it 'missing recipient information' do
			fill_in "Your name", with: 'Me'
			fill_in "Recipient's email address", with: 'someone@else.com'
			attach_file 'Attachment', 'spec/test_doc.txt'
			click_button 'Upload'
			page.should have_content 'blank'
		end

		it 'missing document information' do
			fill_in "Your name", with: 'Me'
			fill_in "Your email address", with: 'email@this.com'
			fill_in "Recipient's email address", with: 'someone@else.com'
			click_button 'Upload'
			page.should have_content 'must have an attached file'
		end
	end

	describe 'viewing shared upload' do
		before do
			@upload = FactoryGirl.create(:complete_upload)
			@document = @upload.documents.first
			visit upload_path(@upload)
		end

		it { should have_content @upload.sender.name.humanize }
		it { should have_content @document.attachment_file_name }
		it { should have_content @document.attachment_file_size }
		it { should have_link @document.attachment_file_name, href: @document.attachment.url }
	end
end
