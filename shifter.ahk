count := MonitorGetCount()

if (count == 1)
{
    MsgBox "no need to run this script."
    Exit 0
}
iniFileName := A_ScriptDir "\config.ini"

;if not FileExist(iniFileName)
;{
;    FileOpen(iniFileName, "w")
;    FileAppend "[str]`ntitle='League of Legends (TM)'`n", iniFileName
;}

try
{
    needMoveMonitorNum := IniRead(iniFileName, "num", "monitor")
}
catch
{
    needMoveMonitorNum := 1
    if (MonitorGetPrimary() == 1)
        needMoveMonitorNum := count
}

if (needMoveMonitorNum > count)
{
    MsgBox "Monitor " needMoveMonitorNum " doesn't exist or an error occurred.Exit"
    Exit -1
}

title := IniRead(iniFileName, "str", "title", "League of Legends (TM)")

while (1)
{
    hwnd := 0

    while (hwnd == 0)
    {
        hwnd := WinWait(title)
        Sleep 1000
    }

    WinActivate hwnd
    Sleep 1000

    try
    {
        MonitorGet needMoveMonitorNum, &Left, &Top, &Right, &Bottom
        WinMove Left, Top,Right-Left,Bottom-Top
    }
    catch
    {
        MsgBox "Monitor " needMoveMonitorNum " doesn't exist or an error occurred.Exit(Like not run as Administator)"
        Exit -1
    }

    WinWaitClose

}
