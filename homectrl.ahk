;
; AutoHotkey Version: 1.x
; Language:       English
; Platform:       Win7
; Author:         A.N.Other <myemail@nowhere.com>
;
; Script Function:
;	Template script (you can customize this template by editing "ShellNew\Template.ahk" in your Windows folder)
;

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; General remapping script for AutoHotkey

; The behaviour is such that the control keys are located on the home
; row. CapsLock and Enter serve as Control, but with one detail: when
; pressed alone (fast enough), they have a different behaviour. When
; CapsLock is pressed fast, it behaves as a Escape key, and when Enter
; is pressed fast enough, it send the normal Enter key

; These ideas came from three blog posts, targeted at Mac users:
; 
; http://batsov.com/articles/2012/12/06/emacs-tip-number-7-remap-return-to-control-in-osx/
; http://brettterpstra.com/2012/12/08/a-useful-caps-lock-key/
; http://stevelosh.com/blog/2012/10/a-modern-space-cadet/

; The basic algorith come from this discussion:
; https://superuser.com/questions/223831/remap-a-key-depending-on-whether-it-was-pressed-alone-or-not

; The limit for 'fast enough' is 150 ms, but this may change

; I am still learning AutoHotkey, so there is much room to improve

; ---
CapsLock::LCtrl

;-- when pressing CapsLock alone, it will activate the Escpae button
Capslock Up:: 
SendInput, {LControl Up}  ;--For stability
If A_TimeSincePriorHotkey < 150
{
  SendInput, {Escape}   
}
Else
return
return

; remap Enter+Something to Ctrl+Something, but Enter alone does nothing
Enter::RCtrl

Enter Up::
SendInput, {RControl Up}  ;--For stability
If A_TimeSincePriorHotkey < 150
{
  SendInput, {Enter}   
}
Else
return
return






