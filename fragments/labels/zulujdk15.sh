zulujdk15)
    name="Zulu JDK 15"
    type="pkgInDmg"
    packageID="com.azulsystems.zulu.15"
    if [[ $(arch) == i386 ]]; then
        downloadURL=https://cdn.azul.com$( curl -fs "https://cdn.azul.com/zulu/bin/" | sed -ne 's/^.*<a href="\(.*zulu15.*ca-jdk15.*x64.dmg\)">.*$/\1/p' | sort -n | tail -1 )
    elif [[ $(arch) == arm64 ]]; then
        downloadURL=https://cdn.azul.com$( curl -fs "https://cdn.azul.com/zulu/bin/" | sed -ne 's/^.*<a href="\(.*zulu15.*ca-jdk15.*aarch64.dmg\)">.*$/\1/p' | sort -n | tail -1 )
    fi
    expectedTeamID="TDTHCUPYFR"
    appCustomVersion(){ if [ -f "/Library/Java/JavaVirtualMachines/zulu-15.jdk/Contents/Info.plist" ]; then /usr/bin/defaults read "/Library/Java/JavaVirtualMachines/zulu-15.jdk/Contents/Info.plist" "CFBundleName" | sed 's/Zulu //'; fi }
    appNewVersion=$(echo "$downloadURL" | cut -d "-" -f 1 | sed -e "s/.*zulu//")
    ;;
