
count := MonitorGetCount()

if (count == 1)
{
    MsgBox "no need to run this script."
    Exit 0
}

needMoveMonitorNum := 1
if (MonitorGetPrimary() == 1)
    needMoveMonitorNum := count


while (1)
{
    hwnd := 0

    while (hwnd == 0)
    {
        hwnd := WinWait("League of Legends (TM)")
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
        MsgBox "Monitor " needMoveMonitorNum " doesn't exist or an error occurred.Exit"
        Exit -1
    }

    WinWaitClose

}
