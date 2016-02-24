require 'spec_helper'

describe ThumborRails::Helpers do
  let(:params) { { } }

  include ThumborRails::Helpers

  before do
    ThumborRails.setup do |config|
      config.security_key = 'MY_SECURITY_KEY'
    end
  end

  describe 'interpolate thumbor hosts with %d to 0-3, like Rails asset_host' do
    subject { thumbor_url('http://test.img') }
    let!(:original_url) { ThumborRails.server_url }
    before { ThumborRails.server_url = server_url }
    after { ThumborRails.server_url = original_url }

    context 'when url is set to "http://thumbor%d.com"' do
      let(:server_url) { 'http://thumbor%d.com' }
      it { should eq('http://thumbor3.com/yPVDsGJsQKjKky_cdbkNuIpc9-A=/http://test.img') }
    end
  end

  describe 'automatically remove the protocol in source urls' do
    subject { thumbor_url("#{protocol}test.img", unsafe: true) }
    before { ThumborRails.force_no_protocol_in_source_url = true }
    after { ThumborRails.force_no_protocol_in_source_url = false }

    context 'when http' do
      let(:protocol) { 'http://' }
      it { should eq "http://thumbor.example.com/unsafe/test.img" }
    end

    context 'when https' do
      let(:protocol) { 'https://' }
      it { should eq "http://thumbor.example.com/unsafe/test.img" }
    end

    context 'when no protocol' do
      let(:protocol) { 'www.' }
      it { should eq "http://thumbor.example.com/unsafe/www.test.img" }
    end
  end

  describe '#thumbor_url' do
    subject { thumbor_url('http://test.img', params) }

    context 'basic encrypted url' do
      it { should eq('http://thumbor.example.com/yPVDsGJsQKjKky_cdbkNuIpc9-A=/http://test.img') }
    end

    context 'allow unsafe urls' do
      let(:params) { { unsafe: true } }
      it { should eq('http://thumbor.example.com/unsafe/http://test.img') }
    end

    context 'pass arguments to thumbor' do
      let(:params) { { unsafe: true, width: 100, height: 200 } }
      it { should eq('http://thumbor.example.com/unsafe/100x200/http://test.img') }
    end
  end

  describe '#thumbor_image_tag' do
    subject { thumbor_image_tag('http://myimg.jpg', params) }

    context 'unsafe disabled' do
      it {
        should include('src="http://thumbor.example.com/Q-1lWnxlCLnkzXWWM5xTAs1QEBM=/http://myimg.jpg"')
        should include('alt="Myimg"')
      }
    end

    context 'unsafe enabled' do
      let(:params) { { unsafe: true } }
      it {
        should include('src="http://thumbor.example.com/unsafe/http://myimg.jpg"')
        should include('alt="Myimg"')
      }
    end
  end
end
