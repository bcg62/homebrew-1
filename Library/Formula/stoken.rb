class Stoken < Formula
  desc "Tokencode generator compatible with RSA SecurID 128-bit (AES)"
  homepage "http://stoken.sourceforge.net/"
  url "https://downloads.sourceforge.net/project/stoken/stoken-0.90.tar.gz"
  sha256 "b83d7b95e4ad9b107ab8a5b6c26da0f233001fdfda78d8be76562437d3bd4f7d"

  bottle do
    cellar :any
    sha1 "d2fc515e490de6bc426eaf2107904e2f367ee628" => :yosemite
    sha1 "c77630e2aff83fb1b80b720fc301a0e50a7a2d4a" => :mavericks
    sha1 "31ce6acf84301626c0763fd3815ccd1c83ae4d36" => :mountain_lion
  end

  depends_on "gtk+3" => :optional
  if build.with? "gtk+3"
    depends_on "gnome-icon-theme"
    depends_on "hicolor-icon-theme"
  end
  depends_on "pkg-config" => :build
  depends_on "nettle"

  def install
    args = %W[
      --disable-dependency-tracking
      --disable-debug
      --disable-silent-rules
      --prefix=#{prefix}
    ]

    system "./configure", *args
    system "make", "check"
    system "make", "install"
  end

  test do
    system "#{bin}/stoken", "show", "--random"
  end
end
