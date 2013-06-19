require 'helper'

describe BWAPI do

  describe 'when called' do
    it 'should be an instance of Module' do
      BWAPI.should be_an_instance_of Module
    end
  end

  describe '.new' do
    it 'is a BWAPI::Client' do
      expect(BWAPI.new).to be_a BWAPI::Client
    end
  end

  describe '.respond_to?' do
    it 'returns true if new method exists' do
      expect(BWAPI.respond_to?(:new, true)).to eq(true)
    end
  end

end