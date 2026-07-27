class ParlayStudio < Formula
  desc "Parlay Studio — designer-facing extension to parlay (Domain Model Editor, Design Loop skill)"
  homepage "https://github.com/ddwht/parlay"
  url "https://github.com/ddwht/parlay/archive/refs/tags/studio-v0.1.2.tar.gz"
  version "0.1.2"
  sha256 "7589ff4cd06901809f54ead1683c80b53c0509cd141a0eba0606a7847018463f"
  license "MIT"

  depends_on "go" => :build
  depends_on "parlay"

  def install
    cd "studio" do
      ldflags = %W[
        -s -w
        -X main.version=#{version}
        -X main.commit=#{tap.user}
      ]
      system "go", "build", *std_go_args(ldflags:), "./cmd/parlay-studio"
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/parlay-studio version")
  end
end
