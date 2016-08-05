require 'helper'

describe BWAPI::Default do
  describe 'constants' do
    it 'should have an ADAPTER constant with a default value' do
      expect(BWAPI::Default::ADAPTER).to eql(:net_http)
    end

    it 'should have an API_ENDPOINT constant with a default value' do
      expect(BWAPI::Default::API_ENDPOINT).to eql('https://newapi.brandwatch.com/')
    end

    it 'should have an CLIENT_ID constant with a default value' do
      expect(BWAPI::Default::CLIENT_ID).to eql('brandwatch-api-client')
    end

    it 'should have an GRANT_TYPE constant with a default value' do
      expect(BWAPI::Default::GRANT_TYPE).to eql('api-password')
    end

    it 'should have an USER_AGENT constant with a default value' do
      expect(BWAPI::Default::USER_AGENT).to eql("BWAPI Ruby Gem #{BWAPI::VERSION}")
    end
  end

  describe '.options' do
    it 'should return the configuration keys' do
      expect(BWAPI::Default.options).to eql(
        access_token: nil,
        access_token_expiry: nil,
        adapter: :net_http,
        api_endpoint: 'https://newapi.brandwatch.com/',
        client_id: 'brandwatch-api-client',
        client_secret: nil,
        connection_options: {
          headers: {
            user_agent: 'BWAPI Ruby Gem 13.0.0'
          },
          request: {
            params_encoder: Faraday::FlatParamsEncoder
          }
        },
        debug: false,
        grant_type: 'api-password',
        logger: nil,
        open_timeout: 30,
        password: nil,
        performance: {},
        refresh_token: nil,
        timeout: 60,
        user_agent: 'BWAPI Ruby Gem 13.0.0',
        username: nil,
        verify_ssl: false
      )
    end
  end

  describe '.access_token' do
    after { ENV['BWAPI_ACCESS_TOKEN'] = nil }

    it 'should return nil when no environmental variable is set' do
      expect(BWAPI::Default.access_token).to eql(nil)
    end

    it 'should return the correct value when the environment variable is set' do
      ENV['BWAPI_ACCESS_TOKEN'] = '1234-5678-9101-1234'
      expect(BWAPI::Default.access_token).to eql('1234-5678-9101-1234')
    end
  end

  describe '.access_token_expiry' do
    it 'should return nil as default' do
      expect(BWAPI::Default.access_token_expiry).to eql(nil)
    end
  end

  describe '.adapter' do
    after { ENV['BWAPI_ADAPTER'] = nil }

    it 'should return the default value when no environmental variable is set' do
      expect(BWAPI::Default.adapter).to eql(:net_http)
    end

    it 'should return the correct value when the environment variable is set' do
      ENV['BWAPI_ADAPTER'] = 'test'
      expect(BWAPI::Default.adapter).to eql(:test)
    end
  end

  describe '.api_endpoint' do
    after { ENV['BWAPI_API_ENDPOINT'] = nil }

    it 'should return the default value when no environmental variable is set' do
      expect(BWAPI::Default.api_endpoint).to eql('https://newapi.brandwatch.com/')
    end

    it 'should return the correct value when the environment variable is set' do
      ENV['BWAPI_API_ENDPOINT'] = 'https://newapi.test.brandwatch.com'
      expect(BWAPI::Default.api_endpoint).to eql('https://newapi.test.brandwatch.com')
    end
  end

  describe '.client_id' do
    after { ENV['BWAPI_CLIENT_ID'] = nil }

    it 'should return the default value when no environmental variable is set' do
      expect(BWAPI::Default.client_id).to eql('brandwatch-api-client')
    end

    it 'should return the correct value when the environment variable is set' do
      ENV['BWAPI_CLIENT_ID'] = 'brandwatch-test-client'
      expect(BWAPI::Default.client_id).to eql('brandwatch-test-client')
    end
  end

  describe '.client_secret' do
    after { ENV['BWAPI_CLIENT_SECRET'] = nil }

    it 'should return nil as default' do
      expect(BWAPI::Default.client_secret).to eql(nil)
    end

    it 'should return the correct value when the environment variable is set' do
      ENV['BWAPI_CLIENT_SECRET'] = 'secret'
      expect(BWAPI::Default.client_secret).to eql('secret')
    end
  end

  describe '.connection_options' do
    it 'should return the default hash values' do
      expect(BWAPI::Default.connection_options).to eql(
        headers: {
          user_agent: 'BWAPI Ruby Gem 13.0.0'
        },
        request: {
          params_encoder: Faraday::FlatParamsEncoder
        }
      )
    end
  end

  describe '.debug' do
    after { ENV['BWAPI_DEBUG'] = nil }

    it 'should return false as default' do
      expect(BWAPI::Default.debug).to eql(false)
    end

    it 'should return the correct value when the environment variable is set' do
      ENV['BWAPI_DEBUG'] = 'true'
      expect(BWAPI::Default.debug).to eql(true)
    end
  end

  describe '.grant_type' do
    after { ENV['BWAPI_GRANT_TYPE'] = nil }

    it 'should return the default value when no environmental variable is set' do
      expect(BWAPI::Default.grant_type).to eql('api-password')
    end

    it 'should return the correct value when the environment variable is set' do
      ENV['BWAPI_GRANT_TYPE'] = 'test-grant'
      expect(BWAPI::Default.grant_type).to eql('test-grant')
    end
  end

  describe '.logger' do
    it 'should return nil as default' do
      expect(BWAPI::Default.logger).to eql(nil)
    end
  end

  describe '.password' do
    after { ENV['BWAPI_PASSWORD'] = nil }

    it 'should return nil as default' do
      expect(BWAPI::Default.password).to eql(nil)
    end

    it 'should return the correct value when the environment variable is set' do
      ENV['BWAPI_PASSWORD'] = 'p455word'
      expect(BWAPI::Default.password).to eql('p455word')
    end
  end

  describe '.performance' do
    it 'should return an empty hash as default' do
      expect(BWAPI::Default.performance).to eql({})
    end
  end

  describe '.refresh_token' do
    after { ENV['BWAPI_REFRESH_TOKEN'] = nil }

    it 'should return nil as default' do
      expect(BWAPI::Default.refresh_token).to eql(nil)
    end

    it 'should return the correct value when the environment variable is set' do
      ENV['BWAPI_REFRESH_TOKEN'] = '1234-5678-9101-1234'
      expect(BWAPI::Default.refresh_token).to eql('1234-5678-9101-1234')
    end
  end

  describe '.user_agent' do
    after { ENV['BWAPI_USER_AGENT'] = nil }

    it 'should return the default value when no environmental variable is set' do
      expect(BWAPI::Default.user_agent).to eql("BWAPI Ruby Gem #{BWAPI::VERSION}")
    end

    it 'should return the correct value when the environment variable is set' do
      ENV['BWAPI_USER_AGENT'] = 'Test User Agent'
      expect(BWAPI::Default.user_agent).to eql('Test User Agent')
    end
  end

  describe '.username' do
    after { ENV['BWAPI_USERNAME'] = nil }

    it 'should return nil as default' do
      expect(BWAPI::Default.username).to eql(nil)
    end

    it 'should return the correct value when the environment variable is set' do
      ENV['BWAPI_USERNAME'] = 'test@brandwatch.com'
      expect(BWAPI::Default.username).to eql('test@brandwatch.com')
    end
  end

  describe '.verify_ssl' do
    after { ENV['BWAPI_VERIFY_SSL'] = nil }

    it 'should return false as default' do
      expect(BWAPI::Default.verify_ssl).to eql(false)
    end

    it 'should return the correct value when the environment variable is set' do
      ENV['BWAPI_VERIFY_SSL'] = 'true'
      expect(BWAPI::Default.verify_ssl).to eql(true)
    end
  end
end
