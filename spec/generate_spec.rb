require 'spec_helper'

RSpec.describe 'VCard', type: :model do
  describe 'generate' do
    it 'should create 2 vcards' do
      `ruby generate.rb`
      expect(FileUtils.getwd('build').count).to eq(2)
    end

    it 'the created file should have .vcard as extension'
  end
end
