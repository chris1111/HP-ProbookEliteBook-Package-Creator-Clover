#!/bin/bash
# script for Installer HP-ProBook-EliteBook-macOS
# (c) Copyright 2018, 2021 chris1111
PARENTDIR=$(dirname "$0")
cd "$PARENTDIR"

# shell script Notifications
osascript -e 'display notification "Installer HP-ProBook-EliteBook-macOS" with title "Create"  sound name "default"'

rm -rf ./PRE/.gitkeep
rm -rf ./OpenCore/.gitkeep
rm -rf ./POST/.gitkeep
rm -rf ./Patcher/.gitkeep
rm -rf /$HOME/Desktop/HP-ProBook-EliteBook-macOS
rm -rf /tmp/PackageDIR
Sleep 1
mkdir -p ./InstallerHP/BUILD-PACKAGE
mkdir -p /tmp/PackageDIR
mkdir -p $HOME/Desktop/HP-ProBook-EliteBook-Packager
cp -Rp ./Build/PackageMaker/Gatekeeper.command /$HOME/Desktop/HP-ProBook-EliteBook-Packager
cp -Rp ./Build/PackageMaker/"Support Donate.html" $HOME/Desktop/HP-ProBook-EliteBook-Packager
Sleep 1
echo "---------------------------------------------"
./Build/PackageMaker/Icon/seticon -d ./Build/PackageMaker/Icon/FileVaultIcon.icns $HOME/Desktop/HP-ProBook-EliteBook-Packager/Gatekeeper.command
./Build/PackageMaker/Icon/seticon -d ./Build/PackageMaker/Icon/Support.icns $HOME/Desktop/HP-ProBook-EliteBook-Packager/"Support Donate.html"


# Create the Packages with pkgbuild
pkgbuild --root ./Patcher --scripts ./script/PRE --identifier com.chris1111.hpprobookelitebookmacos.Patcher.pkg --version 1 --install-location / ./InstallerHP/BUILD-PACKAGE/Patcher.pkg

pkgbuild --root ./EFI-DSDT --identifier com.chris1111.hpprobookelitebookmacos.EFI-DSDT.pkg --version 1.0 --install-location /tmp/EFI-DSDT ./InstallerHP/BUILD-PACKAGE/efidsdt.pkg

pkgbuild --root ./DSDT-Patch/"7series laptop HP Probook"/"4x0 G0" --identifier com.chris1111.hpprobookelitebookmacos.4x0G0.pkg --version 1.0 --install-location /tmp/EFI-DSDT ./InstallerHP/BUILD-PACKAGE/4x0G0.pkg

pkgbuild --root ./DSDT-Patch/"7series laptop HP Probook"/4x40 --identifier com.chris1111.hpprobookelitebookmacos.4x40.pkg --version 1.0 --install-location /tmp/EFI-DSDT ./InstallerHP/BUILD-PACKAGE/4x40.pkg

pkgbuild --root ./DSDT-Patch/"7series laptop HP Probook"/6x70b --identifier com.chris1111.hpprobookelitebookmacos.6x70b.pkg --version 1.0 --install-location /tmp/EFI-DSDT ./InstallerHP/BUILD-PACKAGE/6x70b.pkg

pkgbuild --root ./DSDT-Patch/"7series laptop HP Probook"/"Elitebook 2x70p" --identifier com.chris1111.hpprobookelitebookmacos.Elitebook2x70p.pkg --version 1.0 --install-location /tmp/EFI-DSDT ./InstallerHP/BUILD-PACKAGE/elitebook2X70P.pkg

pkgbuild --root ./DSDT-Patch/"7series laptop HP Probook"/"Elitebook 8x70p" --identifier com.chris1111.hpprobookelitebookmacos.Elitebook8x70p.pkg --version 1.0 --install-location /tmp/EFI-DSDT ./InstallerHP/BUILD-PACKAGE/elitebook8X70P.pkg

pkgbuild --root ./DSDT-Patch/"7series laptop HP Probook"/"Elitebook 9x70m" --identifier com.chris1111.hpprobookelitebookmacos.Elitebook9x70m.pkg --version 1.0 --install-location /tmp/EFI-DSDT ./InstallerHP/BUILD-PACKAGE/elitebook9X70M.pkg

pkgbuild --root ./DSDT-Patch/"7series laptop HP Probook"/6x70B_AMD --identifier com.chris1111.hpprobookelitebookmacos.6x70B_AMD.pkg --version 1.0 --install-location /tmp/EFI-DSDT ./InstallerHP/BUILD-PACKAGE/6x70bamd.pkg

pkgbuild --root ./DSDT-Patch/"7series laptop HP Probook"/6x70B_NVIDIA --identifier com.chris1111.hpprobookelitebookmacos.6x70B_NVIDIA.pkg --version 1.0 --install-location /tmp/EFI-DSDT ./InstallerHP/BUILD-PACKAGE/6x70bnvidia.pkg

pkgbuild --root ./DSDT-Patch/"Intel HD 3k 4k Low High"/HD4000Low --identifier com.chris1111.hpprobookelitebookmacos.HD4000Low.pkg --version 1.0 --install-location /tmp/EFI-DSDT ./InstallerHP/BUILD-PACKAGE/hd4000low.pkg

pkgbuild --root ./DSDT-Patch/"Intel HD 3k 4k Low High"/HD4000High --scripts ./script/HD4000High --identifier com.chris1111.hpprobookelitebookmacos.HD4000High.pkg --version 1.0 --install-location /tmp/EFI-DSDT ./InstallerHP/BUILD-PACKAGE/hd4000high.pkg

pkgbuild --root ./DSDT-Patch/HDMI/HDMILow --identifier com.chris1111.hpprobookelitebookmacos.HDMILow.pkg --version 1.0 --install-location /tmp/EFI-DSDT ./InstallerHP/BUILD-PACKAGE/hdmilow.pkg

pkgbuild --root ./DSDT-Patch/HDMI/1080p+HDMI --identifier com.chris1111.hpprobookelitebookmacos.1080p+HDMI.pkg --version 1.0 --install-location /tmp/EFI-DSDT ./InstallerHP/BUILD-PACKAGE/1080phdmi.pkg

pkgbuild --root ./DSDT-Patch/Fan/FanQuiet --identifier com.chris1111.hpprobookelitebookmacos.FanQuiet.pkg --version 1.0 --install-location /tmp/EFI-DSDT ./InstallerHP/BUILD-PACKAGE/fanquiet.pkg

pkgbuild --root ./DSDT-Patch/Fan/FanQuietMod --identifier com.chris1111.hpprobookelitebookmacos.FanQuietMod.pkg --version 1.0 --install-location /tmp/EFI-DSDT ./InstallerHP/BUILD-PACKAGE/fanquietmod.pkg

pkgbuild --root ./DSDT-Patch/Fan/FanSmooth --identifier com.chris1111.hpprobookelitebookmacos.FanSmooth.pkg --version 1.0 --install-location /tmp/EFI-DSDT ./InstallerHP/BUILD-PACKAGE/fansmooth.pkg

pkgbuild --root ./DSDT-Patch/Fan/FanPatch --identifier com.chris1111.hpprobookelitebookmacos.FanPatch.pkg --version 1.0 --install-location /tmp/EFI-DSDT ./InstallerHP/BUILD-PACKAGE/fanpatch.pkg

pkgbuild --root ./DSDT-Patch/Fan/FanSpeed --identifier com.chris1111.hpprobookelitebookmacos.FanSpeed.pkg --version 1.0 --install-location /tmp/EFI-DSDT ./InstallerHP/BUILD-PACKAGE/fanspeed.pkg

pkgbuild --root ./Clover --identifier com.chris1111.hpprobookelitebookmacos.Clover.pkg --version 1.0 --install-location / ./InstallerHP/BUILD-PACKAGE/clover.pkg

pkgbuild --root ./"Install ESP"/EFIFOLDERMAIN --scripts ./script/"Script UEFI"/"efifolder" --identifier com.chris1111.hpprobookelitebookmacos.EFIFOLDERMAIN.pkg --version 1.0 --install-location /Private/tmp/EFIROOTDIR ./InstallerHP/BUILD-PACKAGE/efifoldermain.pkg

pkgbuild --root ./AirportBrcmFixup --scripts ./script/Airport --identifier com.chris1111.hpprobookelitebookmacos.AirportBrcmFixup.pkg --version 1.0 --install-location /Private/tmp ./InstallerHP/BUILD-PACKAGE/airportbrcmfixup.pkg

pkgbuild --root ./DSDT-Patch/BCM4322x --identifier com.chris1111.hpprobookelitebookmacos.patchbcmdsdt.pkg --version 1.0 --install-location /tmp/EFI-DSDT ./InstallerHP/BUILD-PACKAGE/patchbcmdsdt.pkg

pkgbuild --root ./Bluetooth/Catalina --scripts ./script/BluetoothCatalina --identifier com.chris1111.hpprobookelitebookmacos.BluetoothCatalina.pkg --version 1.0 --install-location /Private/tmp ./InstallerHP/BUILD-PACKAGE/bluetoothCatalina.pkg

pkgbuild --root ./Bluetooth/BigSur --scripts ./script/BluetoothBigSur --identifier com.chris1111.hpprobookelitebookmacos.BluetoothBigSur.pkg --version 1.0 --install-location /Private/tmp ./InstallerHP/BUILD-PACKAGE/bluetoothBigSur.pkg

pkgbuild --root ./Bluetooth/Monterey --scripts ./script/BluetoothMonterey --identifier com.chris1111.hpprobookelitebookmacos.BluetoothMonterey.pkg --version 1.0 --install-location /Private/tmp ./InstallerHP/BUILD-PACKAGE/bluetoothMonterey.pkg

pkgbuild --root ./HWMonitor --identifier com.chris1111.hpprobookelitebookmacos.HWMonitor.pkg --version 1.0 --install-location /Applications ./InstallerHP/BUILD-PACKAGE/hwmonitor.pkg

pkgbuild --root ./APP --scripts ./script/App --identifier com.chris1111.hpprobookelitebookmacos.App.pkg --version 1.0 --install-location /Private/tmp ./InstallerHP/BUILD-PACKAGE/app.pkg

pkgbuild --root ./VBOX --scripts ./script/VBOX --identifier com.chris1111.hpprobookelitebookmacos.VBOX.pkg --version 1.0 --install-location /Private/tmp ./InstallerHP/BUILD-PACKAGE/VBOX.pkg

pkgbuild --root ./HFSPLUS --scripts ./script/HFS --identifier com.chris1111.hpprobookelitebookmacos.HFSPLUS.pkg --version 1.0 --install-location /Private/tmp ./InstallerHP/BUILD-PACKAGE/HFSPLUS.pkg

pkgbuild --root ./POST --scripts ./script/POST --identifier com.chris1111.hpprobookelitebookmacos.POST.pkg --version 1.0 --install-location / ./InstallerHP/BUILD-PACKAGE/post.pkg

pkgbuild --root ./PatchHD4000 --scripts ./script/PatchHD4000 --identifier com.chris1111.hpprobookelitebookmacos.PatchHD4000.pkg --version 1.0 --install-location /Private/tmp ./InstallerHP/BUILD-PACKAGE/PatchHD4000.pkg



Sleep 2
# Expend the Packages with pkgutil
pkgutil --expand ./InstallerHP/BUILD-PACKAGE/efidsdt.pkg /tmp/PackageDIR/efidsdt.pkg

pkgutil --expand ./InstallerHP/BUILD-PACKAGE/patcher.pkg /tmp/PackageDIR/patcher.pkg

pkgutil --expand ./InstallerHP/BUILD-PACKAGE/4x0G0.pkg /tmp/PackageDIR/4x0G0.pkg

pkgutil --expand ./InstallerHP/BUILD-PACKAGE/4x40.pkg /tmp/PackageDIR/4x40.pkg

pkgutil --expand ./InstallerHP/BUILD-PACKAGE/6x70b.pkg /tmp/PackageDIR/6x70b.pkg

pkgutil --expand ./InstallerHP/BUILD-PACKAGE/elitebook2X70P.pkg /tmp/PackageDIR/elitebook2X70P.pkg

pkgutil --expand ./InstallerHP/BUILD-PACKAGE/Elitebook8x70p.pkg /tmp/PackageDIR/Elitebook8x70p.pkg

pkgutil --expand ./InstallerHP/BUILD-PACKAGE/Elitebook9x70m.pkg  /tmp/PackageDIR/Elitebook9x70m.pkg

pkgutil --expand ./InstallerHP/BUILD-PACKAGE/6x70bamd.pkg /tmp/PackageDIR/6x70bamd.pkg

pkgutil --expand ./InstallerHP/BUILD-PACKAGE/6x70bnvidia.pkg /tmp/PackageDIR/6x70bnvidia.pkg

pkgutil --expand ./InstallerHP/BUILD-PACKAGE/HD4000High.pkg /tmp/PackageDIR/hd4000high.pkg

pkgutil --expand ./InstallerHP/BUILD-PACKAGE/HD4000Low.pkg /tmp/PackageDIR/hd4000low.pkg

pkgutil --expand ./InstallerHP/BUILD-PACKAGE/HDMILow.pkg /tmp/PackageDIR/hdmilow.pkg

pkgutil --expand ./InstallerHP/BUILD-PACKAGE/1080phdmi.pkg /tmp/PackageDIR/1080phdmi.pkg

pkgutil --expand ./InstallerHP/BUILD-PACKAGE/fanpatch.pkg /tmp/PackageDIR/fanpatch.pkg

pkgutil --expand ./InstallerHP/BUILD-PACKAGE/fanquiet.pkg /tmp/PackageDIR/fanquiet.pkg

pkgutil --expand ./InstallerHP/BUILD-PACKAGE/fanquietmod.pkg /tmp/PackageDIR/fanquietmod.pkg

pkgutil --expand ./InstallerHP/BUILD-PACKAGE/fansmooth.pkg /tmp/PackageDIR/fansmooth.pkg

pkgutil --expand ./InstallerHP/BUILD-PACKAGE/fanspeed.pkg /tmp/PackageDIR/fanspeed.pkg

pkgutil --expand ./InstallerHP/BUILD-PACKAGE/clover.pkg /tmp/PackageDIR/clover.pkg

pkgutil --expand ./InstallerHP/BUILD-PACKAGE/efifoldermain.pkg /tmp/PackageDIR/efifoldermain.pkg

pkgutil --expand ./InstallerHP/BUILD-PACKAGE/airportbrcmfixup.pkg /tmp/PackageDIR/airportbrcmfixup.pkg

pkgutil --expand ./InstallerHP/BUILD-PACKAGE/patchbcmdsdt.pkg /tmp/PackageDIR/patchbcmdsdt.pkg

pkgutil --expand ./InstallerHP/BUILD-PACKAGE/app.pkg /tmp/PackageDIR/app.pkg

pkgutil --expand ./InstallerHP/BUILD-PACKAGE/bluetoothCatalina.pkg /tmp/PackageDIR/bluetoothCatalina.pkg

pkgutil --expand ./InstallerHP/BUILD-PACKAGE/bluetoothBigSur.pkg /tmp/PackageDIR/bluetoothBigSur.pkg

pkgutil --expand ./InstallerHP/BUILD-PACKAGE/bluetoothMonterey.pkg /tmp/PackageDIR/bluetoothMonterey.pkg

pkgutil --expand ./InstallerHP/BUILD-PACKAGE/hwmonitor.pkg /tmp/PackageDIR/hwmonitor.pkg

pkgutil --expand ./InstallerHP/BUILD-PACKAGE/VBOX.pkg /tmp/PackageDIR/VBOX.pkg

pkgutil --expand ./InstallerHP/BUILD-PACKAGE/HFSPLUS.pkg /tmp/PackageDIR/HFSPLUS.pkg

pkgutil --expand ./InstallerHP/BUILD-PACKAGE/post.pkg /tmp/PackageDIR/post.pkg

pkgutil --expand ./InstallerHP/BUILD-PACKAGE/PatchHD4000.pkg /tmp/PackageDIR/PatchHD4000.pkg


Sleep 3
# Copy resources and distribution
ditto -x -k --sequesterRsrc --rsrc ./Resources/Distribution.zip ./InstallerHP/BUILD-PACKAGE
mv ./InstallerHP/BUILD-PACKAGE/Distribution ./InstallerHP/BUILD-PACKAGE/Distribution.xml
ditto -x -k --sequesterRsrc --rsrc ./Resources/Resources.zip ./InstallerHP/BUILD-PACKAGE

echo "
= = = = = = = = = = = = = = = = = = = = = = = = =
Create the final Packages with Productbuild
= = = = = = = = = = = = = = = = = = = = = = = = ="
Sleep 3
# Create the final Packages with Productbuild
productbuild --distribution "./InstallerHP/BUILD-PACKAGE/Distribution.xml"  \
--package-path "./InstallerHP/BUILD-PACKAGE" \
--resources "./InstallerHP/BUILD-PACKAGE/Resources" \
"/$HOME/Desktop/HP-ProBook-EliteBook-Packager/HP-ProBook-EliteBook-macOS.pkg"
echo "= = = = = = = = = = = = = = = = = = = = = = = = ="

cp -Rp ./InstallerHP/BUILD-PACKAGE $HOME/Desktop/HP-ProBook-EliteBook-Packager/Build-Package-HP-Installer
./Build/PackageMaker/Icon/seticon -d ./Build/PackageMaker/Icon/Icon.icns $HOME/Desktop/HP-ProBook-EliteBook-Packager/HP-ProBook-EliteBook-macOS.pkg
echo "---------------------------------------------"
rm -rf ./InstallerHP
osascript -e 'do shell script "afplay './Build/Funk.aiff' &> /dev/null &"'
