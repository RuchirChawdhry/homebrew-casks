# https://gist.githubusercontent.com/varenc/f7f0afc32af0f8062ae727e4415326c6/raw/aec6e3d4bc9a53de440411acfb932b792783a9e8/audacity.rb

require 'net/http'
require 'json'
require 'url'


cask 'audacity' do
    version '2.4.0'
    sha256 '42d08496569556d22f2f22c84b9f0196ef207af1311a9089ebbfcf2af9e21922'
    
    def get_audacity_url
        fossbub_response = nil
        uri = URI("https://api.fosshub.com/download/")
        Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
            request = Net::HTTP::Post.new(uri, 'Content-Type' => 'application/json', 'User-Agent' => 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36')
            request.body = {
                "fileName" => "audacity-macos-2.4.0.dmg",
                "projectId" => "5b7eee97e8058c20a7bbfcf4",
                "projectUri" => "Audacity.html",
                "releaseId" => "5ebfc924b441ab1ddec3fb18",
                "source" => "CF"
            }.to_json
            response = http.request request
            fosshub_response = JSON.parse(response.body)
        end
        return fosshub_response['data']['url']
    end

    url get_audacity_url
    name 'Audacity'
    homepage 'https://www.audacityteam.org/'

    app 'Audacity.app'
    zap delete: '~/Library/Application Support/audacity'
end
