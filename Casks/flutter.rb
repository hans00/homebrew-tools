cask 'flutter' do

  name "Flutter"
  homepage "https://www.flutter.dev"

  version "1.7.8+hotfix.3"
  sha256 "74ac8397ea29720f116980ea00cf60c34430be1f64489b407f7cf95553babbef"
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
