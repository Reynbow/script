TicketCounter:

msgbox, 4, Ticket Count , Want to check the count now?, 3
IfMsgBox, Yes
	{
	run https://siteiq.intellipharm.com.au/index.php/issues/IssuesDataOldListData?xls=1&sEcho=1&iColumns=13&sColumns=&iDisplayStart=0&iDisplayLength=100&mDataProp_0=0&mDataProp_1=1&mDataProp_2=2&mDataProp_3=3&mDataProp_4=4&mDataProp_5=5&mDataProp_6=6&mDataProp_7=7&mDataProp_8=8&mDataProp_9=9&mDataProp_10=10&mDataProp_11=11&mDataProp_12=12&sSearch=&bRegex=false&sSearch_0=&bRegex_0=false&bSearchable_0=false&sSearch_1=&bRegex_1=false&bSearchable_1=false&sSearch_2=&bRegex_2=false&bSearchable_2=true&sSearch_3=&bRegex_3=false&bSearchable_3=true&sSearch_4=&bRegex_4=false&bSearchable_4=true&sSearch_5=&bRegex_5=false&bSearchable_5=true&sSearch_6=&bRegex_6=false&bSearchable_6=true&sSearch_7=&bRegex_7=false&bSearchable_7=true&sSearch_8=&bRegex_8=false&bSearchable_8=true&sSearch_9=&bRegex_9=false&bSearchable_9=true&sSearch_10=&bRegex_10=false&bSearchable_10=true&sSearch_11=&bRegex_11=false&bSearchable_11=true&sSearch_12=&bRegex_12=false&bSearchable_12=false&iSortCol_0=2&sSortDir_0=asc&iSortCol_1=8&sSortDir_1=desc&iSortingCols=2&bSortable_0=false&bSortable_1=false&bSortable_2=true&bSortable_3=true&bSortable_4=true&bSortable_5=true&bSortable_6=true&bSortable_7=true&bSortable_8=true&bSortable_9=true&bSortable_10=true&bSortable_11=true&bSortable_12=false
	Msgbox, 4096, Ticket Count, Click OK when you have copied the information to the clipboard.
	sleep 1000
	

str  := clipboard
match = AaronBeecham
StringReplace, str, str, %match%, %match%, UseErrorLevel
AB = %ErrorLevel%

str  := clipboard
match = CraigDuchesne
StringReplace, str, str, %match%, %match%, UseErrorLevel
CD = %ErrorLevel%

str  := clipboard
match = James
StringReplace, str, str, %match%, %match%, UseErrorLevel
JS = %ErrorLevel%

str  := clipboard
match = JoshHill
StringReplace, str, str, %match%, %match%, UseErrorLevel
JH = %ErrorLevel%

str  := clipboard
match = Joel
StringReplace, str, str, %match%, %match%, UseErrorLevel
JL = %ErrorLevel%

str  := clipboard
match = JoshHill
StringReplace, str, str, %match%, %match%, UseErrorLevel
JH = %ErrorLevel%

str  := clipboard
match = SteveC
StringReplace, str, str, %match%, %match%, UseErrorLevel
SC = %ErrorLevel%

str  := clipboard
match = -
StringReplace, str, str, %match%, %match%, UseErrorLevel
Zero = %ErrorLevel%

str  := clipboard
match = 0 days
StringReplace, str, str, %match%, %match%, UseErrorLevel
Zero = %ErrorLevel%

;===========REMOVE 'TENS'

    str  := clipboard
    match = 10 days
    StringReplace, str, str, %match%, %match%, UseErrorLevel
    TEN = %ErrorLevel%

    str  := clipboard
    match = 20 days
    StringReplace, str, str, %match%, %match%, UseErrorLevel
    TWENTY = %ErrorLevel%

    str  := clipboard
    match = 30 days
    StringReplace, str, str, %match%, %match%, UseErrorLevel
    THIRTY = %ErrorLevel%

    str  := clipboard
    match = 40 days
    StringReplace, str, str, %match%, %match%, UseErrorLevel
    FOURTY = %ErrorLevel%

    str  := clipboard
    match = 50 days
    StringReplace, str, str, %match%, %match%, UseErrorLevel
    FIFTY = %ErrorLevel%

    str  := clipboard
    match = 60 days
    StringReplace, str, str, %match%, %match%, UseErrorLevel
    SIXTY = %ErrorLevel%

    str  := clipboard
    match = 70 days
    StringReplace, str, str, %match%, %match%, UseErrorLevel
    SEVENTY = %ErrorLevel%

    str  := clipboard
    match = 80 days
    StringReplace, str, str, %match%, %match%, UseErrorLevel
    EIGHTY = %ErrorLevel%

    str  := clipboard
    match = 90 days
    StringReplace, str, str, %match%, %match%, UseErrorLevel
    NINETY = %ErrorLevel%

REMOVE := TEN + TWENTY + THIRTY + FOURTY + FIFTY + SIXTY + SEVENTY + EIGHTY + NINETY

ZEROFINAL := Zero - REMOVE
ZEROFINAL := Zero - REMOVE

;==== REMOVE Blanks

    str  := clipboard
    match = -	open
    StringReplace, str, str, %match%, %match%, UseErrorLevel
    Blank = %ErrorLevel%

TotalFirst := AB + CD + JS + JL + JH + SC
Total := TotalFirst - Blank

msgbox,4, Ticket Count, DATA OUTAGE TICKETS - %Total% tickets, including %ZEROFINAL% zero day tickets.`n__________________________________________________________________`n`nAaron Beecham:`t%AB%`nCraig Duchesne:`t%JS%`nJames Schubert:`t%JS%`nJoel Hanson:`t%JL%`nJosh Hill:`t`t%JH%`nSteve Colley:`t%SC%`n__________________________________________________________________`n`nWould you like to copy the information to the clipboard?
IfMsgBox, No
	{
		reload
		return
	}
IfMsgBox, Yes
	{
	clipboard = DATA OUTAGE TICKETS - %Total% tickets, including %ZEROFINAL% zero day tickets.
		reload
		return
	}
	}
Else
return