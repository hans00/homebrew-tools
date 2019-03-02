# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://www.rubydoc.info/github/Homebrew/brew/master/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Pydictor < Formula
  desc ""
  homepage "https://github.com/LandGrey/pydictor"
  url "https://github.com/LandGrey/pydictor/archive/v2.0.5.tar.gz"
  sha256 "c03e9ae6883e0fdc18a4e1b73241d576c5e9d3e6cffeb77a06b434118958a447"
  version "2.0.5"
  head "https://www.github.com/landgrey/pydictor.git"
  # depends_on "cmake" => :build

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel
    # Remove unrecognized options if warned by configure
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
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test pydictor`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
