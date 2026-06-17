class ParlayStudio < Formula
    desc "Parlay Studio — designer-facing extension to parlay (Domain Model Editor, Design Loop)"
    homepage "https://github.com/<user>/parlay"
    version "0.1.0"

    if OS.mac? && Hardware::CPU.arm?
      url
  "https://github.com/<user>/parlay/releases/download/studio-v#{version}/parlay-studio-darwin-arm64.tar.gz"
      sha256 "<paste-from-release-artifact>"
    elsif OS.mac? && Hardware::CPU.intel?
      url
  "https://github.com/<user>/parlay/releases/download/studio-v#{version}/parlay-studio-darwin-amd64.tar.gz"
      sha256 "<paste-from-release-artifact>"
    elsif OS.linux? && Hardware::CPU.arm?
      url
  "https://github.com/<user>/parlay/releases/download/studio-v#{version}/parlay-studio-linux-arm64.tar.gz"
      sha256 "<paste-from-release-artifact>"
    else
      url
  "https://github.com/<user>/parlay/releases/download/studio-v#{version}/parlay-studio-linux-amd64.tar.gz"
      sha256 "<paste-from-release-artifact>"
    end

    depends_on "parlay"  # parlay-studio is an extension; parlay must be installed first

    def install
      bin.install "parlay-studio"
    end

    test do
      # binary loads + exits non-zero without a project (which is correct behavior)
      assert_match "studio-config", shell_output("#{bin}/parlay-studio --project /nonexistent 2>&1", 1)
    end
  end
