# Documentation: https://docs.brew.sh/Formula-Cookbook
#                http://www.rubydoc.info/github/Homebrew/brew/master/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Vmctl < Formula
  desc 'Uniform interface to multiple virtual machines'
#  homepage ''
  url 'https://github.com/MasWag/vmctl/archive/master.tar.gz'
  version 'master'
#  sha256 'c3e843b8ea33e7fc33b527c7a33670e63625a0dcba49af594bea9f195e25be94'

  depends_on 'jq'
  depends_on 'awscli' => :recommended
  depends_on 'bash-completion' => :optional
  depends_on 'caskroom/cask/virtualbox' => :optional

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel
    # Remove unrecognized options if warned by configure
    system 'mkdir', '-p', "#{prefix}/bin"
    system 'install', 'src/vmctl', "#{prefix}/bin/vmctl"
    system 'mkdir', '-p', "#{prefix}/share/man/man1"
    system 'install', 'doc/vmctl.1', "#{prefix}/share/man/man1/vmctl.1"

    if build.with? 'bash-completion'
      system 'mkdir', '-p', "#{prefix}/etc/bash_completion.d/"
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
