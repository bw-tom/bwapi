require 'helper'
require 'logger'

describe BWAPI::Configuration do
  let(:bwapi) { BWAPI::Client.new }

  describe 'instance variables' do
    it 'should create a access_token instance variable' do
      expect(bwapi.respond_to?(:access_token)).to eq(true)
    end

    it 'should create a access_token_expiry instance variable' do
      expect(bwapi.respond_to?(:access_token_expiry)).to eq(true)
    end

    it 'should create a adapter instance variable' do
      expect(bwapi.respond_to?(:adapter)).to eq(true)
    end

    it 'should create a api_endpoint instance variable' do
      expect(bwapi.respond_to?(:api_endpoint)).to eq(true)
    end

    it 'should create a client_id instance variable' do
      expect(bwapi.respond_to?(:client_id)).to eq(true)
    end

    it 'should create a client_secret instance variable which cannot accessed' do
      expect(bwapi.respond_to?(:client_secret)).to eq(false)
    end

    it 'should create a debug instance variable' do
      expect(bwapi.respond_to?(:debug)).to eq(true)
    end

    it 'should create a grant_type instance variable' do
      expect(bwapi.respond_to?(:grant_type)).to eq(true)
    end

    it 'should create a logger instance variable' do
      expect(bwapi.respond_to?(:logger)).to eq(true)
    end

    it 'should create a password instance variable which cannot be accessed' do
      expect(bwapi.respond_to?(:password)).to eq(false)
    end

    it 'should create a performance instance variable' do
      expect(bwapi.respond_to?(:performance)).to eq(true)
    end

    it 'should create a refresh_token instance variable' do
      expect(bwapi.respond_to?(:refresh_token)).to eq(true)
    end

    it 'should create a user_agent instance variable' do
      expect(bwapi.respond_to?(:user_agent)).to eq(true)
    end

    it 'should create a username instance variable' do
      expect(bwapi.respond_to?(:username)).to eq(true)
    end

    it 'should create a logger instance variable' do
      expect(bwapi.respond_to?(:logger)).to eq(true)
    end

    it 'should create a verify_ssl instance variable' do
      expect(bwapi.respond_to?(:verify_ssl)).to eq(true)
    end
  end

  describe 'default and custom values' do
    before { bwapi.reset }

    describe 'access_token' do
      it 'should have a default value of nil for access_token' do
        expect(bwapi.access_token).to eql(nil)
      end

      it 'should allow a user to set a access_token value' do
        bwapi.access_token = 'abcdef-ghijkl-123456-789012'
        expect(bwapi.access_token).to eql('abcdef-ghijkl-123456-789012')
      end
    end

    describe 'access_token_expiry' do
      it 'should have a default value of nil for access_token_expiry' do
        expect(bwapi.access_token_expiry).to eql(nil)
      end

      it 'should allow a user to set a access_token_expiry value' do
        bwapi.access_token_expiry = '2015-01-08T16:13:03-08:00'
        expect(bwapi.access_token_expiry).to eql('2015-01-08T16:13:03-08:00')
      end
    end

    describe 'adapter' do
      it 'should have a default adapter value' do
        expect(bwapi.adapter).to eql(:net_http)
      end

      it 'should allow a user to set a default_adapter value' do
        bwapi.adapter = 'custom_adapter'
        expect(bwapi.adapter).to eql('custom_adapter')
      end
    end

    describe 'api_endpoint' do
      it 'should have a default api_endpoint value' do
        expect(bwapi.api_endpoint).to eql('https://newapi.brandwatch.com/')
      end

      it 'should allow a user to set a api_endpoint value' do
        bwapi.api_endpoint = 'http://newapi.custom.brandwatch.com'
        expect(bwapi.api_endpoint).to eql('http://newapi.custom.brandwatch.com')
      end
    end

    describe 'client_id' do
      it 'should have a default client_id value' do
        expect(bwapi.client_id).to eql('brandwatch-api-client')
      end

      it 'should allow a user to set a client_id value' do
        bwapi.client_id = 'custom_client_id'
        expect(bwapi.client_id).to eql('custom_client_id')
      end
    end

    describe 'client_secret' do
      it 'should allow a user to set a client_secret value' do
        bwapi.client_secret = 'custom_client_secret'
        expect(bwapi.instance_eval { @client_secret }).to eql('custom_client_secret')
      end
    end

    describe 'debug' do
      it 'should have a default debug value' do
        expect(bwapi.debug).to eql(false)
      end

      it 'should allow a user to set a debug value' do
        bwapi.debug = true
        expect(bwapi.debug).to eql(true)
      end
    end

    describe 'grant_type' do
      it 'should have a default value of api-password for grant_type' do
        expect(bwapi.grant_type).to eql('api-password')
      end

      it 'should allow a user to set a grant_type value' do
        bwapi.grant_type = 'custom_grant_type'
        expect(bwapi.grant_type).to eql('custom_grant_type')
      end
    end

    describe 'logger' do
      it 'should have a default value of nil for logger' do
        expect(bwapi.logger).to eql(nil)
      end

      it 'should allow a user to set a logger value' do
        logger = Logger.new(STDOUT)
        bwapi.logger = logger
        expect(bwapi.logger).to eql(logger)
      end
    end

    describe 'password' do
      it 'should allow a user to set a password value' do
        bwapi.password = 'pa55w0rd'
        expect(bwapi.instance_eval { @password }).to eql('pa55w0rd')
      end
    end

    describe 'performance' do
      it 'should have a default performance value' do
        expect(bwapi.performance).to eql({})
      end
    end

    describe 'refresh_token' do
      it 'should have a default value of nil for refresh_token' do
        expect(bwapi.refresh_token).to eql(nil)
      end

      it 'should allow a user to set a refresh_token value' do
        bwapi.refresh_token = 'abcdef-ghijkl-123456-789012'
        expect(bwapi.refresh_token).to eql('abcdef-ghijkl-123456-789012')
      end
    end

    describe 'user_agent' do
      it 'should have a default user_agent value' do
        expect(bwapi.user_agent).to eql("BWAPI Ruby Gem #{BWAPI::VERSION}")
      end

      it 'should allow a user to set a user_agent value' do
        bwapi.user_agent = 'custom_user_agent'
        expect(bwapi.user_agent).to eql('custom_user_agent')
      end
    end

    describe 'username' do
      it 'should have a default value of nil for username' do
        expect(bwapi.username).to eql(nil)
      end

      it 'should allow a user to set a username value' do
        bwapi.username = 'jonathan@brandwatch.com'
        expect(bwapi.username).to eql('jonathan@brandwatch.com')
      end
    end

    describe 'verify_ssl' do
      it 'should have a default verify_ssl value' do
        expect(bwapi.verify_ssl).to eql(false)
      end

      it 'should allow a user to set a verify_ssl value' do
        bwapi.verify_ssl = true
        expect(bwapi.verify_ssl).to eql(true)
      end
    end
  end

  describe '.keys' do
    it 'should return the correct list of keys' do
      expect(BWAPI::Configuration.keys).to eql(
        [
          :access_token,
          :access_token_expiry,
          :adapter,
          :api_endpoint,
          :client_id,
          :client_secret,
          :connection_options,
          :debug,
          :grant_type,
          :logger,
          :open_timeout,
          :password,
          :performance,
          :refresh_token,
          :timeout,
          :user_agent,
          :username,
          :verify_ssl
        ]
      )
    end
  end

  describe '.configure' do
    before do
      bwapi.configure do |c|
        c.access_token = '1234-5678-9010-1112'
        c.access_token_expiry = '2015-01-08 14:09:16 -0800'
        c.adapter = :test
        c.api_endpoint = 'http://newapi.test.brandwatch.com'
        c.client_id = 'brandwatch-test-client'
        c.client_secret = 'test'
        c.debug = true
        c.grant_type = 'test-grant'
        c.logger = Logger.new(STDOUT)
        c.open_timeout = 60
        c.password = 'password123'
        c.refresh_token = '1234-5678-9010-1112'
        c.timeout = 120
        c.user_agent = 'Test User Agent'
        c.username = 'testing@brandwatch.com'
        c.verify_ssl = true
      end
    end

    after { bwapi.reset }

    it 'should set the configured access_token' do
      expect(bwapi.access_token).to eql('1234-5678-9010-1112')
    end

    it 'should set the configured access_token_expiry' do
      expect(bwapi.access_token_expiry).to eql('2015-01-08 14:09:16 -0800')
    end

    it 'should set the configured adapter' do
      expect(bwapi.adapter).to eql(:test)
    end

    it 'should set the configured api_endpoint' do
      expect(bwapi.api_endpoint).to eql('http://newapi.test.brandwatch.com')
    end

    it 'should set the configured client_id' do
      expect(bwapi.client_id).to eql('brandwatch-test-client')
    end

    it 'should set the configured client_secret' do
      expect(bwapi.instance_variable_get(:@client_secret)).to eql('test')
    end

    it 'should set the configured debug flag' do
      expect(bwapi.debug).to eql(true)
    end

    it 'should set the configured grant type' do
      expect(bwapi.grant_type).to eql('test-grant')
    end

    it 'should set the configured logger' do
      expect(bwapi.logger).to be_an_instance_of(Logger)
    end

    it 'should set the configured open timeout' do
      expect(bwapi.open_timeout).to eql(60)
    end

    it 'should set the configured password' do
      expect(bwapi.instance_variable_get(:@password)).to eql('password123')
    end

    it 'should set the configured refresh_token' do
      expect(bwapi.refresh_token).to eql('1234-5678-9010-1112')
    end

    it 'should set the configured timeout' do
      expect(bwapi.timeout).to eql(120)
    end

    it 'should set the configured user agent' do
      expect(bwapi.user_agent).to eql('Test User Agent')
    end

    it 'should set the configured username' do
      expect(bwapi.username).to eql('testing@brandwatch.com')
    end

    it 'should set the configured verify_ssl flag' do
      expect(bwapi.verify_ssl).to eql(true)
    end
  end

  describe '.reset' do
    before { bwapi.reset }

    it 'should reset the access token value' do
      expect(bwapi.access_token).to eql(nil)
    end

    it 'should reset the access token expiry value' do
      expect(bwapi.access_token_expiry).to eql(nil)
    end

    it 'should reset the adapter value' do
      expect(bwapi.adapter).to eql(:net_http)
    end

    it 'should reset the api_endpoint value' do
      expect(bwapi.api_endpoint).to eql('https://newapi.brandwatch.com/')
    end

    it 'should reset the client_id value' do
      expect(bwapi.client_id).to eql('brandwatch-api-client')
    end

    it 'should reset the client_secret value' do
      expect(bwapi.instance_variable_get(:@client_secret)).to eql(nil)
    end

    it 'should reset the connection value' do
      expect(bwapi.instance_variable_get(:@connection)).to eql(nil)
    end

    it 'should reset the debug value' do
      expect(bwapi.debug).to eql(false)
    end

    it 'should reset the grant_type value' do
      expect(bwapi.grant_type).to eql('api-password')
    end

    it 'should reset the logger value' do
      expect(bwapi.logger).to eql(nil)
    end

    it 'should reset the open timeout' do
      expect(bwapi.open_timeout).to eql(30)
    end

    it 'should reset the password value' do
      expect(bwapi.instance_variable_get(:@password)).to eql(nil)
    end

    it 'should reset the performance value' do
      expect(bwapi.performance).to eql({})
    end

    it 'should reset the refresh_token value' do
      expect(bwapi.refresh_token).to eql(nil)
    end

    it 'should reset the timeout' do
      expect(bwapi.timeout).to eql(60)
    end

    it 'should reset the user_agent value' do
      expect(bwapi.user_agent).to eql('BWAPI Ruby Gem 13.0.0')
    end

    it 'should reset the username value' do
      expect(bwapi.username).to eql(nil)
    end

    it 'should reset the verify_ssl value' do
      expect(bwapi.verify_ssl).to eql(false)
    end
  end

  describe '.destroy' do
    before { bwapi.destroy }

    it 'should reset the access token value' do
      expect(bwapi.access_token).to eql(nil)
    end

    it 'should reset the access token expiry value' do
      expect(bwapi.access_token_expiry).to eql(nil)
    end

    it 'should reset the adapter value' do
      expect(bwapi.adapter).to eql(nil)
    end

    it 'should reset the api_endpoint value' do
      expect(bwapi.api_endpoint).to eql(nil)
    end

    it 'should reset the client_id value' do
      expect(bwapi.client_id).to eql(nil)
    end

    it 'should reset the client_secret value' do
      expect(bwapi.instance_variable_get(:@client_secret)).to eql(nil)
    end

    it 'should reset the connection value' do
      expect(bwapi.instance_variable_get(:@connection)).to eql(nil)
    end

    it 'should reset the debug value' do
      expect(bwapi.debug).to eql(nil)
    end

    it 'should reset the grant_type value' do
      expect(bwapi.grant_type).to eql(nil)
    end

    it 'should reset the logger value' do
      expect(bwapi.logger).to eql(nil)
    end

    it 'should reset the open timeout' do
      expect(bwapi.open_timeout).to eql(nil)
    end

    it 'should reset the password value' do
      expect(bwapi.instance_variable_get(:@password)).to eql(nil)
    end

    it 'should reset the performance value' do
      expect(bwapi.performance).to eql(nil)
    end

    it 'should reset the refresh_token value' do
      expect(bwapi.refresh_token).to eql(nil)
    end

    it 'should reset the timeout' do
      expect(bwapi.open_timeout).to eql(nil)
    end

    it 'should reset the user_agent value' do
      expect(bwapi.user_agent).to eql(nil)
    end

    it 'should reset the username value' do
      expect(bwapi.username).to eql(nil)
    end

    it 'should reset the verify_ssl value' do
      expect(bwapi.verify_ssl).to eql(nil)
    end
  end

  describe '.options' do
    before { bwapi.reset }

    it 'should return the current configuration set' do
      expect(bwapi.send(:options)).to eql(
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
end
