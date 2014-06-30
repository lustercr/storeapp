require 'spec_helper'

describe Article do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:price) }
  it { should validate_presence_of(:total_in_shelf) }
  it { should validate_presence_of(:total_in_vault) }
  it { should validate_presence_of(:store_id) }
  it { should validate_presence_of(:sku) }
  it { should validate_uniqueness_of(:sku) }
  it { should belong_to(:store) }
end