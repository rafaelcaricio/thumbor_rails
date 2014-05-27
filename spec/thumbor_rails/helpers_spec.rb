require 'spec_helper'

describe ThumborRails::Helpers do
  include ThumborRails::Helpers

  it 'should generate a basic encrypted url' do
    expect(thumbor_url('http://test.img')).to eq('http://thumbor.example.com/yPVDsGJsQKjKky_cdbkNuIpc9-A=/http://test.img')
  end

  it 'should allow unsafe urls' do
    expect(thumbor_url('http://test.img', unsafe: true)).to eq('http://thumbor.example.com/unsafe/http://test.img')
  end

  it 'should pass arguments to thumbor' do
    expect(thumbor_url('http://test.img', unsafe: true, width: 100, height: 200)).to eq('http://thumbor.example.com/unsafe/100x200/http://test.img')
  end
end
