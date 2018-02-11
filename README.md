# Start-Demo

 A script to present prepared "canned" Demos of PowerShell functionality

The famous Start-Demo script from Jeffrey Snover ; improved ; to present canned Demos of PowerShell Scripts

It completely transforms the experience of giving a PowerShell demo in the console, allowing you to focus on your messages instead of typing. It is REAL in the sense that the commands REALLY run, the script just eliminates your typing.
<pre>
.SYNTAX


Start-Demo.ps1 [[-file] &lt;Object&gt;] [[-command] &lt;int&gt;] [[-promptColor] &lt;ConsoleColor&gt;] [[-commandColor] &lt;ConsoleColor&gt;] [[-commentColor] &lt;ConsoleColor&gt;] [[-backgroundColor] &lt;ConsoleColor&gt;] [[-StartDelay] &lt;int&gt;] [[-AutoSpeed] &lt;int&gt;] [[-DelayAfterComment] &lt;int&gt;] [-SkipInstructions] [-FullAuto] [-NoPauseAfterExecute] [-UseMyPrompt] [-SkipAddTheEndLine] [-SkipAddDemoTime]

.SYNOPSIS
    A script to present prepared "canned" Demos of PowerShell functionality

.DESCRIPTION

A script to present prepared "canned" Demos of PowerShell functionality

It completely transforms the experience of giving a PowerShell demo in the console, allowing you to focus on your messages instead of typing. It is REAL in the sense that the commands REALLY run, the script just eliminates your typing.

It shows you the command (both at the prompt and in the Window Title [for the folks at the back of the room) and waits for input.

If your input is &lt;CR&gt; (the "Enter" key), it runs the command else you can provide other input and it will do other actions.
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

Check your demo duration time.
It displays how many minutes and seconds since the start of the demo.
This information is also displayed in the Window title on an ongoing basis.

 Line Numbers, tells you where you are in the demo:
 You are at line 10 of 29


.PARAMETER file
    You can specify which file you want to demo (it defaults to “.\demo.txt”)

 .PARAMETER command
    You can specify which command (line) to start with (it defaults to 0)

 .PARAMETER promptColor
    Set the color of the promt inside the demo

    valid values are the following keywords out of the .NET enumeration [System.ConsoleColor]

    Black, DarkBlue, DarkGreen, DarkCyan, DarkRed, DarkMagenta, DarkYellow, Gray, DarkGray, Blue, Green, Cyan, Red

 .PARAMETER commandColor
    Set the color of a command inside the demo
    for vald values see parameter -promptColor !

 .PARAMETER commentColor
    Set the color of a commend line inside the demo
    for vald values see parameter -promptColor !

 .PARAMETER backgroundColor
    Set the color of the background of all writings inside the demo
    for vald values see parameter -promptColor !

 .PARAMETER StartDelay
    Set a pause time bevor the demo starts in seconds

 .PARAMETER AutoSpeed
    set the speed of the autorun in second between each command
    see even parameter FullAuto!

 .PARAMETER DelayAfterComment
    Set the Time of pause after each command execution in seconds

 .PARAMETER SkipInstructions
    skips the instruction information showed in the console befor a demo starts

 .PARAMETER FullAuto
    You can run the demo full automaticallyl by use of this switch
    to set the speed see parameter -AutoSpeed !

 .PARAMETER NoPauseAfterExecute
    You can skip the pause after the execution of aech command by using this Switch

 .PARAMETER UseMyPrompt
    uses the original promt function out of the function: drive instead of the prepared promt defined inside the Start-Demo.ps1

 .PARAMETER SkipAddTheEndLine
    the default is to add a Line "Write-Host 'The End'" at the end of each demo
    to prevent that the console closes after the last executed command.
    Use this switch to not add this line

 .PARAMETER SkipAddDemoTime
    use this switch if you do not like to see the demo duration time inside the console window.


.EXAMPLE

    Full example to start a Demo

    C:\> Start-Demo.ps1 -file 'C:\demo\MyDemo.txt' -command 6 -promptColor 'yellow' -commandColor 'white' -commentColor 'green' -backgroundColor 'black' -StartDelay 12 -AutoSpeed 7 -DelayAfterComment 2 -SkipInstructions -FullAuto -NoPauseAfterExecute -UseMyPrompt -SkipAddTheEndLine -SkipAddDemoTime


.EXAMPLE

    minimal example to start a Demo with the script Start-Demo.ps1
    expecting that a file called "demo.txt" lies in the same folder like the script!

    C:\demo>  Start-Demo.ps1

</pre>
## Version

V.3.5.0
<pre>
overhaul of Jeffrey Snover's original Start-Demo script by Joel "Jaykul" Bennett on
    http://poshcode.org  (retired repository of PowerShell scripts)

    !!!!! JAYKUL CHANGED IT FROM A FUNCTION TO A SCRIPT !!!!!!!

    for other history see script!
</pre>

V.3.3.3
<pre>
overhaul of Jeffrey Snover's original Start-Demo script by Joel "Jaykul" Bennett on
    http://poshcode.org  (retired repository of PowerShell scripts)

    !!!!! JAYKUL CHANGED IT FROM A FUNCTION TO A SCRIPT !!!!!!!

    for other history see script!
</pre>

• V.2.9.9 from 1.1.0.
<pre>
Lost in space ....
</pre>

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