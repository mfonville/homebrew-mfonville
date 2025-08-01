cask "kdeconnect" do
  arch arm: "arm64", intel: "x86_64"

  version "5256"
  sha256  arm:   "ca1c744ee3de8ebaf7bbf4f746ac62b475cd3f682a405a22ad21a7cb4e64ef44",
          intel: "99fe337ebc42bc24febcfc7e9f60ca4867955467ad52604a3b05fb6c548c5d34"

  url "https://cdn.kde.org/ci-builds/network/kdeconnect-kde/master/macos-#{arch}/kdeconnect-kde-master-#{version}-macos-clang-#{arch}.dmg"
  name "KDE Connect"
  desc "Enabling communication between all your devices"
  homepage "https://kdeconnect.kde.org/"

  livecheck do
    url "https://cdn.kde.org/ci-builds/network/kdeconnect-kde/master/macos-#{arch}/"
    regex(/href=.*?kdeconnect[._-]kde[._-]master[._-]v?(\d+(?:\.\d+)*)[._-]macos[._-]clang[._-]#{arch}\.dmg/i)
  end

  depends_on macos: ">= :monterey"

  app "KDE Connect.app"

  zap trash: [
    "~/Library/Application Support/kdeconnect.sms",
    "~/Library/Caches/kdeconnect-indicator",
    "~/Library/Caches/kdeconnect.daemon",
    "~/Library/Caches/kdeconnect.sms",
    "~/Library/Preferences/kdeconnect",
    "~/Library/Preferences/org.kde.kdeconnect.plist",
  ]
end
