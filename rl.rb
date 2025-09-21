class Rl < Formula
  desc "Enterprise-grade RL training infrastructure for everyone"
  homepage "https://github.com/rlhub-dev/homebrew-tap"
  version "2.2.0"  # Auto-updated by GitHub Actions
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/rlhub-dev/homebrew-tap/releases/download/v#{version}/rl-v#{version}-macos-arm64"
    sha256 "4e832ee07535c3ef35db5af5a6bd2a824b330270d0fb98796171fe8b59e624a8"  # Auto-updated by GitHub Actions
  else
    url "https://github.com/rlhub-dev/homebrew-tap/releases/download/v#{version}/rl-v#{version}-macos-amd64"
    sha256 "PLACEHOLDER_AMD64_SHA"  # Auto-updated by GitHub Actions
  end

  def install
    bin.install "rl-v#{version}-macos-#{Hardware::CPU.arch}" => "wirtual"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wirtual --version")
  end

  def caveats
    <<~EOS
      wirtual has been installed successfully!
      
      Get started:
        $ wirtual --help
      
      Documentation: https://rlhub.dev/docs
    EOS
  end
end
