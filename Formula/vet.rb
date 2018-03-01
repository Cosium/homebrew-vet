 class Vet < Formula
  desc "Gerrit client using pull request review workflow"
  homepage "https://github.com/Cosium/vet"
  url "https://github.com/Cosium/homebrew-vet/releases/download/1.0/vet-macosx_x64.zip"
  sha256 "89af9a7911a861198cb602afcb28994f8dee6d4d4ff2214b1cb64f5534b076ec"
  def install
    prefix.install Dir["*"]
    system "mv", "#{prefix}/bin", "#{prefix}/bins"
    system "mkdir", "#{prefix}/bin"
    File.open("#{prefix}/bin/vet", "w") { |f|
	f << "#! /bin/sh\n"
        f << "#{prefix}/bins/vet $@"
    }
  end
   test do
    system "#{bin}/vet", "--version"
  end
end

