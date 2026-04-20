class Parlay < Formula
  desc "Intent-driven specification framework"
  homepage "https://github.com/ddwht/parlay"
  url "https://github.com/ddwht/parlay/archive/refs/tags/v0.1.10.tar.gz"
  sha256 "7f880136d57b85b292f73a027a89f73d50ff03762072d44a291976b73e99a19e"
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
