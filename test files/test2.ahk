#SingleInstance Force
pwb := ComObjCreate( "InternetExplorer.Application" )

pwb.Visible := false

pwb.Navigate( "www.AutoHotkey.com/forum/viewforum.php?f=1" )

body_html := pwb.document.body.innerHTML

msgbox, %body_html%