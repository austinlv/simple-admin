require 'spec_helper'

RSpec.describe 'simple_admin/admin/resource/new.html.erb', type: :view do
  let(:entity) { create :entity }
  let(:resource) { build :post }

  before do
    assign(:entity, entity)
    assign(:resource, resource)

    assign(:entity_fields, entity.entity_fields)

    allow(view).to receive(:resource).and_return(resource)
  end

  it { render }
end
