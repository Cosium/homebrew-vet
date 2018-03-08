 class Vet < Formula
  desc "Gerrit client using pull request review workflow"
  homepage "https://github.com/Cosium/vet"
  url "https://github.com/Cosium/vet/releases/download/1.5/vet-macosx_x64.zip"
  sha256 "b14088971c3dd293b2177130ee0d0e93a02b01489de718e99022060fbf9e74f7"
  def install
    prefix.install Dir["*"]
    system "mv", "#{prefix}/bin", "#{prefix}/bins"
    bin.install_symlink "#{prefix}/bins/vet"
    File.open("#{prefix}/bin/vet", "w") { |f|
	f << "#! /bin/sh\n"
        f << "#{prefix}/bins/vet $@"
    }
  end
   test do
    system "#{bin}/vet", "--version"
  end
end

