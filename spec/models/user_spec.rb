require 'spec_helper'

describe User do
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:login) }
  it { should validate_presence_of(:unique_token) }
  it { should validate_uniqueness_of(:email) }
  it { should validate_uniqueness_of(:login) }
  it { should validate_uniqueness_of(:unique_token) }
end