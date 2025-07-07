cask "kdeconnect" do
  arch arm: "arm64", intel: "x86_64"

  version "5180"
  sha256  arm:   "d37070da9c17ae9f37d36399a8d0743c7ff0cb723f3bf756ba390aa18c9135ac",
          intel: "56f2cdebfe3e671bb2f6c7b7e967f904bb5800b4bf682480608e0de3d9dd854c"

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
