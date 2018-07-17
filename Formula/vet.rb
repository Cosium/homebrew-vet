class Vet < Formula
  desc "Gerrit client using pull request review workflow"
  homepage "https://github.com/Cosium/vet"
  url "https://github.com/Cosium/vet/releases/download/3.17/vet-macosx_x64.zip"
  sha256 "a33aed5a3ef8127078abffdd83b44e4d279a5b4d9b66db9a8bd6a945564749af"
  def install
    prefix.install Dir["*"]
    system "mv", "#{prefix}/bin", "#{prefix}/bins"
    bin.install_symlink "#{prefix}/bins/vet"
    File.open("#{prefix}/bin/vet", "w") { |f|
	f << "#! /bin/sh
"
        f << "#{prefix}/bins/vet $@"
    }
  end
   test do
    system "#{bin}/vet", "--version"
  end
end
