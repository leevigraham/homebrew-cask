class Github < Cask
  version :latest
  sha256 :no_check

  url 'https://central.github.com/mac/latest'
  homepage 'http://mac.github.com'
  license :oss

  app 'GitHub.app'
  binary 'GitHub.app/Contents/MacOS/github_cli', :target => 'github'
  postflight do
    system '/usr/bin/defaults', 'write', 'com.github.GitHub', 'moveToApplicationsFolderAlertSuppress', '-bool', 'true'
  end

  zap :delete => [
                  '~/Library/Application Support/GitHub for Mac',
                  '~/Library/Application Support/ShipIt_stderr.log',
                  '~/Library/Application Support/ShipIt_stdout.log',
                  '~/Library/Application Support/com.github.GitHub',
                  '~/Library/Application Support/com.github.GitHub.ShipIt',
                  '~/Library/Caches/GitHub for Mac',
                  '~/Library/Caches/com.github.GitHub',
                  '~/Library/Containers/com.github.GitHub.Conduit',
                 ]
end
