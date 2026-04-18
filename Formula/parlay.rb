class Parlay < Formula
  desc "Intent-driven specification framework"
  homepage "https://github.com/ddwht/parlay"
  url "https://github.com/ddwht/parlay/archive/refs/tags/v0.1.8.tar.gz"
  sha256 "832b926b1097a5bb119547655cee79a8383ff8c037d7c1aedbd2257aac313922"
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
