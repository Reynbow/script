;[=============]
;[  Ctrl+W     ]
;[  [Notepad]  ]
;[=============]
#IfWinActive ahk_class Notepad
^w::
#IfWinActive

;-- Get current handle to the Edit control
if Edit_GetActiveHandles(hEdit) 
    {
    ;-- Get current select positions
    Edit_GetSel(hEdit,$StartSelPos,$EndSelPos)

    ;-- Toggle word wrap
    SendMessage 0x111,32,0  ;-- 0x111=WM_COMMAND

    ;-- Collect new handle to the Edit control
    Edit_GetActiveHandles(hEdit)

    ;-- Set caret
    Edit_SetSel(hEdit,$StartSelPos,$StartSelPos)
    Edit_ScrollCaret(hEdit)
        ;-- Initial selection and scroll.  This makes sure that the leftmost
        ;   position of the selection is showing.

    ;-- Re-select if necessary    
    if ($StartSelPos<>$EndSelPos)
        {
        Edit_SetSel(hEdit,$StartSelPos,$EndSelPos)

        ;-- Show as much of the selection as possible
        $FirstVisibleLine :=Edit_GetFirstVisibleLine(hEdit)
        $LastVisibleLine  :=Edit_GetLastVisibleLine(hEdit)
        $FirstSelectedLine:=Edit_LineFromChar(hEdit,$StartSelPos)
        $LastSelectedLine :=Edit_LineFromChar(hEdit,$EndSelPos)

        ;-- Last line showing?
        if ($LastSelectedLine>$LastVisibleLine)
            if ($LastSelectedLine-$LastVisibleLine<$FirstSelectedLine-$FirstVisibleLine)
                Edit_LineScroll(hEdit,0,($LastVisibleLine-$LastSelectedLine)*-1)
             else
                Edit_LineScroll(hEdit,0,($FirstVisibleLine-$FirstSelectedLine)*-1)
        }
    }

return