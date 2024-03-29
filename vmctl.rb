require 'formula'
HOMEBREW_VMCTL_VERSION='1.1'
# Documentation: https://docs.brew.sh/Formula-Cookbook
#                http://www.rubydoc.info/github/Homebrew/brew/master/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Vmctl < Formula
  desc 'Uniform interface to multiple virtual machines'
  homepage 'https://github.com/MasWag/vmctl'
  url 'https://github.com/MasWag/vmctl.git', tag: "v#{HOMEBREW_VMCTL_VERSION}"
  version HOMEBREW_VMCTL_VERSION
  head 'https://github.com/MasWag/vmctl.git', branch: 'master'

  depends_on 'jq'
  depends_on 'awscli' => :recommended
  #  depends_on 'google-cloud-sdk' => :recommended
  depends_on 'bash-completion' => :recommended
  #  depends_on 'virtualbox' => :optional

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel
    # Remove unrecognized options if warned by configure
    mkdir_p "#{prefix}/bin"
    system 'install', 'src/vmctl', "#{prefix}/bin/vmctl"
    mkdir_p "#{prefix}/share/man/man1"
    system 'install', 'doc/vmctl.1', "#{prefix}/share/man/man1/vmctl.1"

    if build.with? 'bash-completion'
      mkdir_p "#{prefix}/etc/bash_completion.d/"
      system 'install', 'src/vmctl_completion.bash', "#{prefix}/etc/bash_completion.d/"
    end
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test vmctl`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", 'do', 'something'`.
    system 'false'
  end
end
