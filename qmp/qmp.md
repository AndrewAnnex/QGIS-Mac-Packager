# QGIS-MAC-Packager

THIS IS DOCUMENTATION FOR DEPRECATED BUILD, based on homebrew deps 
currently only used to build LTR 3.10

# Server Setup 

- Get Mojave server
- Get Apple Development Program for your Apple ID
- Login to the server (have static IP)
- Change default password to some secure one
- Install XCode from App Store 
- Go to Apple Developer Download page -> More and command line tools. Install both
- Sign out from the apple developer page and app store
- Open XCode and accept license
- install homebrew and QGIS deps by running `install_brew.bash`
- Download MrSID SDK [referenced in](https://github.com/OSGeo/homebrew-osgeo4mac/blob/master/Formula/osgeo-mrsid-sdk.rb) and place it in the folder `$HOME/Library/Caches/Homebrew`.
- Download erdas-ecw-jp2 [referenced in](https://github.com/OSGeo/homebrew-osgeo4mac/blob/master/Formula/osgeo-ecwjp2-sdk.rb). Open dmg, open pkg and install to default location (Desktop Read-Only Free type).
- install homebrew packages by `install_brew_packages.bash`
- get proj datumgrids by running `scripts/fetch_proj-datumgrid.bash`
- Update `~/.bash_profile` from `scrips/bash_profile`
- now clone this repository
- for upload, add you ssh keys to `qgis/ssh/` and secure them
- copy `run_cronjob` one folder above
- to Code Signing (you need Apple certificate to be "Indentified developer")
    - You need application certificate from https://developer.apple.com/account
    - Generate production/development signing identify
    - Get cer file and scp to the server
    - Double click on cer file and install it on the server
    - On Machine where you created request, export private key and copy and install on server too.
    - install p12 cert to `login` identity
    - `security find-identity -v` to find existing identities 
    - create `sing_identity.txt` with the ID of your identity
    - allow to use it in cronjob (https://stackoverflow.com/a/20324331/2838364)
    - create symbolic link to keychain with the imported identity

- so your folders structure is
```
  sign_identity.txt
  qgis.keychain.db --> ~/Library/Keychains/login.keychain-db
  run_cronjob.bash
  QGIS-Mac-Packager/
  proj-datumgrid/
  builds/
  logs/
  ssh/
```
- Run `run_pkg.bash` with nightly/ltr/pr to build releases/nightlies (detects the latest version)
- Nightly releases should be set as launchd once per day (use tabs!)
``` 
cp scripts/org.qgis.build.plist ~/Library/LaunchAgents/
plutil ~/Library/LaunchAgents/org.qgis.build.plist 
launchctl load ~/Library/LaunchAgents/org.qgis.build.plist
``` 

## Server Update

- remove all build folders 
- remove homebrew (`/usr/local/*`)
- reinstall homebrew packages
- update version & run `scripts/fetch_proj-datumgrid.bash`
