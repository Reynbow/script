#SingleInstance, Force    
SendMode Input

KeyWait, LButton, D
SendRaw, ```````CSS
Sleep 400
Send, +{enter}
Sleep 400
SendRaw, [ROLE ASSIGNMENT]
Sleep 400
Send, +{enter}
Sleep 400
SendRaw, You can choose to add or remove any roles you may want on your account. These roles are mentionable, so they will send you notifications when people use them.
Sleep 400
Send, +{enter}
Sleep 400
Send, +{enter}
Sleep 400
SendRaw, Please do not spam these roles, as they will notify everyone with the role every time you use them.
Sleep 400
Send, +{enter}
Sleep 400
Send, +{enter}
Sleep 400
SendRaw, There are two groups of roles available.```````
Sleep 400
Send, +{enter}
Sleep 400
SendRaw, ```````css
Sleep 400
Send, +{enter}
Sleep 400
SendRaw, [DESTINY ROLES]```````
Sleep 800
Send, {enter}
Sleep 800
Send, /raid{enter}
Sleep 800
Send, /nightfall{enter}
Sleep 800
Send, /crucible{enter}
Sleep 800
Send, /trials{enter}
Sleep 1250
SendRaw, ```````css 
Send, +{enter}
SendRaw, [OTHER GAMES]```````
Sleep 800
Send, {enter}
Sleep 800
Send, /pubg{enter}
Sleep 800
Send, /league{enter}
Sleep 800
Send, /wow{enter} 
Sleep 800
Send, /r6s{enter} 
ExitApp, [ ExitCode]

Esc::
ExitApp