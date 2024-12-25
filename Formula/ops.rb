class Ops < Formula
    desc "A reliable, low-latency, and anti-censorship virtual private network"
    homepage "https://github.com/zero-rp/ops"
    url "https://github.com/Bepartofyou/homebrew-repo/archive/refs/tags/v0.0.1.tar.gz"
    sha256 "a48a2b4159627d4eb45c19e26cedcf4a4225bf4431639e964e390dd183ee7990"
    license "MIT"
    head "https://github.com/zero-rp/ops.git"
  
    depends_on "cmake" => :build
    depends_on "pkg-config" => :build
    # depends_on "openssl"
    # depends_on "fmt"
    # depends_on "spdlog"

    def install
        if build.head?
            system "git", "submodule", "update", "--init", "--recursive"
        end
        system "cmake", "-S", ".", "-B", "build", *std_cmake_args
        system "cmake", "--build", "build"
        system "cmake", "--install", "build"
    end

    # service do
    #   run [opt_bin/"candy", "-c", etc/"candy.cfg"]
    #   keep_alive true
    #   require_root true
    # end

end