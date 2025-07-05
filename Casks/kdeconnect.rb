cask "kdeconnect" do
  arch arm: "arm64", intel: "x86_64"

  version "5168"
  sha256  arm: "c6881a63723982a795cf11f6d6961eebe30c8536a1e900bff4db49f07c7df07d",
          intel: "0eac725541f76eb4265bbdba7cd9248fb2106a886681b6afb575c4ec2369b1d4"

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
