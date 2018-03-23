class Vet < Formula
  desc "Gerrit client using pull request review workflow"
  homepage "https://github.com/Cosium/vet"
  url "https://github.com/Cosium/vet/releases/download/1.13/vet-macosx_x64.zip"
  sha256 "499d92e644cff3406a6ca2f2cce18808f2705eec9c3417b8704b2ba3930544a8"
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
