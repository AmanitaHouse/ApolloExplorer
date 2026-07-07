$Bold       = "$([char]27)[1m" 
$BoldReset  = "$([char]27)[22m"

$Red        = "$([char]27)[31m"
$Green      = "$([char]27)[32m"
$Yellow     = "$([char]27)[33m"
$Blue       = "$([char]27)[34m"
$Purple     = "$([char]27)[35m"
$LightBlue  = "$([char]27)[36m"
$White      = "$([char]27)[37m"
$Grey       = "$([char]27)[30m"

cls
Write-Host ""
Write-Host ""
Write-Host ""
Write-Host ""
Write-Host ""
Write-Host ""
Write-Host ""
Write-Host "${Bold}${White}########## ${Red}Apollo${Grey}Explorer Windows Client - Release 1.3 ${White}###########"
Write-Host ""
Write-Host "${Bold}${White}0. Checking Prerequisites${Grey}${BoldReset}"

# TODO: Check if we run on Windows
$ApolloExplorerPath = Resolve-Path ~
$MSYS2InstallPath = Join-Path $ApolloExplorerPath "\MSYS2"
$MSYS2CommandPath = Join-Path $MSYS2InstallPath "\usr\bin"
$env:Path += ";"
$env:Path += $MSYS2CommandPath
$MSYS2UCRT64Path = Join-Path $MSYS2InstallPath "\ucrt64\bin"
$env:Path += ";"
$env:Path += $MSYS2UCRT64Path
$QT6InstallPath = Join-Path $ApolloExplorerPath "\QT6"
$QT6CommandPath = Join-Path $QT6InstallPath "\6.11.1\mingw_64\bin"
$env:Path += ";"
$env:Path += $QT6CommandPath

try {
    Get-Command "pacman.exe" -ErrorAction Stop | Out-Null
    Write-Host "* MSYS2 Subsystem found"
} catch {
    $Answer = Read-Host "* No MSYS2 Subsystem, do you want to install MSYS2? (y/n) "
    $Answer = $Answer.Trim().ToLower()
    if($Answer -eq "n") {exit}
    Write-Host "* Installing MSYS2 Subsystem"
    Invoke-WebRequest https://github.com/msys2/msys2-installer/releases/download/2026-06-11/msys2-x86_64-20260611.exe -O msys2-x86_x64-20260611.exe | Out-Null
    .\msys2-x86_x64-20260611.exe install --root $MSYS2InstallPath --confirm-command | Out-Null
    try {
        Get-Command "pacman.exe" -ErrorAction Stop | Out-Null
        Write-Host "* MSYS2 Subsystem succesfully installed"
        Remove-Item "msys2-x86_x64-20260611.exe"
        pacman -Syu
    } catch {
        Write-Host "* ERROR Installing MSYS2 Subsystem"
        exit
    }
}



try {
    Get-Command "gcc" -ErrorAction Stop | Out-Null
    Write-Host "* GCC Compiler found"
} catch {
    $Answer = Read-Host "* No GCC Compiler found, do you want to install GCC? (y/n) "
    $Answer = $Answer.Trim().ToLower()
    if($Answer -eq "n") {exit}
    Write-Host "* Installing GCC Toolchain"
    pacman.exe -S mingw-w64-ucrt-x86_64-gcc --noconfirm | Out-Null
    try {
        Get-Command "gcc" -ErrorAction Stop | Out-Null
        Write-Host "* GCC Toolchain succesfully installed"
    } catch {
        Write-Host "* ERROR Installing GCC Toolchain"
    }
}

try {
    Get-Command "mingw32-make" -ErrorAction Stop | Out-Null
    Write-Host "* Make Build System found"
} catch {
    $Answer = Read-Host "* No Make Build System found, do you want to install Make? (y/n) "
    $Answer = $Answer.Trim().ToLower()
    if($Answer -eq "n") {exit}
    Write-Host "* Installing Make Build Systemm"
    pacman.exe -S make --noconfirm | Out-Null
    try {
        Get-Command "make" -ErrorAction Stop | Out-Null
        Write-Host "* Make Build System succesfully installed"
    } catch {
        Write-Host "* ERROR Installing Make Build System"
    }
}

try {
    Get-Command "qmake" -ErrorAction Stop | Out-Null
    Write-Host "* QT6 FrameWork found"
} catch {
    $Answer = Read-Host "* No QT6 FrameWork found, do you want to install QT6? (y/n) "
    $Answer = $Answer.Trim().ToLower()
    if($Answer -eq "n") {exit}
    Write-Host "* Installing QT6 FrameWork (qt6.11.1-full)"
    Invoke-WebRequest https://download.qt.io/official_releases/online_installers/qt-online-installer-windows-x64-online.exe -O qt-online-installer-windows-x64-online.exe | Out-Null
    .\qt-online-installer-windows-x64-online.exe --root $QT6InstallPath --accept-licenses --default-answer --confirm-command install qt6.11.1-full | Out-Null
    try {
        Get-Command "qmake" -ErrorAction Stop | Out-Null
        Write-Host "* QT6 FrameWork succesfully installed"
        Remove-Item "qt-online-installer-windows-x64-online.exe"
    } catch {
        Write-Host "* ERROR Installing QT6"
    }
}


Write-Host "${Bold}${White}1. Clean House${Grey}${BoldReset}"


Write-Host "${Bold}${White}2. Create Windows Project${Grey}${BoldReset}"


Write-Host "${Bold}${White}3. Make Windows Project${Grey}${BoldReset}"


Write-Host "${Bold}${White}4. Install Windows Project${Grey}${BoldReset}"


Write-Host "${Bold}${White}5. Clean Windows Project${Grey}${BoldReset}"



exit

