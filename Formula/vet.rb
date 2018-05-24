class Vet < Formula
  desc "Gerrit client using pull request review workflow"
  homepage "https://github.com/Cosium/vet"
  url "https://github.com/Cosium/vet/releases/download/3.13/vet-macosx_x64.zip"
  sha256 "7fd635c65b0ad17adb4f5a65128c56a602bbed401b6a5f8e0aaffb760c3f83b0"
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
