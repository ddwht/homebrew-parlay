class ParlayStudio < Formula
  desc "Parlay Studio — designer-facing extension to parlay (Domain Model Editor, Design Loop skill)"
  homepage "https://github.com/ddwht/parlay"
  url "https://github.com/ddwht/parlay/archive/refs/tags/studio-v0.1.1.tar.gz"
  version "0.1.1"
  sha256 "1ce90813d2b24021015896c854dc9dbfa7856fb98cea4d786ac68e6e8ac440c5"
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
