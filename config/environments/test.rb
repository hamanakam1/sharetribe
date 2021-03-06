Kassi::Application.configure do
  # Settings specified here will take precedence over those in config/environment.rb

  # The test environment is used exclusively to run your application's
  # test suite.  You never need to work with it otherwise.  Remember that
  # your test database is "scratch space" for the test suite and is wiped
  # and recreated between test runs.  Don't rely on the data there!
  config.cache_classes = true

  # Log error messages when you accidentally call methods on nil.
  config.whiny_nils = true

  # Show full error reports and disable caching
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Raise exceptions instead of rendering exception templates
  config.action_dispatch.show_exceptions = false

  # Disable request forgery protection in test environment
  config.action_controller.allow_forgery_protection    = true

  # Tell Action Mailer not to deliver emails to the real world.
  # The :test delivery method accumulates sent emails in the
  # ActionMailer::Base.deliveries array.
  config.action_mailer.delivery_method = :cache
  config.action_mailer.cache_settings = { :location => "#{Rails.root}/tmp/cache/action_mailer_cache_delivery#{ENV['TEST_ENV_NUMBER']}.cache" }

  # Use SQL instead of Active Record's schema dumper when creating the test database.
  # This is necessary if your schema can't be completely dumped by the schema dumper,
  # like if you have constraints or database-specific column types
  # config.active_record.schema_format = :sql
    
  config.active_support.deprecation = :stderr  
  
  # As instructed by Devise, to make local mails work
  config.action_mailer.default_url_options = { :host => 'test.lvh.me:9887' }
  
  # Use chrome for testing javascript
  if ENV["USE_CHROME"]
    require "selenium-webdriver"
    Selenium::WebDriver.for :chrome
  end
  
  Capybara.default_wait_time = 10
  Capybara.ignore_hidden_elements = true
  
  ENV['RAILS_ASSET_ID'] = ""
  
  # Configure static asset server for tests with Cache-Control for performance  
  config.serve_static_assets = true  
  config.static_cache_control = "public, max-age=3600"  
  
  # Raise exception on mass assignment protection for Active Record models
  config.active_record.mass_assignment_sanitizer = :strict
  
end
