# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CreateArticleService do
  it_behaves_like('application_service')

  describe 'execution' do
    let(:author) { create(:user, :admin) }
    let(:article_params) { { **attributes_for(:article) } }

    context 'when given approriate params' do
      it { expect { described_class.execute(author_id: author.id, article_params:, cover_extension: "jpg") }.not_to raise_error }
      it do 
        expect { described_class.execute(author_id: author.id, article_params:) }
          .to change(Article, :count).by(1)
          .and change(Image, :count).by(1)
      end
    end

    context 'when given invalid params' do
      let(:author) { create(:user) }

      it { expect { described_class.execute(author_id: author.id, article_params:) }.to raise_error(ActiveRecord::RecordInvalid) }
    end
  end
end
