# frozen_string_literal: true

RSpec.describe DeliveryForm, type: :form do
  subject { described_class.new(Order.new) }

  let(:delivery_type) { create(:delivery_type) }

  it { is_expected.to validate_presence_of(:delivery_type_id) }
  it { is_expected.to allow_value(delivery_type.id).for(:delivery_type_id) }
end
