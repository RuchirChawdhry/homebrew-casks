cask 'docfetcher' do
    version '1.1.22'
    sha256 :no_fetch

    url 'https://excellmedia.dl.sourceforge.net/project/docfetcher/docfetcher/1.1.22/DocFetcher-1.1.22.dmg'
    appcast 'https://sourceforge.net/projects/docfetcher/rss?path=/docfetcher'
    name 'DocFetcher'
    homepage 'http://docfetcher.sourceforge.net/en/index.html'

    app 'DocFetcher.app'
end
