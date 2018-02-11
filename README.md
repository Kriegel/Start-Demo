# Start-Demo
The famous Start-Demo script from Jeffrey Snover ; improved ; to present canned Demos of PowerShell Scripts
<pre>
• You can specify which file you want to demo (it defaults to “.\demo.txt”)
• You can specify which command to start with (it defaults to 0)
• It shows you the command (both at the prompt and in the Window Title [for the folks at the back of the room) and waits for input.
 • If your input is <CR>, it runs the command else you can provide other input and it will do other actions.
   You can:
      "?" Ask for help
      "q" Quit at any point
       d" Dump the list of commands in the demo. It produces a red line above your current point in the demo
      "!" Run another command or Suspend the demo and enter into a nested prompt to explore a topic
      "#NUMBER"Go to a specified command in the demo example: #12
      "f" Find all the commands in the demo using a regular expression example: fService
• Check your time. It displays how many minutes and seconds since the start of the demo.
   This information is also displayed in the Window title on an ongoing basis.
• Intro text explains that this is a REAL demo
• emulates TYPING by introducing a random pause between key output
   You can control the pause interval
   Entering a key during the command typing will cause it to cancel the pauses
   The command to be entered is displayed on the window title before the typing starts so you can see what is coming.\
 • Colors are control via variables (so you can easily change them for your environment)
 • Timecheck now tells you where you are in the demo: You are at line 10 of 29
</pre>
## Version

• V.1.1.0
<pre>
    Published by Jeffrey Snover at\
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
    Inintial release 03.March.2007 V.1.0.0\
    This script was originally published by Jeffrey Snover at
    https://blogs.msdn.microsoft.com/powershell/2007/03/03/start-demo-help-doing-demos-using-powershell/
</pre>