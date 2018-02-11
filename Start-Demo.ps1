<#PSScriptInfo

.VERSION 1.0.1

.GUID ae18572c-2e51-4c38-86e4-2e8fe9c8869f

.AUTHOR Jeffrey Snover

.COMPANYNAME Microsoft Corporation

.COPYRIGHT (C) Microsoft Corporation. All rights reserved.

.TAGS

.LICENSEURI

.PROJECTURI
https://blogs.msdn.microsoft.com/powershell/2007/03/03/start-demo-help-doing-demos-using-powershell/

.ICONURI

.EXTERNALMODULEDEPENDENCIES

.REQUIREDSCRIPTS

.EXTERNALSCRIPTDEPENDENCIES

.RELEASENOTES
 - You can specify which file you want to demo (it defaults to “.\demo.txt”)
 - You can specify which command to start with (it defaults to 0)
 - It shows you the command (both at the prompt and in the Window Title [for the folks at the back of the room) and waits for input. If your input is <CR>, it runs the command.
 - You can provide other input and it will do other actions. You can:
 - Ask for help using “?”
    • Quit at any point
    • Dump the list of commands in the demo. It produces a red line above your current point in the demo
    • Run another command or Suspend the demo and enter into a nested prompt to explore a topic
    • Go to a specified command in the demo
    • Find all the commands in the demo using a regular expression
    • Check your time. It displays how many minutes and seconds since the start of the demo. This information is also displayed in the Window title on an ongoing basis.

#>

<#
.DESCRIPTION
 This script completely transforms the experience of giving a demo, allowing you to focus on your messages instead of typing.

 It is REAL in the sense that the commands REALLY run, the script just eliminates your typing.

 This script was originally published by Jeffrey Snover at https://blogs.msdn.microsoft.com/powershell/2007/03/03/start-demo-help-doing-demos-using-powershell/

#>
Param()


function Start-Demo {
    param($file = ”.\demo.txt”, [int]$command = 0)
    Clear-Host

    $_lines = Get-Content $file
    $_starttime = [DateTime]::now
    Write-Host -for Yellow “<Demo [$file] Started>”


    # We use a FOR and an INDEX ($_i) instead of a FOREACH because
    # it is possible to start at a different location and/or jump
    # around in the order.
    for ($_i = $Command; $_i -lt $_lines.count; $_i++) {
        $_SimulatedLine = $(“`n[$_i]PS> ” + $($_Lines[$_i]))
        Write-Host -NoNewLine $_SimulatedLine

        # Put the current command in the Window Title along with the demo duration
        $_Duration = [DateTime]::Now – $_StartTime
        $Host.UI.RawUI.WindowTitle = “[{0}m, {1}s]        {2}” -f [int]$_Duration.TotalMinutes, [int]$_Duration.Seconds, $($_Lines[$_i])
        if ($_lines[$_i].StartsWith(“#”)) {
            continue
        }
        $_input = [System.Console]::ReadLine()
        switch ($_input) {
            “?” {
                Write-Host -ForeGroundColor Yellow “Running demo: $file`n(q) Quit (!) Suspend (#x) Goto Command #x (fx) Find cmds using X`n(t) Timecheck (s) Skip (d) Dump demo”
                $_i -= 1
            }
            “q” {
                Write-Host -ForeGroundColor Yellow “<Quit demo>”
                return
            }
            “s” {
                Write-Host -ForeGroundColor Yellow “<Skipping Cmd>”
            }
            “d” {
                for ($_ni = 0; $_ni -lt $_lines.Count; $_ni++) {
                    if ($_i -eq $_ni) {
                        Write-Host -ForeGroundColor Red (“*” * 80)
                    }
                    Write-Host -ForeGroundColor Yellow (“[{0,2}] {1}” -f $_ni, $_lines[$_ni])
                }
                $_i -= 1
            }
            “t” {
                $_Duration = [DateTime]::Now – $_StartTime
                Write-Host -ForeGroundColor Yellow $(“Demo has run {0} Minutes and {1} Seconds” -f [int]$_Duration.TotalMinutes, [int]$_Duration.Seconds)
                $_i -= 1
            }
            {$_.StartsWith(“f”)} {
                for ($_ni = 0; $_ni -lt $_lines.Count; $_ni++) {
                    if ($_lines[$_ni] -match $_.SubString(1)) {
                        Write-Host -ForeGroundColor Yellow (“[{0,2}] {1}” -f $_ni, $_lines[$_ni])
                    }
                }
                $_i -= 1
            }
            {$_.StartsWith(“!”)} {
                if ($_.Length -eq 1) {
                    Write-Host -ForeGroundColor Yellow “<Suspended demo – type ‘Exit’ to resume>”
                    $host.EnterNestedPrompt()
                }
                else {
                    trap [System.Exception] {Write-Error $_; continue; }
                    Invoke-Expression $($_.SubString(1) + “| out-host”)
                }
                $_i -= 1
            }
            {$_.StartsWith(“#”)} {
                $_i = [int]($_.SubString(1)) – 1
                continue
            }
            default {
                trap [System.Exception] {Write-Error $_; continue; }
                Invoke-Expression $($_lines[$_i] + “| out-host”)
                $_Duration = [DateTime]::Now – $_StartTime
                $Host.UI.RawUI.WindowTitle = “[{0}m, {1}s]        {2}” -f [int]$_Duration.TotalMinutes, [int]$_Duration.Seconds, $($_Lines[$_i])
                [System.Console]::ReadLine()
            }
        }
    }
    $_Duration = [DateTime]::Now – $_StartTime
    Write-Host -ForeGroundColor Yellow $(“<Demo Complete {0} Minutes and {1} Seconds>” -f [int]$_Duration.TotalMinutes, [int]$_Duration.Seconds)
    Write-Host -ForeGroundColor Yellow $([DateTime]::now)
}