# Get date
$Date = Get-Date -UFormat %Y-%m-%d

# Set source paths
$AquilaSrc  = "\\path\to\location\Aquila"
$CepheusSrc = "\\path\to\location\Cepheus"
$DrakoSrc   = "\\path\to\location\Drako"

# Set source paths of Cepheus folders with old backup files
$Aristotle = "\\db\Backup\Aristotle"
$Curie     = "\\db\Backup\Curie"
$DaVinci   = "\\db\Backup\DaVinci"
$Einstein  = "\\db\Backup\Einstein"
$Freud     = "\\db\Backup\Freud"
$Hawking   = "\\db\Backup\Hawking"

# Set destination paths
$AquilaDst  = "\\db\DatabaseBackup\backup $($Date)\Aquila"
$CepheusDst = "\\db\DatabaseBackup\backup $($Date)\Cepheus"
$DrakoDst   = "\\db\DatabaseBackup\backup $($Date)\Drako"
$BackupDst  = "\\db\DatabaseBackup"


####################################################
#####  STEP 1: DELETE OLD DESTINATION FOLDERS  #####
####################################################


# Delete old destination folder
Get-ChildItem $BackupDst -Recurse | Remove-Item -Force -Recurse



####################################################
##### STEP 2: PREPARE SOURCE FILES AND FOLDERS #####
####################################################


##### Aquila #####

# [AquilaScheduledBackup folder]: Check if there are more than 1 backup file and delete excess ones (oldest ones)
Get-ChildItem $AquilaSrc -Recurse | sort CreationTime -desc | select -Skip 1 | Remove-Item -Force


##### Cepheus #####

# [Aristotle folder]: Check if there are more than 5 backup files and delete excess ones (oldest ones)
Get-ChildItem $Aristotle -Recurse | sort CreationTime -desc | select -Skip 5 | Remove-Item -Force

# [Curie folder]: Check if there are more than 5 backup files and delete excess ones (oldest ones)
Get-ChildItem $Curie -Recurse | sort CreationTime -desc | select -Skip 5 | Remove-Item -Force

# [DaVinci folder]: Check if there are more than 5 backup files and delete excess ones (oldest ones)
Get-ChildItem $DaVinci -Recurse | sort CreationTime -desc | select -Skip 5 | Remove-Item -Force

# [Einstein folder]: Check if there are more than 5 backup files and delete excess ones (oldest ones)
Get-ChildItem $Einstein -Recurse | sort CreationTime -desc | select -Skip 5 | Remove-Item -Force

# [Freud folder]: Check if there are more than 5 backup files and delete excess ones (oldest ones)
Get-ChildItem $Freud -Recurse | sort CreationTime -desc | select -Skip 5 | Remove-Item -Force

# [Hawking folder]: Check if there are more than 5 backup files and delete excess ones (oldest ones)
Get-ChildItem $Hawking -Recurse | sort CreationTime -desc | select -Skip 5 | Remove-Item -Force



####################################################
#####   STEP 3: COPY FOLDERS TO DESTINATION    #####
####################################################


##### Aquila #####

# Copy files to destination
Robocopy $AquilaSrc $AquilaDst /e


##### Cepheus #####

# Copy files to destination
Robocopy $CepheusSrc $CepheusDst /e


##### Drako #####

# Copy files to destination
Robocopy $DrakoSrc $DrakoDst /e