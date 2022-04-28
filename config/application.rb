require_relative 'boot'

require 'rails/all'
require 'ipaddr'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module DcoCheckout
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end

Rails.application.configure do
  # time
  config.time_zone = 'Eastern Time (US & Canada)'
  config.datetime_format = '%l:%M %p on %B %e, %Y'

  # Uniqnames of DCO staff who can edit
  config.administrators = [:victorbp, :laura, :don, :lrandolp, :hugh, :jvanlav, :liz, :dholt, :stander, :cpuzzuol, :pbhill, :gkroslak, :hayjacob, :jribben, :kowalskj, :josuegon]

  # number of items to show on index/listing pages (numbers greater than this
  # result in the page being split into multiple sub-pages)
  config.index_length = 20

  # Computers that can check stuff out
  # 1 represents the EECS office, 2 represents the BBB office
  config.checkout_computers = {
    '141.212.104.27' => 2, # eecs-dco-frontcomp1, in EECS
    '141.212.106.192' => 1 # dco-checkout-imac in BBB
  }

  config.office_subnets = {
    # this is all copied from the subnet reference table in DNS
    # 1 is BBB
    # 2 is EECS
    IPAddr.new('10.160.28.0/22') => 1, # V-BEYSTER-INFRASTRUCTURE  BBB Room/Floor  all Beyster whole building, UM only
    IPAddr.new('10.160.65.0/24') => 1, # V-BEYSTER2924-INFRASTRUCTURE  BBB Room/Floor  2924  Beyster machine room UM internal
    IPAddr.new('10.161.2.0/24') => 1, # DEPT-EECS-VLSI  BBB Room/Floor    VLSIPOOL subnet
    IPAddr.new('10.213.1.0/24') => 1, # DEPT-EECS-JAG BBB Room/Floor  2924  Isilon
    IPAddr.new('141.212.104.128/25') => 1, # V-EECS-DCO-BEYSTER  BBB Room/Floor  2917  BBB DCO office
    IPAddr.new('141.212.105.0/24') => 1, # DEPT-EECS-CSE-1 BBB Room/Floor  16  BBB 1st floor
    IPAddr.new('141.212.106.0/24') => 1, # DEPT-EECS-CSE-2A  BBB Room/Floor  2 BBB 2nd floor west
    IPAddr.new('141.212.107.0/24') => 1, # DEPT-EECS-CSE-2B  BBB Room/Floor  2 BBB 2nd floor east
    IPAddr.new('141.212.108.0/24') => 1, # DEPT-EECS-CSE-3A  BBB Room/Floor  3 BBB 3rd floor west
    IPAddr.new('141.212.109.0/24') => 1, # DEPT-EECS-CSE-3B  BBB Room/Floor  3 BBB 3rd floor east
    IPAddr.new('141.212.11.0/24') => 1, # DEPT-BBB-PRABAL BBB Room/Floor    Prabal Dutta research
    IPAddr.new('141.212.110.0/24') => 1, # DEPT-EECS-CSE-4A  BBB Room/Floor  4 BBB 4th floor west
    IPAddr.new('141.212.111.0/24') => 1, # DEPT-EECS-CSE-4B  BBB Room/Floor  4 BBB 4th floor east
    IPAddr.new('141.212.112.0/24') => 1, # DEPT-EECS-CITI  BBB Room/Floor    CITI
    IPAddr.new('141.212.113.0/24') => 1, # DEPT-EECS-CSE-MR  BBB Room/Floor  2924  BBB 2924 machine room
    IPAddr.new('141.212.119.0/24') => 1, # DEPT-EECS-HONEYPOT  BBB Room/Floor    Farnam research
    IPAddr.new('141.212.120.0/24') => 1, # DEPT-CSE-HALDERMAN-LAB  BBB Room/Floor    Alex Halderman research
    IPAddr.new('141.212.121.0/24') => 1, # FIREWALL-ADMIN-OUTSIDE  BBB Room/Floor    Alex Halderman research
    IPAddr.new('141.212.122.0/24') => 1, # ? BBB Room/Floor    Alex Halderman research
    IPAddr.new('141.213.16.0/24') => 1, # ? BBB Room/Floor    Farnam research
    IPAddr.new('141.213.3.0/24') => 1, # DEPT-EECS-MR-2  BBB Room/Floor  2924  BBB 2924, UM only
    IPAddr.new('141.213.56.0/24') => 1, # CSE-LAB-MAC-1695  BBB Room/Floor  1 CAEN lab imac
    IPAddr.new('10.160.24.0/22') => 2, # V-EECS-INFRASTRUCTURE EECS  Room/Floor  all EECS whole building, UM only
    IPAddr.new('10.160.64.0/24') => 2, # V-EECS4312-INFRASTRUCTURE EECS  Room/Floor  4312  EECS machine room UM internal
    IPAddr.new('141.212.104.0/25') => 2, # V-EECS-DCO-EECS EECS  Room/Floor  4403  EECS DCO offices
    IPAddr.new('141.213.10.0/24') => 2, # DEPT-EECS-EECS-3N EECS  Room/Floor  3 EECS 3rd floor north
    IPAddr.new('141.213.11.0/24') => 2, # DEPT-EECS-EECS-3S EECS  Room/Floor  3 EECS 3rd floor south
    IPAddr.new('141.213.14.0/24') => 2, # DEPT-EECS-EECS-4N EECS  Room/Floor  4 EECS 4th floor north
    IPAddr.new('141.213.15.0/24') => 2, # DEPT-EECS-EECS-4S EECS  Room/Floor  4 EECS 4th floor south
    IPAddr.new('141.213.17.0/24') => 2, # DEPT-EECS-EECS-MAC4 EECS  Room/Floor  ? old Mac net
    IPAddr.new('141.213.4.0/24') => 2, # DEPT-EECS-EECS-SRVR EECS  Room/Floor  4312  EECS 4312 machine room
    IPAddr.new('141.213.6.0/24') => 2, # DEPT-EECS-EECS-1N EECS  Room/Floor  1 EECS 1st floor north
    IPAddr.new('141.213.7.0/24') => 2, # DEPT-EECS-EECS-1S EECS  Room/Floor  1 EECS 1st floor south
    IPAddr.new('141.213.8.0/24') => 2, # DEPT-EECS-EECS-2N EECS  Room/Floor  2 EECS 2nd floor north
    IPAddr.new('141.213.9.0/24') => 2 # DEPT-EECS-EECS-2S EECS  Room/Floor  2 EECS 2nd floor south
  }

  # Cosign Stuff
  config.cosign_login_path = "https://weblogin.umich.edu/?cosign-checkout.eecs&https://checkout.eecs.umich.edu/"
  config.cosign_logout_path = "https://weblogin.umich.edu/cosign-bin/logout?https://checkout.eecs.umich.edu/"

  # use the routes defined to handle exceptions (HTTP 404, 500)
  config.exceptions_app = self.routes

  # Email Settings (environment-specific stuff in respective files)
  config.action_mailer.perform_deliveries = true
  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.default_options = {from: 'no-reply@eecs.umich.edu'}
  config.action_mailer.default_url_options = { :host => 'checkout.eecs.umich.edu' }
end
