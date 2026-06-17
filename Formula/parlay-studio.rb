class ParlayStudio < Formula
  desc "Parlay Studio — designer-facing extension to parlay (Domain Model Editor, Design Loop skill)"
  homepage "https://github.com/ddwht/parlay"
  url "https://github.com/ddwht/parlay/archive/refs/tags/studio-v0.1.0.tar.gz"
  version "0.1.0"
  sha256 "b5754581ad04670230e853f95bab8b469d432e0cf02017d4a7c9c3bf37198f0c"
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
