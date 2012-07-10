require 'redmine'
require 'http_auth_patch'
 
Redmine::Plugin.register :redmine_http_auth do
  name 'HTTP Authentication plugin'
  author 'Adam Lantos'
  url 'http://github.com/AdamLantos/redmine_http_auth' if respond_to?(:url)
  description 'A plugin for doing HTTP authentication'
  version '0.3.0-dev'

  settings :partial => 'settings/redmine_http_auth_settings',
    :default => {
      'enable' => 'true',
      'server_env_var' => 'REMOTE_USER',
      'lookup_mode' => 'login',
      'auto_registration' => 'false',
      'keep_sessions' => 'false'
    }
end

ActionDispatch::Callbacks.to_prepare do
  #include our code
  ApplicationController.send(:include, HTTPAuthPatch)
end

