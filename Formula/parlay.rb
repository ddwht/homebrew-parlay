class Parlay < Formula                                                                             
  desc "Intent-driven specification framework"
  homepage "https://github.com/ddwht/parlay"                                                       
  url "https://github.com/ddwht/parlay/archive/refs/tags/v0.1.12.tar.gz"
  sha256 "10d2f96d62cb6fcf495d1f4ad42c677fa8e8a202e249734e8b2dea0fb2b138b4"                        
  license "MIT" 
                                                                                                   
  depends_on "go" => :build
                                                                                                   
  def install   
    ldflags = %W[
      -s -w
      -X main.version=#{version}
      -X main.commit=#{tap.user}
    ]
    system "go", "build", *std_go_args(ldflags:), "./core/cmd/parlay"                              
  end
                                                                                                   
  test do       
    assert_match version.to_s, shell_output("#{bin}/parlay version")
  end                                                                                              
end
