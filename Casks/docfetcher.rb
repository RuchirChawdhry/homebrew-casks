cask 'docfetcher' do
    version '1.1.22'
    sha256 '658ef7d80cb28d9cd108904db5ad5ec19a158ba5dff063660cdfbdd927567d77'

    url 'https://excellmedia.dl.sourceforge.net/project/docfetcher/docfetcher/1.1.22/DocFetcher-1.1.22.dmg'
    appcast 'https://sourceforge.net/projects/docfetcher/rss?path=/docfetcher'
    name 'DocFetcher'
    homepage 'http://docfetcher.sourceforge.net/en/index.html'

    app 'DocFetcher.app'
end
