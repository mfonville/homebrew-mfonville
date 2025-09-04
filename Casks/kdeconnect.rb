cask "kdeconnect" do
  arch arm: "arm64", intel: "x86_64"

  version "5296"
  sha256  arm:   "1b559afd9f80d77aa8cad13f58dc067d802f91c9e9251d026a00a881fb2c56b3",
          intel: "e1702b350056ec1aa5fb5a1befd25844b1f7ce14b707da679cc079a9992797ac"

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
