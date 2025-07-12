cask "kdeconnect" do
  arch arm: "arm64", intel: "x86_64"

  version "5196"
  sha256  arm:   "ab885b58924d62c1766231a0b9375bfa0c20ec5c54a59f4b1e5ae258d7c22a93",
          intel: "ce8d4b53f1e4d1d7520ea56dd1f033a89a03613e02788952b9cdadced71f8635"

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
