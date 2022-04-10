#SingleInstance force	; force the script to reload when the app is started again
#Persistent
; Work 20minutes
Timer = 1200000
;Timer = 1000
SetTimer ShowScreen, %Timer%
return


ShowScreen:
	SetTimer ShowScreen, Off

	FileRead, filecontent, blue-screen-message.txt	; read some file

	Gui,+LastFound		; Sets the window to be the last found window, to use for winset ...

	Gui,-border			; Provides a thin-line border around the window. This is not common.

	Gui,+AlwaysOnTop	; Makes the window stay on top of all other windows

	Gui,+ToolWindow		; Provides a narrower title bar but the window will have no taskbar button.

	Gui,-Caption		; Provides a title bar and a thick window border/edge. When removing the caption from a window that will use WinSet TransColor, remove it only after setting the TransColor

	Gui,Color,navy 	; color of the gui ;black ;000000

	Gui, Font, s20, Verdana ; Set a large font size

	Gui,Add,Text, x40 y40 cWhite W%A_ScreenWidth% H%A_ScreenHeight%,%filecontent% ; create the textfield with its content

	Gui,Show, x0 y0 W%A_ScreenWidth% H%A_ScreenHeight%	; Show the gui in fullscreen
	; Reset 20 seconds
        SetTimer TimeOut, 20000

return				; end of the autoexecute section


TimeOut:
	Gui Cancel
	SetTimer TimeOut, Off
	SetTimer ShowScreen, %Timer%
Return

GuiEscape:			; if you press escape in the gui

	exitapp			; the program exits
