#SingleInstance, Force
Gui, font, s12 bold, Helvetica 
Gui, Add, Text, center x1 y9 w261 h30 , Loyalty Card Order
Gui, font,
Gui, Add, Text, x12 y49 w90 h20 , Pharmacy Name:
Gui, Add, Edit, x142 y49 w100 h20 vPhName, 
Gui, Add, Text, x12 y79 w80 h20 , Contact Person:
Gui, Add, Edit, x142 y79 w100 h20 vContact, 
Gui, Add, Text, x12 y109 w90 h20 , Delivery Address:
Gui, Add, Edit, x142 y109 w100 h20 vAddress1, 
Gui, Add, Text, x12 y139 w130 h20 , Suburb State Postcode:
Gui, Add, Edit, x142 y139 w100 h20 vAddress2, 
Gui, Add, Text, x12 y169 w80 h20 , Phone:
Gui, Add, Edit, x142 y169 w100 h20 vPhone, 
Gui, font, s10 bold, Helvetica 
Gui, Add, Text, x22 y219 w90 h30 , Order Details
Gui, font,
Gui, Add, Text, x12 y259 w80 h20 , AL Code:
Gui, Add, Edit, x142 y259 w100 h20 vALCode, 
Gui, Add, Text, x12 y289 w80 h20 , Barcode From:
Gui, Add, Edit, x142 y289 w100 h20 vFrom, 
Gui, Add, Text, x12 y319 w80 h20 , Barcode To:
Gui, Add, Edit, x142 y319 w100 h20 vTo, 
Gui, Show, w261 h360, Card Order
return
GuiClose:
ExitApp