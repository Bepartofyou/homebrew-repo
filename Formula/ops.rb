class Ops < Formula
    desc "A reliable, low-latency, and anti-censorship virtual private network"
    homepage "https://github.com/zero-rp/ops"
    url "https://github.com/zero-rp/ops/archive/refs/heads/master.zip"
    sha256 "fbd7f04f2a7e3912086e0fff7ec0c7af69a5a73c9b43ca5b71a307e9bd58b09e"
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
            system "cmake", "-S", ".", "-B", "build", *std_cmake_args
            system "cmake", "--build", "build"
            system "cmake", "--install", "build"
        end
        # 其他安装步骤
    end

    # service do
    #   run [opt_bin/"candy", "-c", etc/"candy.cfg"]
    #   keep_alive true
    #   require_root true
    # end

end