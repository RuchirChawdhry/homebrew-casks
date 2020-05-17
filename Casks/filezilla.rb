require 'net/http'
require 'json'
require 'uri'


cask 'audacity' do
    version '3.48.0'
    sha256 :no_check
    
    def get_url
        fosshub_response = nil
        uri = URI("https://api.fosshub.com/download/")
        Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
            request = Net::HTTP::Post.new(uri, 'Content-Type' => 'application/json', 'User-Agent' => 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36')
            request.body = {
                "fileName" => "FileZilla_3.48.0_macosx-x86.app.tar.bz2",
                "projectId" => "5b86d494f9ee5a5c3e97a1b1",
                "projectUri" => "FileZilla.html",
                "releaseId" => "5eab0ac4ed43a381109f642c",
                "source" => "CF"
            }.to_json
            response = http.request request
            fosshub_response = JSON.parse(response.body)
        end
        return fosshub_response['data']['url']
    end

    url get_url
    name 'FileZilla'
    homepage 'https://filezilla-project.org/'

    app 'FileZilla.app'
end
