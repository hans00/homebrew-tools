cask 'flutter' do

  name "Flutter"
  homepage "https://www.flutter.dev"

  version "1.9.1+hotfix.6"
  sha256 "1bd5d165c79efebfba39e4602d6e07e74b40798630eb7173caedf0f664c53035"
  url "https://storage.googleapis.com/flutter_infra/releases/stable/macos/flutter_macos_v#{version}-stable.zip"

  depends_on cask: "android-sdk"
  depends_on cask: "visual-studio-code"
  depends_on :arch => :x86_64

  binary "#{staged_path}/flutter/bin/flutter"

  postflight do
    safe_system "#{staged_path}/flutter/bin/flutter doctor"
  end

  caveats do
    <<~EOS
      You may want to add to your profile:

        'source <(flutter bash-completion)'
    EOS
  end
end
