require 'spec_helper'

FactoryGirl.define do
  factory :upload do
  	factory :complete_upload do
      before(:create) do |upload|
        upload.sender = FactoryGirl.create(:sender)
        upload.recipients << FactoryGirl.create(:recipient)
        upload.documents << FactoryGirl.create(:document)
      end
    end
  end

  factory :sender do
  	name 'Joe Uploader'
  	sequence(:email) { |e| "email#{e}@sender.com" }
  end

  factory :recipient do
  	sequence(:email) { |e| "email#{e}@recipient.com" }
  end

  factory :document do
  	attachment { File.new('spec/test_doc.txt') }
  end
end