require 'spec_helper'

FactoryGirl.define do
  factory :upload do
  	
  end

  factory :sender do
  	name 'Joe Uploader'
  	sequence(:email) { |e| "email#{e}@sender.com" }
  end

  factory :recipient do
  	sequence(:email) { |e| "email#{e}@recipient.com" }
  end

  factory :document do
  	file { File.new('spec/test_doc.txt') }
  end
end