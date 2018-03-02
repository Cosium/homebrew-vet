 class Vet < Formula
  desc "Gerrit client using pull request review workflow"
  homepage "https://github.com/Cosium/vet"
  url "https://github.com/Cosium/vet/releases/download/1.1/vet-macosx_x64.zip"
  sha256 "14fad9e9c3dfa20dc84dafda0a595bb5fb18c03d717d307c7dd44d262f7d86ca"
  def install
    prefix.install Dir["*"]
    system "mv", "#{prefix}/bin", "#{prefix}/bins"
    bin.install_symlink "#{prefix}/bin/vet"
    File.open("#{prefix}/bin/vet", "w") { |f|
	f << "#! /bin/sh\n"
        f << "#{prefix}/bins/vet $@"
    }
  end
   test do
    system "#{bin}/vet", "--version"
  end
end

