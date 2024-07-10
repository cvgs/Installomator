zulujdk18)
    name="Zulu JDK 18"
    type="pkgInDmg"
    packageID="com.azulsystems.zulu.18"
    if [[ $(arch) == i386 ]]; then
        downloadURL=https://cdn.azul.com$( curl -fs "https://cdn.azul.com/zulu/bin/" | sed -ne 's/^.*<a href="\(.*zulu18.*ca-jdk18.*x64.dmg\)">.*$/\1/p' | sort -n | tail -1 )
    elif [[ $(arch) == arm64 ]]; then
        downloadURL=https://cdn.azul.com$( curl -fs "https://cdn.azul.com/zulu/bin/" | sed -ne 's/^.*<a href="\(.*zulu18.*ca-jdk18.*aarch64.dmg\)">.*$/\1/p' | sort -n | tail -1 )
    fi
    expectedTeamID="TDTHCUPYFR"
    appCustomVersion(){ if [ -f "/Library/Java/JavaVirtualMachines/zulu-18.jdk/Contents/Info.plist" ]; then /usr/bin/defaults read "/Library/Java/JavaVirtualMachines/zulu-18.jdk/Contents/Info.plist" "CFBundleName" | sed 's/Zulu //'; fi }
    appNewVersion=$(echo "$downloadURL" | cut -d "-" -f 1 | sed -e "s/.*zulu//")
    ;;
