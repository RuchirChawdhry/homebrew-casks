cask 'docfetcher' do
    version '1.1.22'
    md5 '9762d9fe7c59db2f04551393dc682781'

    url 'https://excellmedia.dl.sourceforge.net/project/docfetcher/docfetcher/1.1.22/DocFetcher-1.1.22.dmg'
    appcast 'https://sourceforge.net/projects/docfetcher/rss?path=/docfetcher'
    name 'DocFetcher'
    homepage 'http://docfetcher.sourceforge.net/en/index.html'

    app 'DocFetcher.app'
end
