#SingleInstance force

; Default name
DefaultName := "🎲"

; Function to generate a random number and color-code it
GenerateRandomNumberAndColor(min, max, color) {
    Random, randomNumber, min, max
    return "{" . color . " " . randomNumber . "}!"
}

; GUI for user input and buttons
Gui, +AlwaysOnTop
Gui, Add, Text, x20 y20 w260 Center, Welcome to Fake Roll Generator! 🎲
Gui, Add, Text, x20 y50 w260 Center, Enter your name: 👤
Gui, Add, Edit, x20 y70 w200 vUserName, %DefaultName%
Gui, Add, Button, x20 y110 w80 gGenerateLow, Low 🟢
Gui, Add, Button, x110 y110 w80 gGenerateMid, Mid 🟡
Gui, Add, Button, x200 y110 w80 gGenerateHigh, High 🔴
Gui, Add, Text, x20 y140 w260 Center vOutputText
Gui, Add, Button, x20 y170 w80 gCopyOutput, Copy 📋
Gui, Add, Button, x110 y170 w80 gGenerate, Generate 🎲
Gui, Add, Button, x200 y170 w80 gExit, Exit 🚪
Gui, Font, s14
Gui, Show, w300 h220, Fake Roll Generator

return

Generate:
    GuiControlGet, UserName, , UserName
    if (UserName = "")
        UserName := DefaultName
    GuiControl,, OutputText, % "{black " . UserName "}" " rolled and got a " GenerateRandomNumberAndColor(1, 100, "red")
return

GenerateLow:
    GuiControlGet, UserName, , UserName
    if (UserName = "")
        UserName := DefaultName
    GuiControl,, OutputText, % "{black " . UserName "}" " rolled and got a " GenerateRandomNumberAndColor(1, 25, "red")
return

GenerateMid:
    GuiControlGet, UserName, , UserName
    if (UserName = "")
        UserName := DefaultName
    GuiControl,, OutputText, % "{black " . UserName "}" " rolled and got a " GenerateRandomNumberAndColor(26, 55, "yellow")
return

GenerateHigh:
    GuiControlGet, UserName, , UserName
    if (UserName = "")
        UserName := DefaultName
    GuiControl,, OutputText, % "{black " . UserName "}" " rolled and got a " GenerateRandomNumberAndColor(56, 100, "#39FF14")
return

CopyOutput:
    GuiControlGet, OutputText
    Clipboard := OutputText
return

Exit:
    GuiClose:
        ExitApp
return
