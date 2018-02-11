# Start-Demo
The famous Start-Demo script from Jeffrey Snover ; improved ; to present canned Demos of PowerShell Scripts

It completely transforms the experience of giving a PowerShell demo in the console, allowing you to focus on your messages instead of typing. It is REAL in the sense that the commands REALLY run, the script just eliminates your typing.
<pre>
.SYNTAX

Start-Demo.ps1 [[-file] <Object>] [[-command] <int>] [[-promptColor] <ConsoleColor>] [[-commandColor] <ConsoleColor>] [[-commentColor] <ConsoleColor>] [[-AutoSpeed] <int>] [-FullAuto] [-NoPauseAfterExecute]

.DESCRIPTION

• You can specify which file you want to demo (it defaults to “.\demo.txt”) use the -file parameter to change.
• You can specify which command (line) to start with (it defaults to 0)
• You can run the demo full automaticallyl by use of the switch
    -FullAuto
    and set the speed of the autorun in second between commands with the Integer:
        -AutoSpeed
• You can skip the pause after the execute of a command by using the Switch:
    -NoPauseAfterExecute
• It shows you the command (both at the prompt and in the Window Title [for the folks at the back of the room) and waits for input.
 • If your input is <CR> (the "Enter" key), it runs the command else you can provide other input and it will do other actions.
   By input of a char ou can:
        (?) Show the help
        (n) Goto Next command
        (p) Goto Previous command
        (q) Quit Demo
        (s) Suspend Demo
        (t) Check for Demo duration Time
        (v) View the demo file (.\demo.txt)
        (g) Go to line by number
        (f) Find lines by string
        (a) Auto Execute mode (demo runs full automatically)
        (c) Clear Screen
• Check your time. It displays how many minutes and seconds since the start of the demo.
   This information is also displayed in the Window title on an ongoing basis.
 • Colors are control via script input variables (so you can easily change them for your environment)
    -promptColor
    -commandColor
    -commentColor
    allowed Keyword (colors) are :
        Black, DarkBlue, DarkGreen, DarkCyan, DarkRed, DarkMagenta, DarkYellow, Gray, DarkGray, Blue, Green, Cyan, Red
, Magenta, Yellow, White

 • Timecheck now tells you where you are in the demo: You are at line 10 of 29

.EXAMPLE

    Full example to start a Demo with the script Start-Demo.ps1
    executing the demo file: 'c:\demos\mydemo.txt'
    on command 5
    full automatically with the speed of 6 seconds between each commands
    and no pause after execution

    .\Start-Demo -file 'c:\demos\mydemo.txt' -command 5 -promptColor 'yellow' -commandColor 'white' -commentColor 'green' -FullAuto -AutoSpeed 6 -NoPauseAfterExecute

.EXAMPLE

    minimal example to start a Demo with the script Start-Demo.ps1
    expecting that a file called "demo.txt" lies in the same folder like the script!

    .\Start-Demo

</pre>
## Version

V.3.0.0 to 3.3.3
<pre>
overhaul of Jeffrey Snover's original Start-Demo script by Joel "Jaykul" Bennett on
    http://poshcode.org  (retired repository of PowerShell scripts)

    !!!!! JAYKUL CHANGED IT FROM A FUNCTION TO A SCRIPT !!!!!!!

    for other history see script!
</pre>

• V.1.1.0 to 2.9.9.
<pre>
Lost in space ....
<pre>

• V.1.1.0
<pre>
    Published by Jeffrey Snover at
    http://blogs.msdn.com/b/powershell/archive/2007/03/06/improved-start-demo-script.aspx
    https://blogs.msdn.microsoft.com/powershell/2007/06/03/new-and-improved-start-demo/

• Fix bug for demo files that have a single line
• Intro text explains that this is a REAL demo
• Cleaned up HELP and added some usage notes
• Now emulates TYPING by introducing a random pause between key output
        You can control the pause interval
        Entering a key during the command typing will cause it to cancel the pauses
        The command to be entered is displayed on the window title before the typing starts so you can see what is coming.
 • Colors are control via variables (so you can easily change them for your environment)
 • I added a few more comments
 • Timecheck now tells you where you are in the demo: You are at line 10 of 29
</pre>
• V.1.0.1
<pre>
Published at PowerShell Gallery by PowerShell Team Member KrishnaMSFT (Krishna C Vutukuri)
https://www.powershellgallery.com/packages/Start-Demo/1.0.1/DisplayScript
</pre>
• V1.0.0
<pre>
    Inintial release 03.March.2007 V.1.0.0
    This script was originally published by Jeffrey Snover at
    https://blogs.msdn.microsoft.com/powershell/2007/03/03/start-demo-help-doing-demos-using-powershell/
</pre>