require 'thor/group'

module SakurraForm
  class CLI  < Thor
    include Thor::Actions

    def self.source_root
      File.expand_path("../../", __FILE__)
    end

    desc 'init', 'initiaize .sakuracloud/credentials'
    def init
      empty_directory('.sakuracloud')
      @sakuracloud_api_token = ask("Sakuracloud_api_token(required) ? ")
      @sakuracloud_api_token_secret = ask("Sakuracloud_api_token_secret(required) ? ")
      @sakura_base_storage_bucket = ask("Sakura Base Storage buket name(optional) ? ")
      @sakura_base_storage_token = ask("Sakura Base Storage token(optional) ? ")
      template('templates/credentials.tt', ".sakuracloud/credentials")
    end
  end
end
