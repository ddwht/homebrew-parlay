class Parlay < Formula
  desc "Intent-driven specification framework"
  homepage "https://github.com/ddwht/parlay"
  url "https://github.com/ddwht/parlay/archive/refs/tags/v0.1.6.tar.gz"
  sha256 "9798d042c3a030ccd858bc1435b4212c4e2002bd5d48ec70c23b2b7f2a5d087e"
  license "MIT"

  depends_on "go" => :build

  def install
    ldflags = %W[
      -s -w
      -X main.version=#{version}
      -X main.commit=#{tap.user}
    ]
    system "go", "build", *std_go_args(ldflags:), "./cmd/parlay"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/parlay version")
  end
end
