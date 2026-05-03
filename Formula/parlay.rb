class Parlay < Formula
  desc "Intent-driven specification framework"
  homepage "https://github.com/ddwht/parlay"
  url "https://github.com/ddwht/parlay/archive/refs/tags/v0.1.13.tar.gz"
  sha256 "0560dbec072db937666910cfe40b2e85c75fad8584ffb2d4e4a1eab7c3467073"
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
