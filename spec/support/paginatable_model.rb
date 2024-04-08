# frozen_string_literal: true

RSpec.shared_examples 'paginatable_model' do
  it do
    expect(described_class).to respond_to(:paginate_with)
    expect { described_class.paginate_with }.not_to raise_error
  end
end
