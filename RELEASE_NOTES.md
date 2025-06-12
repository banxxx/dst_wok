### DST Wok
**Downloads:**
- **Android**: `dstwok_android_${{ needs.extract-version.outputs.version }}.apk`
- **iOS** (Unsigned): `dstwok_ios_${{ needs.extract-version.outputs.version }}.ipa`
- **Windows** (Portable): `dstwok_windows_${{ needs.extract-version.outputs.version }}.zip`
- **Windows** (Installer): `dstwok_windows_installer_${{ needs.extract-version.outputs.version }}.exe`
            
**Installation Instructions:**
- **Android**: Download APK and install (allow unknown sources)
- **iOS**: Requires signing with your own certificate
- **Windows (Portable)**: Extract ZIP and run `dstwok.exe`
- **Windows (Installer)**: Run installer for system-wide installation