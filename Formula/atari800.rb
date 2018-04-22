class Atari800 < Formula
  desc "Atari 8-bit machine emulator"
  homepage "https://atari800.github.io/"
  url "https://downloads.sourceforge.net/project/atari800/atari800/4.0.0/atari800-4.0.0.tar.gz"
  sha256 "08e9b989ddb2785265d242ff92b416a2b53c285c7309f3fc3f5e94889cb69eb5"

  bottle do
    cellar :any
    sha256 "a710808012b07e06ec1d5353093b2fb496e6a8413a3f821f69bac715c87a787e" => :high_sierra
    sha256 "79ea3412dc5437df7b24db916be00ee402c2028620d128d8247f6be2a275c08d" => :sierra
    sha256 "c1b4b17e03ee1685d8b7562f410f75a7c0fa679b00e0505b251741de59eaecb7" => :el_capitan
    sha256 "5474b61b32e2ac3aa5e594c5e617e326aeedc62f8e740b2888ba654db273296a" => :yosemite
  end

  depends_on "sdl"
  depends_on "libpng"

  def install
    cd "src" do
      system "./configure", "--prefix=#{prefix}",
                            "--disable-sdltest"
      system "make", "install"
    end
  end

  test do
    assert_equal "Atari 800 Emulator, Version #{version}",
                 shell_output("#{bin}/atari800 -v", 3).strip
  end
end
