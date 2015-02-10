#!/bin/bash

apkBaseName=$1
tempSmaliDir=$2

if [ "$apkBaseName" = "Settings" ];then
    echo ">>> in custom_app $apkBaseName"
    echo ">>> Remove the Official Verify Preference."
	sed -i -e "/^\.method.*setOfficialVerifyPreference()V/,/^\.end method/d" $tempSmaliDir/smali/com/android/settings/DeviceInfoSettings.smali
	sed -i -e "/setOfficialVerifyPreference/d" $tempSmaliDir/smali/com/android/settings/DeviceInfoSettings.smali	

    echo ">>> use isHaveExternalSdcard to check weather support UsbMassStorage in UsbSettings.java"
    sed -i 's#invoke-virtual {v.*}, Landroid/os/storage/StorageVolume;->allowMassStorage()Z#invoke-direct {p0}, Lcom/android/settings/deviceinfo/UsbSettings;->isHaveExternalSdcard()Z#g' $tempSmaliDir/smali/com/android/settings/deviceinfo/UsbSettings.smali

    echo ">>> add origin settings"
    sed -i '/com.android.settings.ManageApplicationsSettings/r Settings/settings_headers.xml.part' $tempSmaliDir/res/xml/settings_headers.xml
     
fi

