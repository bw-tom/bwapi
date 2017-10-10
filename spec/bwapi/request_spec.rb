require 'helper'

describe BWAPI::Request do
  let(:connection) { double(:connection) }
  let(:request) { double(:request) }
  let(:response) { double(:response) }

  before do
    allow_any_instance_of(BWAPI::Connection).to receive(:connection).and_return(connection)
    allow(response).to receive(:body)
  end

  subject { BWAPI.new }

  describe '#get' do
    before do
      allow(connection).to receive(:get).and_yield(request).and_return(response)
    end

    it 'should make a get request' do
      expect(request).to receive(:url).with('/ping', {})
      subject.get('/ping')
    end

    context 'with a connection error' do
      it 'should raise the error when tries not configured' do
        expect(connection).to receive(:get).and_yield(request).and_raise(Faraday::ConnectionFailed, 'error').once
        expect(request).to receive(:url).with('/ping', {}).once
        expect { subject.get('/ping') }.to raise_exception(Faraday::ConnectionFailed, 'error')
          .and output("Faraday failed to connect with the error: error\n").to_stderr
      end

      it 'should not raise the error when tries configured' do
        expect(connection).to receive(:get).and_yield(request).and_raise(Faraday::ConnectionFailed, 'error').once
        expect(connection).to receive(:get).and_yield(request).and_return(response).once
        expect(request).to receive(:url).with('/ping', {}).twice

        subject.connection_attempts = 2
        expect { subject.get('/ping') }.to output("Faraday failed to connect with the error: error\nResetting and retrying. Retry: 1\n").to_stderr
      end

      it 'should raise the error when tries exceed' do
        expect(connection).to receive(:get).and_yield(request).and_raise(Faraday::ConnectionFailed, 'error').exactly(3).times
        expect(request).to receive(:url).with('/ping', {}).exactly(3).times

        subject.connection_attempts = 3
        expect { subject.get('/ping') }.to raise_exception(Faraday::ConnectionFailed, 'error').and output.to_stderr
      end
    end
  end

  describe '#delete' do
    before do
      allow(connection).to receive(:delete).and_yield(request).and_return(response)
    end

    it 'should make a delete request' do
      expect(request).to receive(:url).with('/ping', {})
      subject.delete('/ping')
    end
  end

  describe '#post' do
    before do
      allow(connection).to receive(:post).and_yield(request).and_return(response)
    end

    it 'should make a post request' do
      expect(request).to receive(:path=).with('/ping')
      expect(request).to receive(:body=).with({})
      subject.post('/ping')
    end
  end

  describe '#put' do
    before do
      allow(connection).to receive(:put).and_yield(request).and_return(response)
    end

    it 'should make a put request' do
      expect(request).to receive(:path=).with('/ping')
      expect(request).to receive(:body=).with({})
      subject.put('/ping')
    end
  end

  describe '#patch' do
    before do
      allow(connection).to receive(:patch).and_yield(request).and_return(response)
    end

    it 'should make a patch request' do
      expect(request).to receive(:path=).with('/ping')
      expect(request).to receive(:body=).with({})
      subject.patch('/ping')
    end
  end
end
