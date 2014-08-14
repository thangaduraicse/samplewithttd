# IMPORTANT: This file is generated by cucumber-rails - edit at your own peril.
# It is recommended to regenerate this file in the future when you upgrade to a
# newer version of cucumber-rails. Consider adding your own code to a new file
# instead of editing this one. Cucumber will automatically load all features/**/*.rb
# files.
require 'rubygems'
require 'spork'

Spork.prefork do
	ENV["RAILS_ENV"] ||="cucumber"
	require File.expand_path(File.dirname(__FILE__) + '/../../config/environment')

	require 'cucumber/rails'
	require 'cucumber'
	require 'cucumber/formatter/unicode'
	require 'rspec/rails'
	#require 'cucumber/rails/rspec'

# Capybara defaults to CSS3 selectors rather than XPath.
# If you'd prefer to use XPath, just uncomment this line and adjust any
# selectors in your step definitions to use the XPath syntax.
# Capybara.default_selector = :xpath
	Capybara.default_selector=:css
end
# By default, any exception happening in your Rails application will bubble up
# to Cucumber so that your scenario will fail. This is a different from how 
# your application behaves in the production environment, where an error page will 
# be rendered instead.
#
# Sometimes we want to override this default behaviour and allow Rails to rescue
# exceptions and display an error page (just like when the app is running in production).
# Typical scenarios where you want to do this is when you test your error pages.
# There are two ways to allow Rails to rescue exceptions:
#
# 1) Tag your scenario (or feature) with @allow-rescue
#
# 2) Set the value below to true. Beware that doing this globally is not
# recommended as it will mask a lot of errors for you!
#
Spork.each_run do
	ActionController::Base.allow_rescue = false
	Cucumber::Rails::World.use_transactional_fixtures=true

# Remove/comment out the lines below if your app doesn't have a database.
# For some databases (like MongoDB and CouchDB) you may need to use :truncation instead.
begin
  DatabaseCleaner.strategy = :transaction,{ :except => %w[users asn_slash_codes asn_order_statuses cdf_binding_codes po_statuses po_types poa_statuses poa_types products variants line_items orders] }
rescue NameError
  raise "You need to add database_cleaner to your Gemfile (in the :test group) if you wish to use it."
end

# You may also want to configure DatabaseCleaner to use different strategies for certain features and scenarios.
# See the DatabaseCleaner documentation for details. Example:
#
#   Before('@no-txn,@selenium,@culerity,@celerity,@javascript') do
#     # { :except => [:widgets] } may not do what you expect here
#     # as Cucumber::Rails::Database.javascript_strategy overrides
#     # this setting.
#     DatabaseCleaner.strategy = :truncation
#   end
#
#   Before('~@no-txn', '~@selenium', '~@culerity', '~@celerity', '~@javascript') do
#     DatabaseCleaner.strategy = :transaction
#   end
#

	Dir.glob(File.join(File.dirname(__FILE__), "../app/**/*_decorator.rb")) do |f|
	    Rails.configuration.cache_classes ? require(f) : load(f)
  	end
	require 'spree_core/testing_support/factories'
end

# Possible values are :truncation and :transaction
# The :transaction strategy is faster, but might give you threading problems.
# See https://github.com/cucumber/cucumber-rails/blob/master/features/choose_javascript_database_strategy.feature
#Cucumber::Rails::Database.javascript_strategy = :truncation

