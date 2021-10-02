# Define Windows platform tools download URL  
$adb_link = 'https://dl.google.com/android/repository/platform-tools-latest-windows.zip'
$platform_tools_link= 'https://developer.android.com/studio/releases/platform-tools'
# Destination to save platform tools
$destination = ((Get-Location) + "platform-tools-latest-windows.zip" )

# Continue if adb is installed and download if it's not

#! Add check
#if{
#    Write-Output "Downloaded adb found"
#}

#else {
#    Write-Output "Do you want to download adb?"
#   #! yes/no promt
#    if (-ne ) {
#        Write-Output "The script won't work without Android Debug Bridge"
#        Write-Output "You can download it manually at" + $platform_tools_link
#    }
#    Write-Output "Downloading ADB tools"
#    # Download the file
#    Invoke-WebRequest -Uri $adb_link -OutFile $destination
#    Write-Output "Download complete. Extracting..."
#    #! Extract zip to folder
#    Write-Output "Successfully installed adb"
#}

./adb.exe devices
./adb.exe root
./adb.exe shell