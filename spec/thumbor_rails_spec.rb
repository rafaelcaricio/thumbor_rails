require 'spec_helper'

describe ThumborRails do
  it 'setup block yields self' do
    subject.setup do |config|
      expect(subject).to equal(config)
    end
  end

  it 'has security_key attibute' do
    expect(subject).to respond_to 'security_key'
  end

  it 'has server_url attibute' do
    expect(subject).to respond_to 'server_url'
  end

  it 'has force_no_protocol_in_source_url attibute' do
    expect(subject).to respond_to 'force_no_protocol_in_source_url'
  end

  describe 'when configured' do
    before do
      subject.setup do |config|
        config.server_url = 'http://thumbor.example.com'
      end
    end

    it 'should use the configuration' do
      expect(subject.server_url).to eq('http://thumbor.example.com')
    end
  end
end
