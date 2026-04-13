class Parlay < Formula
  desc "Intent-driven specification framework"
  homepage "https://github.com/ddwht/parlay"
  url "https://github.com/ddwht/parlay/archive/refs/tags/v0.1.3.tar.gz"
  sha256 "876ae3f394fe5620d226c59706f103c1f7c82a97b2980620ca5c8c97c8e6aac8"
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
