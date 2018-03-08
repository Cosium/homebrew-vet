 class Vet < Formula
  desc "Gerrit client using pull request review workflow"
  homepage "https://github.com/Cosium/vet"
  url "https://github.com/Cosium/vet/releases/download/1.4/vet-macosx_x64.zip"
  sha256 "1ba773deb1321064da228ea30729ead4a585e91a8170d38cb251ebc474f12b28"
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

