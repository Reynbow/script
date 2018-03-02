#SingleInstance, Force
SetWorkingDir, A_ScriptDir
#Include csv.ahk         ; download this AHK code library and place it in your scripts (or your default library) directory: https://raw.githubusercontent.com/hi5/CSV/master/csv.ahk

CSV_Load("my.csv","A",",")         ; Load CSV file into memory, must complete first (where the variable that contains that files content ("the CSV_Identifier") is labeled "A" in this case. The delimiter is a semi-colon)
MsgBox % CSV_MatchCell("A", "Gold",3)         ; Search for a cell containing exactly the data specified (where CSV_Identifier = "A", SearchText = "Gold", Instance = the 3rd occurence of SearchText)
MsgBox % CSV_ReadCell("A", 2, 2)         ; Read data from the specified cell (where we read the content from the cell at the 2nd row/2nd column)