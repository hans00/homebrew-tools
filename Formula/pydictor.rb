class Pydictor < Formula
  desc "Dictionary generator tool"
  homepage "https://github.com/LandGrey/pydictor"
  url "https://github.com/LandGrey/pydictor/archive/v2.0.5.tar.gz"
  sha256 "c03e9ae6883e0fdc18a4e1b73241d576c5e9d3e6cffeb77a06b434118958a447"
  version "2.0.5"
  head "https://www.github.com/landgrey/pydictor.git"

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel
    prefix.install "pydictor.py", "funcfg", "core", "lib", "plugins", "results", "rules", "tools", "wordlist"

    (prefix/"run").write <<~EOS
    #!/bin/sh
    #{prefix}/pydictor.py $@
    EOS

    bin.install_symlink prefix/"run" => "pydictor"

    system "chmod", "775", prefix/"pydictor.py"
    system "chmod", "775", prefix/"run"
  end

  test do
    system "false"
  end
end
