SupportQAs:
Gui, Destroy
FileReadLine, VerNum, G:\Support\Shared Tech Resources\TOOLS\Auto Hotkey\Update\version.txt, 1
IniRead, gui_position, C:\AutoHotKey\settings.ini, window position, QA_position, Center

;Gui, QA:+AlwaysOnTop
Gui, QA:-SysMenu +ToolWindow +Border
Gui, QA:Margin, 16, 16
Gui, QA:Color, 1d1f21, 383D46

Gui, QA:font, cc5c8c6, Segoe UI

;Gui, QA:Add, Text , x14 y460 w280 h70 0x800000 ,
Gui, QA:Add, Edit, -E0x200 x15 y473 w295 h57 -VScroll vQANotes,
Gui, QA:Add, Text , yp-20, Additional Notes

Gui, QA:font, bold cc5c8c6, Segoe UI

;Gui, QA:Add, Text , x300 y460 w160 h70 0x800000 ,
Gui, QA:Add, Edit, -E0x200 x330 y473 w120 h57 -VScroll vSCODE,
Gui, QA:Add, Text , yp-20, SITE CODE

Gui, QA:font, 
Gui, QA:font, cc5c8c6, Segoe UI

Gui, QA:Add, Groupbox, x14 y540 w607 h120 , QAPreview
Gui, QA:Add, Text, x29 y560 w587 h90 vQAPreview, 

Gui, QA:Add, Button, x472 y460 w150 h30 gComplete , &Confirm
Gui, QA:Add, Button, x472 y500 w150 h30 gQAExit , &Exit

Gui, QA:Add, Tab2, x12 y10 w610 h430 , Sanofi POS and DISP|Sanofi DISP ONLY|Store IQ|Apotex POS and DISP|Apotex POS ONLY|Apotex DISP ONLY|Ranbaxy|Sandoz|Private Label|API



;---- TAB SANOFI POS AND DISP
Gui, QA:Tab, Sanofi POS and DISP

Gui, QA:font, s12 bold cc5c8c6, Segoe UI
Gui, QA:Add, Text, x380 y80 , SANOFI POS AND DISP
Gui, QA:font,
Gui, QA:font, s8 cc5c8c6, Segoe UI
;---- EDIT BOXES
Gui, QA:Add, Edit, -E0x200 x40 y90  h20 vMonths1, 
Gui, QA:Add, Text , yp-20, Months on Website
Gui, QA:Add, Edit, -E0x200 x190 y90  h20 vBaldrick1, 
Gui, QA:Add, Text , yp-20, Months in Baldrick
Gui, QA:Add, Edit, -E0x200 x40 y140  h20 vDispDept1, 
Gui, QA:Add, Text , yp-20, Dispense Departments
;---- BUTTON RESOURCES
Gui, QA:Font, bold cc5c8c6, Segoe UI
Gui, QA:Add, Button, x230 y145 w170 h30 , BALDRICK
Gui, QA:Add, Button, x430 y145 w170 h30 , SANOFI CENTRAL
Gui, QA:Font, cc5c8c6, Segoe UI
;---- GENERAL OPTIONS
Gui, QA:Add, Text , x30 y190 w170 h235 0x800000 ,
Gui, QA:Add, Text , xp+10 yp-7, General Options
;-
Gui, QA:Add, CheckBox, x40 yp+22 h20 vT1_PRIV, - Privacy Unloaded
Gui, QA:Add, CheckBox, x40 yp+22 h20 vT1_DEAC, - Deactivated Legacy
Gui, QA:Add, CheckBox, x40 yp+22 h20 vT1_CONF, - Confirmed Rep/Group
Gui, QA:Add, CheckBox, x40 yp+22 h20 vT1_ACCO, - Account Activated
Gui, QA:Add, CheckBox, x40 yp+22 h20 vT1_DETA, - Details sent
;---- DISPENSE OPTIONS
Gui, QA:Add, Text , x230 y190 w170 h235 0x800000 ,
Gui, QA:Add, Text , xp+10 yp-7, Dispense Options
;-
Gui, QA:Add, Text, c616771 x258 yp+22  h20 vT1_MYDI, - MyDispense
Gui, QA:Add, Text, c616771 x258 yp+22  h20 vT1_ETHI, - Ethicals
Gui, QA:Add, Text, c616771 x258 yp+22  h20 vT1_RANB, - Ranbaxy Top 10
Gui, QA:Add, Text, c616771 x258 yp+22  h20 vT1_PROD, - Products Available
Gui, QA:Add, Text, c616771 x258 yp+22  h20 vT1_DRUG, - Drug Breakdown
Gui, QA:Add, CheckBox, x240 yp+22  h20 vT1_PFUN, - PF Unity
Gui, QA:Add, CheckBox, x240 yp+22  h20 vT1_PFFL, - PF Flex

;---- POS OPTIONS
Gui, QA:Add, Text , x430 y190 w170 h235 0x800000 ,
Gui, QA:Add, Text , xp+10 yp-7, POS Options
;-
Gui, QA:Add, CheckBox, x440 yp+22  h20 vT1_SALE, - Salecat Good
Gui, QA:Add, CheckBox, x440 yp+22  h20 vT1_SANO, - Sanofi Advantage
Gui, QA:Add, CheckBox, x440 yp+22  h20 vT1_VMSO, - VMS/OTC
Gui, QA:Add, CheckBox, x440 yp+22  h20 vT1_MYST, - MyStore
Gui, QA:Add, Text, c616771 x458 yp+22  h20 vT1_POSR, - POS Reports
Gui, QA:Add, Text, c616771 x458 yp+22  h20 vT1_OTCP, - OTC Populated
Gui, QA:Add, Text, c616771 x458 yp+22  h20 vT1_DAIL, - Daily Substitution
Gui, QA:Add, Text, c616771 x458 yp+22 h20 vT1_CORE, - Core Range Available
Gui, QA:Add, Text, c616771 x458 yp+22  h20 vT1_OVER, - Overview Available
;---- TAB END

;---- TAB Sanofi DISP ONLY
Gui, QA:Tab, Sanofi DISP ONLY
Gui, QA:font, s12 bold cc5c8c6, Segoe UI
Gui, QA:Add, Text, x380 y80 , SANOFI DISP ONLY
Gui, QA:font,
Gui, QA:font, s8 cc5c8c6, Segoe UI
;---- EDIT BOXES
Gui, QA:Add, Edit, -E0x200 x40 y90  h20 vMonths2, 
Gui, QA:Add, Text , yp-20, Months on Website
Gui, QA:Add, Edit, -E0x200 x190 y90  h20 vBaldrick2, 
Gui, QA:Add, Text , yp-20, Months in Baldrick
Gui, QA:Add, Edit, -E0x200 x40 y140  h20 vDispDept2, 
Gui, QA:Add, Text , yp-20, Dispense Departments
;---- BUTTON RESOURCES
Gui, QA:Font, bold cc5c8c6, Segoe UI
Gui, QA:Add, Button, x230 y145 w170 h30 , BALDRICK
Gui, QA:Add, Button, x430 y145 w170 h30 , SANOFI CENTRAL
Gui, QA:Font, cc5c8c6, Segoe UI
;---- GENERAL OPTIONS
Gui, QA:Add, Text , x30 y190 w170 h235 0x800000 ,
Gui, QA:Add, Text , xp+10 yp-7, General Options
;-
Gui, QA:Add, CheckBox, x40 yp+22  h20 vT2_PRIV, - Privacy Unloaded
Gui, QA:Add, CheckBox, x40 yp+22  h20 vT2_DEAC, - Deactivated Legacy
Gui, QA:Add, CheckBox, x40 yp+22  h20 vT2_CONF, - Confirmed Rep/Group
Gui, QA:Add, CheckBox, x40 yp+22  h20 vT2_ACCO, - Account Activated
Gui, QA:Add, CheckBox, x40 yp+22  h20 vT2_DETA, - Details sent
;---- DISPENSE OPTIONS
Gui, QA:Add, Text , x230 y190 w170 h235 0x800000 ,
Gui, QA:Add, Text , xp+10 yp-7, Dispense Options
;-
Gui, QA:Add, Text, c616771 x258 yp+22  h20 vT2_MYDI, - MyDispense
Gui, QA:Add, Text, c616771 x258 yp+22  h20 vT2_ETHI, - Ethicals
Gui, QA:Add, Text, c616771 x258 yp+22  h20 vT2_RANB, - Ranbaxy Top 10
Gui, QA:Add, Text, c616771 x258 yp+22  h20 vT2_PROD, - Products Available
Gui, QA:Add, Text, c616771 x258 yp+22  h20 vT2_DRUG, - Drug Breakdown
Gui, QA:Add, CheckBox, x240 yp+22  h20 vT2_PFUN, - PF Unity
Gui, QA:Add, CheckBox, x240 yp+22  h20 vT2_PFFL, - PF Flex

;---- POS OPTIONS
Gui, QA:Add, Text , x430 y190 w170 h235 0x800000 ,
Gui, QA:Add, Text , xp+10 yp-7, POS Options
;-
Gui, QA:Add, Text, c616771 x458 yp+22  h20 vT2_SALE, - Salecat Good
Gui, QA:Add, Text, c616771 x458 yp+22  h20 vT2_SANO, - Sanofi Advantage
Gui, QA:Add, Text, c616771 x458 yp+22  h20 vT2_VMSO, - VMS/OTC
Gui, QA:Add, Text, c616771 x458 yp+22  h20 vT2_MYST, - MyStore
Gui, QA:Add, Text, c616771 x458 yp+22  h20 vT2_POSR, - POS Reports
Gui, QA:Add, Text, c616771 x458 yp+22  h20 vT2_OTCP, - OTC Populated
Gui, QA:Add, Text, c616771 x458 yp+22  h20 vT2_DAIL, - Daily Substitution
Gui, QA:Add, Text, c616771 x458 yp+22 h20 vT2_CORE, - Core Range Available
Gui, QA:Add, Text, c616771 x458 yp+22  h20 vT2_OVER, - Overview Available
;---- TAB END

;---- TAB Store IQ
Gui, QA:Tab, Store IQ
Gui, QA:font, s12 bold cc5c8c6, Segoe UI
Gui, QA:Add, Text, x380 y80 , STORE IQ
Gui, QA:font,
Gui, QA:font, s8 cc5c8c6, Segoe UI
;---- EDIT BOXES
;---- EDIT BOXES
Gui, QA:Add, Edit, -E0x200 x40 y90  h20 vMonths3, 
Gui, QA:Add, Text , yp-20, Months on Website
Gui, QA:Add, Edit, -E0x200 x190 y90  h20 vBaldrick3, 
Gui, QA:Add, Text , yp-20, Months in Baldrick
Gui, QA:Add, Edit, -E0x200 x40 y140  h20 vDispDept3, 
Gui, QA:Add, Text , yp-20, Dispense Departments
;---- BUTTON RESOURCES
Gui, QA:Font, bold cc5c8c6, Segoe UI
Gui, QA:Add, Button, x230 y145 w170 h30 , BALDRICK
Gui, QA:Add, Button, x430 y145 w85 h30 , STORE IQ 2
Gui, QA:Add, Button, x515 y145 w85 h30 , STORE IQ 3
Gui, QA:Font, cc5c8c6, Segoe UI
;---- GENERAL OPTIONS
Gui, QA:Add, Text , x30 y190 w170 h235 0x800000 ,
Gui, QA:Add, Text , xp+10 yp-7, General Options
;-
Gui, QA:Add, Text, c616771 x58 yp+22  h20 vT3_PRIV, - Privacy Unloaded
Gui, QA:Add, Text, c616771 x58 yp+22  h20 vT3_DEAC, - Deactivated Legacy
Gui, QA:Add, CheckBox, x40 yp+22  h20 vT3_CONF, - Confirmed Rep/Group
Gui, QA:Add, Text, c616771 x58 yp+22  h20 vT3_ACCO, - Account Activated
Gui, QA:Add, CheckBox, x40 yp+22  h20 vT3_DETA, - Details sent
;---- DISPENSE OPTIONS
Gui, QA:Add, Text , x230 y190 w170 h235 0x800000 ,
Gui, QA:Add, Text , xp+10 yp-7, Dispense Options
;-
Gui, QA:Add, CheckBox, x240 yp+22  h20 vT3_MYDI, - MyDispense
Gui, QA:Add, CheckBox, x240 yp+22  h20 vT3_ETHI, - Ethicals
Gui, QA:Add, Text, c616771 x258 yp+22  h20 vT3_RANB, - Ranbaxy Top 10
Gui, QA:Add, Text, c616771 x258 yp+22  h20 vT3_PROD, - Products Available
Gui, QA:Add, Text, c616771 x258 yp+22  h20 vT3_DRUG, - Drug Breakdown
Gui, QA:Add, Text, c616771 x258 yp+22  h20 vT3_PFUN, - PF Unity
Gui, QA:Add, Text, c616771 x258 yp+22  h20 vT3_PFFL, - PF Flex

;---- POS OPTIONS
Gui, QA:Add, Text , x430 y190 w170 h235 0x800000 ,
Gui, QA:Add, Text , xp+10 yp-7, POS Options
;-
Gui, QA:Add, CheckBox, x440 yp+22  h20 vT3_SALE, - Salecat Good
Gui, QA:Add, Text, c616771 x458 yp+22  h20 vT3_SANO, - Sanofi Advantage
Gui, QA:Add, Text, c616771 x458 yp+22  h20 vT3_VMSO, - VMS/OTC
Gui, QA:Add, CheckBox, x440 yp+22  h20 vT3_MYST, - MyStore
Gui, QA:Add, Text, c616771 x458 yp+22  h20 vT3_POSR, - POS Reports
Gui, QA:Add, Text, c616771 x458 yp+22  h20 vT3_OTCP, - OTC Populated
Gui, QA:Add, Text, c616771 x458 yp+22  h20 vT3_DAIL, - Daily Substitution
Gui, QA:Add, Text, c616771 x458 yp+22 h20 vT3_CORE, - Core Range Available
Gui, QA:Add, Text, c616771 x458 yp+22  h20 vT3_OVER, - Overview Available
;---- TAB END

;---- TAB Apotex POS and DISP
Gui, QA:Tab, Apotex POS and DISP
Gui, QA:font, s12 bold cc5c8c6, Segoe UI
Gui, QA:Add, Text, x380 y80 , APOTEX POS AND DISP
Gui, QA:font,
Gui, QA:font, s8 cc5c8c6, Segoe UI
;---- EDIT BOXES
Gui, QA:Add, Edit, -E0x200 x40 y90  h20 vMonths4, 
Gui, QA:Add, Text , yp-20, Months on Website
Gui, QA:Add, Edit, -E0x200 x190 y90  h20 vBaldrick4, 
Gui, QA:Add, Text , yp-20, Months in Baldrick
Gui, QA:Add, Edit, -E0x200 x40 y140  h20 vDispDept4, 
Gui, QA:Add, Text , yp-20, Dispense Departments
;---- BUTTON RESOURCES
Gui, QA:Font, bold cc5c8c6, Segoe UI
Gui, QA:Add, Button, x230 y145 w170 h30 , BALDRICK
Gui, QA:Add, Button, x430 y145 w170 h30 , APOTEX
Gui, QA:Font, cc5c8c6, Segoe UI
;---- GENERAL OPTIONS
Gui, QA:Add, Text , x30 y190 w170 h235 0x800000 ,
Gui, QA:Add, Text , xp+10 yp-7, General Options
;-
Gui, QA:Add, Text, c616771 x58 yp+22  h20 vT4_PRIV, - Privacy Unloaded
Gui, QA:Add, Text, c616771 x58 yp+22  h20 vT4_DEAC, - Deactivated Legacy
Gui, QA:Add, CheckBox, x40 yp+22  h20 vT4_CONF, - Confirmed Rep/Group
Gui, QA:Add, Text, c616771 x58 yp+22  h20 vT4_ACCO, - Account Activated
Gui, QA:Add, CheckBox, x40 yp+22  h20 vT4_DETA, - Details sent
;---- DISPENSE OPTIONS
Gui, QA:Add, Text , x230 y190 w170 h235 0x800000 ,
Gui, QA:Add, Text , xp+10 yp-7, Dispense Options
;-
Gui, QA:Add, Text, c616771 x258 yp+22  h20 vT4_MYDI, - MyDispense
Gui, QA:Add, CheckBox, x240 yp+22  h20 vT4_ETHI, - Ethicals
Gui, QA:Add, Text, c616771 x258 yp+22  h20 vT4_RANB, - Ranbaxy Top 10
Gui, QA:Add, Text, c616771 x258 yp+22  h20 vT4_PROD, - Products Available
Gui, QA:Add, Text, c616771 x258 yp+22  h20 vT4_DRUG, - Drug Breakdown
Gui, QA:Add, Text, c616771 x258 yp+22  h20 vT4_PFUN, - PF Unity
Gui, QA:Add, Text, c616771 x258 yp+22  h20 vT4_PFFL, - PF Flex

;---- POS OPTIONS
Gui, QA:Add, Text , x430 y190 w170 h235 0x800000 ,
Gui, QA:Add, Text , xp+10 yp-7, POS Options
;-
Gui, QA:Add, CheckBox, x440 yp+22  h20 vT4_SALE, - Salecat Good
Gui, QA:Add, Text, c616771 x458 yp+22  h20 vT4_SANO, - Sanofi Advantage
Gui, QA:Add, Text, c616771 x458 yp+22  h20 vT4_VMSO, - VMS/OTC
Gui, QA:Add, Text, c616771 x458 yp+22  h20 vT4_MYST, - MyStore
Gui, QA:Add, Text, c616771 x458 yp+22  h20 vT4_POSR, - POS Reports
Gui, QA:Add, CheckBox, x440 yp+22  h20 vT4_OTCP, - OTC Populated
Gui, QA:Add, Text, c616771 x458 yp+22  h20 vT4_DAIL, - Daily Substitution
Gui, QA:Add, Text, c616771 x458 yp+22 h20 vT4_CORE, - Core Range Available
Gui, QA:Add, Text, c616771 x458 yp+22  h20 vT4_OVER, - Overview Available
;---- TAB END

;---- TAB Apotex POS ONLY
Gui, QA:Tab, Apotex POS ONLY
Gui, QA:font, s12 bold cc5c8c6, Segoe UI
Gui, QA:Add, Text, x380 y80 , APOTEX POS ONLY
Gui, QA:font,
Gui, QA:font, s8 cc5c8c6, Segoe UI
;---- EDIT BOXES
Gui, QA:Add, Edit, -E0x200 x40 y90  h20 vMonths5, 
Gui, QA:Add, Text , yp-20, Months on Website
Gui, QA:Add, Edit, -E0x200 x190 y90  h20 vBaldrick5, 
Gui, QA:Add, Text , yp-20, Months in Baldrick
Gui, QA:Add, Edit, -E0x200 x40 y140  h20 vDispDept5, 
Gui, QA:Add, Text , yp-20, Dispense Departments
;---- BUTTON RESOURCES
Gui, QA:Font, bold cc5c8c6, Segoe UI
Gui, QA:Add, Button, x230 y145 w170 h30 , BALDRICK
Gui, QA:Add, Button, x430 y145 w170 h30 , APOTEX
Gui, QA:Font, cc5c8c6, Segoe UI
;---- GENERAL OPTIONS
Gui, QA:Add, Text , x30 y190 w170 h235 0x800000 ,
Gui, QA:Add, Text , xp+10 yp-7, General Options
;-
Gui, QA:Add, Text, c616771 x58 yp+22  h20 vT5_PRIV, - Privacy Unloaded
Gui, QA:Add, Text, c616771 x58 yp+22  h20 vT5_DEAC, - Deactivated Legacy
Gui, QA:Add, CheckBox, x40 yp+22  h20 vT5_CONF, - Confirmed Rep/Group
Gui, QA:Add, Text, c616771 x58 yp+22  h20 vT5_ACCO, - Account Activated
Gui, QA:Add, CheckBox, x40 yp+22  h20 vT5_DETAI, - Details sent
;---- DISPENSE OPTIONS
Gui, QA:Add, Text , x230 y190 w170 h235 0x800000 ,
Gui, QA:Add, Text , xp+10 yp-7, Dispense Options
;-
Gui, QA:Add, Text, c616771 x258 yp+22  h20 vT5_MYDI, - MyDispense
Gui, QA:Add, CheckBox, x240 yp+22  h20 vT5_ETHI, - Ethicals
Gui, QA:Add, Text, c616771 x258 yp+22  h20 vT5_RANB, - Ranbaxy Top 10
Gui, QA:Add, Text, c616771 x258 yp+22  h20 vT5_PROD, - Products Available
Gui, QA:Add, Text, c616771 x258 yp+22  h20 vT5_DRUG, - Drug Breakdown
Gui, QA:Add, Text, c616771 x258 yp+22  h20 vT5_PFUN, - PF Unity
Gui, QA:Add, Text, c616771 x258 yp+22  h20 vT5_PFFL, - PF Flex

;---- POS OPTIONS
Gui, QA:Add, Text , x430 y190 w170 h235 0x800000 ,
Gui, QA:Add, Text , xp+10 yp-7, POS Options
;-
Gui, QA:Add, CheckBox, x440 yp+22  h20 vT5_SALE, - Salecat Good
Gui, QA:Add, Text, c616771 x458 yp+22  h20 vT5_SANO, - Sanofi Advantage
Gui, QA:Add, Text, c616771 x458 yp+22  h20 vT5_VMSO, - VMS/OTC
Gui, QA:Add, Text, c616771 x458 yp+22  h20 vT5_MYST, - MyStore
Gui, QA:Add, Text, c616771 x458 yp+22  h20 vT5_POSR, - POS Reports
Gui, QA:Add, CheckBox, x440 yp+22  h20 vT5_OTCP, - OTC Populated
Gui, QA:Add, Text, c616771 x458 yp+22  h20 vT5_DAIL, - Daily Substitution
Gui, QA:Add, Text, c616771 x458 yp+22 h20 vT5_CORE, - Core Range Available
Gui, QA:Add, Text, c616771 x458 yp+22  h20 vT5_OVER, - Overview Available
;---- TAB END

;---- TAB Apotex DISP ONLY
Gui, QA:Tab, Apotex DISP ONLY
Gui, QA:font, s12 bold cc5c8c6, Segoe UI
Gui, QA:Add, Text, x380 y80 , APOTEX DISP ONLY
Gui, QA:font,
Gui, QA:font, s8 cc5c8c6, Segoe UI
;---- EDIT BOXES
;---- EDIT BOXES
Gui, QA:Add, Edit, -E0x200 x40 y90  h20 vMonths6, 
Gui, QA:Add, Text , yp-20, Months on Website
Gui, QA:Add, Edit, -E0x200 x190 y90  h20 vBaldrick6, 
Gui, QA:Add, Text , yp-20, Months in Baldrick
Gui, QA:Add, Edit, -E0x200 x40 y140  h20 vDispDept6, 
Gui, QA:Add, Text , yp-20, Dispense Departments 
;---- BUTTON RESOURCES
Gui, QA:Font, bold cc5c8c6, Segoe UI
Gui, QA:Add, Button, x230 y145 w170 h30 , BALDRICK
Gui, QA:Add, Button, x430 y145 w170 h30 , APOTEX
Gui, QA:Font, cc5c8c6, Segoe UI
;---- GENERAL OPTIONS
Gui, QA:Add, Text , x30 y190 w170 h235 0x800000 ,
Gui, QA:Add, Text , xp+10 yp-7, General Options
;-
Gui, QA:Add, Text, c616771 x58 yp+22  h20 vT6_PRIV, - Privacy Unloaded
Gui, QA:Add, Text, c616771 x58 yp+22  h20 vT6_DEAC, - Deactivated Legacy
Gui, QA:Add, CheckBox, x40 yp+22  h20 vT6_CONF, - Confirmed Rep/Group
Gui, QA:Add, Text, c616771 x58 yp+22  h20 vT6_ACCO, - Account Activated
Gui, QA:Add, CheckBox, x40 yp+22  h20 vT6_DETA, - Details sent
;---- DISPENSE OPTIONS
Gui, QA:Add, Text , x230 y190 w170 h235 0x800000 ,
Gui, QA:Add, Text , xp+10 yp-7, Dispense Options
;-
Gui, QA:Add, Text, c616771 x258 yp+22  h20 vT6_MYDI, - MyDispense
Gui, QA:Add, CheckBox, x240 yp+22  h20 vT6_ETHI, - Ethicals
Gui, QA:Add, Text, c616771 x258 yp+22  h20 vT6_RANB, - Ranbaxy Top 10
Gui, QA:Add, Text, c616771 x258 yp+22  h20 vT6_PROD, - Products Available
Gui, QA:Add, Text, c616771 x258 yp+22  h20 vT6_DRUG, - Drug Breakdown
Gui, QA:Add, Text, c616771 x258 yp+22  h20 vT6_PFUN, - PF Unity
Gui, QA:Add, Text, c616771 x258 yp+22  h20 vT6_PFFL, - PF Flex

;---- POS OPTIONS
Gui, QA:Add, Text , x430 y190 w170 h235 0x800000 ,
Gui, QA:Add, Text , xp+10 yp-7, POS Options
;-
Gui, QA:Add, Text, c616771 x458 yp+22  h20 vT6_SALE, - Salecat Good
Gui, QA:Add, Text, c616771 x458 yp+22  h20 vT6_SANO, - Sanofi Advantage
Gui, QA:Add, Text, c616771 x458 yp+22  h20 vT6_VMSO, - VMS/OTC
Gui, QA:Add, Text, c616771 x458 yp+22  h20 vT6_MYST, - MyStore
Gui, QA:Add, Text, c616771 x458 yp+22  h20 vT6_POSR, - POS Reports
Gui, QA:Add, Text, c616771 x458 yp+22  h20 vT6_OTCP, - OTC Populated
Gui, QA:Add, Text, c616771 x458 yp+22  h20 vT6_DAIL, - Daily Substitution
Gui, QA:Add, Text, c616771 x458 yp+22 h20 vT6_CORE, - Core Range Available
Gui, QA:Add, Text, c616771 x458 yp+22  h20 vT6_OVER, - Overview Available
;---- TAB END

;---- TAB Ranbaxy
Gui, QA:Tab, Ranbaxy
Gui, QA:font, s12 bold cc5c8c6, Segoe UI
Gui, QA:Add, Text, x380 y80 , RANBAXY
Gui, QA:font,
Gui, QA:font, s8 cc5c8c6, Segoe UI
;---- EDIT BOXES
Gui, QA:Add, Edit, -E0x200 x40 y90  h20 vMonths7, 
Gui, QA:Add, Text , yp-20, Months on Website
Gui, QA:Add, Edit, -E0x200 x190 y90  h20 vBaldrick7, 
Gui, QA:Add, Text , yp-20, Months in Baldrick
Gui, QA:Add, Edit, -E0x200 x40 y140  h20 vDispDept7, 
Gui, QA:Add, Text , yp-20, Dispense Departments
;---- BUTTON RESOURCES
Gui, QA:Font, bold cc5c8c6, Segoe UI
Gui, QA:Add, Button, x230 y145 w170 h30 , BALDRICK
Gui, QA:Add, Button, x430 y145 w170 h30 , RANBAXY
Gui, QA:Font, cc5c8c6, Segoe UI
;---- GENERAL OPTIONS
Gui, QA:Add, Text , x30 y190 w170 h235 0x800000 ,
Gui, QA:Add, Text , xp+10 yp-7, General Options
;-
Gui, QA:Add, Text, c616771 x58 yp+22  h20 vT7_PRIV, - Privacy Unloaded
Gui, QA:Add, Text, c616771 x58 yp+22  h20 vT7_DEAC, - Deactivated Legacy
Gui, QA:Add, CheckBox, x40 yp+22  h20 vT7_CONF, - Confirmed Rep/Group
Gui, QA:Add, Text, c616771 x58 yp+22  h20 vT7_ACCO, - Account Activated
Gui, QA:Add, CheckBox, x40 yp+22  h20 vT7_DETA, - Details sent
;---- DISPENSE OPTIONS
Gui, QA:Add, Text , x230 y190 w170 h235 0x800000 ,
Gui, QA:Add, Text , xp+10 yp-7, Dispense Options
;-
Gui, QA:Add, Text, c616771 x258 yp+22  h20 vT7_MYDI, - MyDispense
Gui, QA:Add, Text, c616771 x258 yp+22  h20 vT7_ETHI, - Ethicals
Gui, QA:Add, CheckBox, x240 yp+22  h20 vT7_RANB, - Ranbaxy Top 10
Gui, QA:Add, CheckBox, x240 yp+22  h20 vT7_PROD, - Products Available
Gui, QA:Add, Text, c616771 x258 yp+22  h20 vT7_DRUG, - Drug Breakdown
Gui, QA:Add, Text, c616771 x258 yp+22  h20 vT7_PFUN, - PF Unity
Gui, QA:Add, Text, c616771 x258 yp+22  h20 vT7_PFFL, - PF Flex

;---- POS OPTIONS
Gui, QA:Add, Text , x430 y190 w170 h235 0x800000 ,
Gui, QA:Add, Text , xp+10 yp-7, POS Options
;-
Gui, QA:Add, Text, c616771 x458 yp+22  h20 vT7_SALE, - Salecat Good
Gui, QA:Add, Text, c616771 x458 yp+22  h20 vT7_SANO, - Sanofi Advantage
Gui, QA:Add, Text, c616771 x458 yp+22  h20 vT7_VMSO, - VMS/OTC
Gui, QA:Add, Text, c616771 x458 yp+22  h20 vT7_MYST, - MyStore
Gui, QA:Add, Text, c616771 x458 yp+22  h20 vT7_POSR, - POS Reports
Gui, QA:Add, Text, c616771 x458 yp+22  h20 vT7_OTCP, - OTC Populated
Gui, QA:Add, CheckBox, x440 yp+22  h20 vT7_DAIL, - Daily Substitution
Gui, QA:Add, Text, c616771 x458 yp+22 h20 vT7_CORE, - Core Range Available
Gui, QA:Add, Text, c616771 x458 yp+22  h20 vT7_OVER, - Overview Available
;---- TAB END

;---- TAB Sandoz
Gui, QA:Tab, Sandoz
Gui, QA:font, s12 bold cc5c8c6, Segoe UI
Gui, QA:Add, Text, x380 y80 , SANDOZ
Gui, QA:font,
Gui, QA:font, s8 cc5c8c6, Segoe UI
;---- EDIT BOXES
Gui, QA:Add, Edit, -E0x200 x40 y90  h20 vMonths8, 
Gui, QA:Add, Text , yp-20, Months on Website
Gui, QA:Add, Edit, -E0x200 x190 y90  h20 vBaldrick8, 
Gui, QA:Add, Text , yp-20, Months in Baldrick
Gui, QA:Add, Edit, -E0x200 x40 y140  h20 vDispDept8, 
Gui, QA:Add, Text , yp-20, Dispense Departments
;---- BUTTON RESOURCES
Gui, QA:Font, bold cc5c8c6, Segoe UI
Gui, QA:Add, Button, x230 y145 w170 h30 , BALDRICK
Gui, QA:Add, Button, x430 y145 w170 h30 , SANDOZ
Gui, QA:Font, cc5c8c6, Segoe UI
;---- GENERAL OPTIONS
Gui, QA:Add, Text , x30 y190 w170 h235 0x800000 ,
Gui, QA:Add, Text , xp+10 yp-7, General Options
;-
Gui, QA:Add, Text, c616771 x58 yp+22  h20 vT8_PRIV, - Privacy Unloaded
Gui, QA:Add, Text, c616771 x58 yp+22  h20 vT8_DEAC, - Deactivated Legacy
Gui, QA:Add, CheckBox, x40 yp+22  h20 vT8_CONF, - Confirmed Rep/Group
Gui, QA:Add, Text, c616771 x58 yp+22  h20 vT8_ACCO, - Account Activated
Gui, QA:Add, CheckBox, x40 yp+22  h20 vT8_DETA, - Details sent
;---- DISPENSE OPTIONS
Gui, QA:Add, Text , x230 y190 w170 h235 0x800000 ,
Gui, QA:Add, Text , xp+10 yp-7, Dispense Options
;-
Gui, QA:Add, Text, c616771 x258 yp+22  h20 vT8_MYDI, - MyDispense
Gui, QA:Add, Text, c616771 x258 yp+22  h20 vT8_ETHI, - Ethicals
Gui, QA:Add, Text, c616771 x258 yp+22  h20 vT8_RANB, - Ranbaxy Top 10
Gui, QA:Add, Text, c616771 x258 yp+22  h20 vT8_PROD, - Products Available
Gui, QA:Add, CheckBox, x240 yp+22  h20 vT8_DRUG, - Drug Breakdown
Gui, QA:Add, Text, c616771 x258 yp+22  h20 vT8_PFUN, - PF Unity
Gui, QA:Add, Text, c616771 x258 yp+22  h20 vT8_PFFL, - PF Flex

;---- POS OPTIONS
Gui, QA:Add, Text , x430 y190 w170 h235 0x800000 ,
Gui, QA:Add, Text , xp+10 yp-7, POS Options
;-
Gui, QA:Add, Text, c616771 x458 yp+22  h20 vT8_SALE, - Salecat Good
Gui, QA:Add, Text, c616771 x458 yp+22  h20 vT8_SANO, - Sanofi Advantage
Gui, QA:Add, Text, c616771 x458 yp+22  h20 vT8_VMSO, - VMS/OTC
Gui, QA:Add, Text, c616771 x458 yp+22  h20 vT8_MYST, - MyStore
Gui, QA:Add, Text, c616771 x458 yp+22  h20 vT8_POSR, - POS Reports
Gui, QA:Add, Text, c616771 x458 yp+22  h20 vT8_OTCP, - OTC Populated
Gui, QA:Add, CheckBox, x440 yp+22  h20 vT8_DAIL, - Daily Substitution
Gui, QA:Add, Text, c616771 x458 yp+22 h20 vT8_CORE, - Core Range Available
Gui, QA:Add, Text, c616771 x458 yp+22  h20 vT8_OVER, - Overview Available
;---- TAB END

;---- TAB Private Label
Gui, QA:Tab, Private Label
Gui, QA:font, s12 bold cc5c8c6, Segoe UI
Gui, QA:Add, Text, x380 y80 , PRIVATE LABEL
Gui, QA:font,
Gui, QA:font, s8 cc5c8c6, Segoe UI
;---- EDIT BOXES
Gui, QA:Add, Edit, -E0x200 x40 y90  h20 vMonths9, 
Gui, QA:Add, Text , yp-20, Months on Website
Gui, QA:Add, Edit, -E0x200 x190 y90  h20 vBaldrick9, 
Gui, QA:Add, Text , yp-20, Months in Baldrick
Gui, QA:Add, Edit, -E0x200 x40 y140  h20 vDispDept9, 
Gui, QA:Add, Text , yp-20, Dispense Departments
;---- BUTTON RESOURCES
Gui, QA:Font, bold cc5c8c6, Segoe UI
Gui, QA:Add, Button, x230 y145 w170 h30 , BALDRICK
Gui, QA:Add, Button, x430 y145 w170 h30 , PRIVATE LABEL
Gui, QA:Font, cc5c8c6, Segoe UI
;---- GENERAL OPTIONS
Gui, QA:Add, Text , x30 y190 w170 h235 0x800000 ,
Gui, QA:Add, Text , xp+10 yp-7, General Options
;-
Gui, QA:Add, Text, c616771 x58 yp+22  h20 vT9_PRIV, - Privacy Unloaded
Gui, QA:Add, Text, c616771 x58 yp+22  h20 vT9_DEAC, - Deactivated Legacy
Gui, QA:Add, Text, c616771 x58 yp+22  h20 vT9_CONF, - Confirmed Rep/Group
Gui, QA:Add, Text, c616771 x58 yp+22  h20 vT9_ACCO, - Account Activated
Gui, QA:Add, Text, c616771 x58 yp+22  h20 vT9_DETA, - Details sent
;---- DISPENSE OPTIONS
Gui, QA:Add, Text , x230 y190 w170 h235 0x800000 ,
Gui, QA:Add, Text , xp+10 yp-7, Dispense Options
;-
Gui, QA:Add, Text, c616771 x258 yp+22  h20 vT9_MYDI, - MyDispense
Gui, QA:Add, Text, c616771 x258 yp+22  h20 vT9_ETHI, - Ethicals
Gui, QA:Add, Text, c616771 x258 yp+22  h20 vT9_RANB, - Ranbaxy Top 10
Gui, QA:Add, Text, c616771 x258 yp+22  h20 vT9_PROD, - Products Available
Gui, QA:Add, Text, c616771 x258 yp+22  h20 vT9_DRUG, - Drug Breakdown
Gui, QA:Add, Text, c616771 x258 yp+22  h20 vT9_PFUN, - PF Unity
Gui, QA:Add, Text, c616771 x258 yp+22  h20 vT9_PFFL, - PF Flex

;---- POS OPTIONS
Gui, QA:Add, Text , x430 y190 w170 h235 0x800000 ,
Gui, QA:Add, Text , xp+10 yp-7, POS Options
;-
Gui, QA:Add, CheckBox, x440 yp+22  h20 vT9_SALE, - Salecat Good
Gui, QA:Add, Text, c616771 x458 yp+22  h20 vT9_SANO, - Sanofi Advantage
Gui, QA:Add, Text, c616771 x458 yp+22  h20 vT9_VMSO, - VMS/OTC
Gui, QA:Add, Text, c616771 x458 yp+22  h20 vT9_MYST, - MyStore
Gui, QA:Add, Text, c616771 x458 yp+22  h20 vT9_POSR, - POS Reports
Gui, QA:Add, Text, c616771 x458 yp+22  h20 vT9_OTCP, - OTC Populated
Gui, QA:Add, Text, c616771 x458 yp+22  h20 vT9_DAIL, - Daily Substitution
Gui, QA:Add, Text, c616771 x458 yp+22 h20 vT9_CORE, - Core Range Available
Gui, QA:Add, Text, c616771 x458 yp+22  h20 vT9_OVER, - Overview Available
;---- TAB END

;---- TAB API
Gui, QA:Tab, API
Gui, QA:font, s12 bold cc5c8c6, Segoe UI
Gui, QA:Add, Text, x380 y80 , API
Gui, QA:font,
Gui, QA:font, s8 cc5c8c6, Segoe UI
;---- EDIT BOXES
Gui, QA:Add, Edit, -E0x200 x40 y90  h20 vMonths10, 
Gui, QA:Add, Text , yp-20, Months on Website
Gui, QA:Add, Edit, -E0x200 x190 y90  h20 vBaldrick10, 
Gui, QA:Add, Text , yp-20, Months in Baldrick
Gui, QA:Add, Edit, -E0x200 x40 y140  h20 vDispDept10, 
Gui, QA:Add, Text , yp-20, Dispense Departments
;---- BUTTON RESOURCES
Gui, QA:Font, bold cc5c8c6, Segoe UI
Gui, QA:Add, Button, x230 y145 w170 h30 , BALDRICK
Gui, QA:Add, Button, x430 y145 w170 h30 , API
Gui, QA:Font, cc5c8c6, Segoe UI
;---- GENERAL OPTIONS
Gui, QA:Add, Text , x30 y190 w170 h235 0x800000 ,
Gui, QA:Add, Text , xp+10 yp-7, General Options
;-
Gui, QA:Add, Text, c616771 x58 yp+22  h20 vT10_PRIV, - Privacy Unloaded
Gui, QA:Add, Text, c616771 x58 yp+22  h20 vT10_DEAC, - Deactivated Legacy
Gui, QA:Add, CheckBox, x40 yp+22  h20 vT10_CONF, - Confirmed Rep/Group
Gui, QA:Add, Text, c616771 x58 yp+22  h20 vT10_ACCO, - Account Activated
Gui, QA:Add, Text, c616771 x58 yp+22  h20 vT10_DETA, - Details sent
;---- DISPENSE OPTIONS
Gui, QA:Add, Text , x230 y190 w170 h235 0x800000 ,
Gui, QA:Add, Text , xp+10 yp-7, Dispense Options
;-
Gui, QA:Add, Text, c616771 x258 yp+22  h20 vT10_MYDI, - MyDispense
Gui, QA:Add, Text, c616771 x258 yp+22  h20 vT10_ETHI, - Ethicals
Gui, QA:Add, Text, c616771 x258 yp+22  h20 vT10_RANB, - Ranbaxy Top 10
Gui, QA:Add, Text, c616771 x258 yp+22  h20 vT10_PROD, - Products Available
Gui, QA:Add, Text, c616771 x258 yp+22  h20 vT10_DRUG, - Drug Breakdown
Gui, QA:Add, Text, c616771 x258 yp+22  h20 vT10_PFUN, - PF Unity
Gui, QA:Add, Text, c616771 x258 yp+22  h20 vT10_PFFL, - PF Flex

;---- POS OPTIONS
Gui, QA:Add, Text , x430 y190 w170 h235 0x800000 ,
Gui, QA:Add, Text , xp+10 yp-7, POS Options
;-
Gui, QA:Add, CheckBox, x440 yp+22  h20 vT10_SALE, - Salecat Good
Gui, QA:Add, Text, c616771 x458 yp+22  h20 vT10_SANO, - Sanofi Advantage
Gui, QA:Add, Text, c616771 x458 yp+22  h20 vT10_VMSO, - VMS/OTC
Gui, QA:Add, Text, c616771 x458 yp+22  h20 vT10_MYST, - MyStore
Gui, QA:Add, CheckBox, x440 yp+22  h20 vT10_POSR, - POS Reports
Gui, QA:Add, Text, c616771 x458 yp+22  h20 vT10_OTCP, - OTC Populated
Gui, QA:Add, Text, c616771 x458 yp+22  h20 vT10_DAIL, - Daily Substitution
Gui, QA:Add, CheckBox, x440 yp+22 h20 vT10_CORE, - Core Range Available
Gui, QA:Add, CheckBox, x440 yp+22  h20 vT10_OVER, - Overview Available
;---- TAB END

Gui, QA:+Hwndgui_id
Gui, QA:Show, %gui_position%, %A_Space%

loop
{
    Gui, QA:Submit, NoHide
	FormatTime, Date,, yyyy/MM/dd
	FormatTime, Time,, h:mmtt

	T1PRIV := T1_PRIV ? " •• Privacy Unloaded" : ""
	T1DEAC := T1_DEAC ? " •• Deactivated Legacy" : ""
	T1CONF := T1_CONF ? " •• Confirmed Rep/Group" : ""
	T1ACCO := T1_ACCO ? " •• Account Activated" : ""
	T1DETA := T1_DETA ? " •• Details sent" : ""
	T1MYDI := T1_MYDI ? " •• MyDispense" : ""
	T1ETHI := T1_ETHI ? " •• Ethicals" : ""
	T1RANB := T1_RANB ? " •• Ranbaxy Top 10" : ""
	T1PROD := T1_PROD ? " •• Products Available" : ""
	T1DRUG := T1_DRUG ? " •• Drug Breakdown" : ""
	T1PFUN := T1_PFUN ? " •• PF Unity" : ""
	T1PFFL := T1_PFFL ? " •• PF Flex" : ""
	T1SALE := T1_SALE ? " •• Salecat Good" : ""
	T1SANO := T1_SANO ? " •• Sanofi Advantage" : ""
	T1VMSO := T1_VMSO ? " •• VMS/OTC" : ""
	T1MYST := T1_MYST ? " •• MyStore" : ""
	T1POSR := T1_POSR ? " •• POS Reports" : ""
	T1OTCP := T1_OTCP ? " •• OTC Populated" : ""
	T1DAIL := T1_DAIL ? " •• Daily Substitution" : ""
	T1CORE := T1_CORE ? " •• Core Range Available" : ""
	T1OVER := T1_OVER ? " •• Overview Available" : ""

	T2PRIV := T2_PRIV ? " •• Privacy Unloaded" : ""
	T2DEAC := T2_DEAC ? " •• Deactivated Legacy" : ""
	T2CONF := T2_CONF ? " •• Confirmed Rep/Group" : ""
	T2ACCO := T2_ACCO ? " •• Account Activated" : ""
	T2DETA := T2_DETA ? " •• Details sent" : ""
	T2MYDI := T2_MYDI ? " •• MyDispense" : ""
	T2ETHI := T2_ETHI ? " •• Ethicals" : ""
	T2RANB := T2_RANB ? " •• Ranbaxy Top 10" : ""
	T2PROD := T2_PROD ? " •• Products Available" : ""
	T2DRUG := T2_DRUG ? " •• Drug Breakdown" : ""
	T2PFUN := T2_PFUN ? " •• PF Unity" : ""
	T2PFFL := T2_PFFL ? " •• PF Flex" : ""
	T2SALE := T2_SALE ? " •• Salecat Good" : ""
	T2SANO := T2_SANO ? " •• Sanofi Advantage" : ""
	T2VMSO := T2_VMSO ? " •• VMS/OTC" : ""
	T2MYST := T2_MYST ? " •• MyStore" : ""
	T2POSR := T2_POSR ? " •• POS Reports" : ""
	T2OTCP := T2_OTCP ? " •• OTC Populated" : ""
	T2DAIL := T2_DAIL ? " •• Daily Substitution" : ""
	T2CORE := T2_CORE ? " •• Core Range Available" : ""
	T2OVER := T2_OVER ? " •• Overview Available" : ""

	T3PRIV := T3_PRIV ? " •• Privacy Unloaded" : ""
	T3DEAC := T3_DEAC ? " •• Deactivated Legacy" : ""
	T3CONF := T3_CONF ? " •• Confirmed Rep/Group" : ""
	T3ACCO := T3_ACCO ? " •• Account Activated" : ""
	T3DETA := T3_DETA ? " •• Details sent" : ""
	T3MYDI := T3_MYDI ? " •• MyDispense" : ""
	T3ETHI := T3_ETHI ? " •• Ethicals" : ""
	T3RANB := T3_RANB ? " •• Ranbaxy Top 10" : ""
	T3PROD := T3_PROD ? " •• Products Available" : ""
	T3DRUG := T3_DRUG ? " •• Drug Breakdown" : ""
	T3PFUN := T3_PFUN ? " •• PF Unity" : ""
	T3PFFL := T3_PFFL ? " •• PF Flex" : ""
	T3SALE := T3_SALE ? " •• Salecat Good" : ""
	T3SANO := T3_SANO ? " •• Sanofi Advantage" : ""
	T3VMSO := T3_VMSO ? " •• VMS/OTC" : ""
	T3MYST := T3_MYST ? " •• MyStore" : ""
	T3POSR := T3_POSR ? " •• POS Reports" : ""
	T3OTCP := T3_OTCP ? " •• OTC Populated" : ""
	T3DAIL := T3_DAIL ? " •• Daily Substitution" : ""
	T3CORE := T3_CORE ? " •• Core Range Available" : ""
	T3OVER := T3_OVER ? " •• Overview Available" : ""

	T4PRIV := T4_PRIV ? " •• Privacy Unloaded" : ""
	T4DEAC := T4_DEAC ? " •• Deactivated Legacy" : ""
	T4CONF := T4_CONF ? " •• Confirmed Rep/Group" : ""
	T4ACCO := T4_ACCO ? " •• Account Activated" : ""
	T4DETA := T4_DETA ? " •• Details sent" : ""
	T4MYDI := T4_MYDI ? " •• MyDispense" : ""
	T4ETHI := T4_ETHI ? " •• Ethicals" : ""
	T4RANB := T4_RANB ? " •• Ranbaxy Top 10" : ""
	T4PROD := T4_PROD ? " •• Products Available" : ""
	T4DRUG := T4_DRUG ? " •• Drug Breakdown" : ""
	T4PFUN := T4_PFUN ? " •• PF Unity" : ""
	T4PFFL := T4_PFFL ? " •• PF Flex" : ""
	T4SALE := T4_SALE ? " •• Salecat Good" : ""
	T4SANO := T4_SANO ? " •• Sanofi Advantage" : ""
	T4VMSO := T4_VMSO ? " •• VMS/OTC" : ""
	T4MYST := T4_MYST ? " •• MyStore" : ""
	T4POSR := T4_POSR ? " •• POS Reports" : ""
	T4OTCP := T4_OTCP ? " •• OTC Populated" : ""
	T4DAIL := T4_DAIL ? " •• Daily Substitution" : ""
	T4CORE := T4_CORE ? " •• Core Range Available" : ""
	T4OVER := T4_OVER ? " •• Overview Available" : ""

	T5PRIV := T5_PRIV ? " •• Privacy Unloaded" : ""
	T5DEAC := T5_DEAC ? " •• Deactivated Legacy" : ""
	T5CONF := T5_CONF ? " •• Confirmed Rep/Group" : ""
	T5ACCO := T5_ACCO ? " •• Account Activated" : ""
	T5DETA := T5_DETA ? " •• Details sent" : ""
	T5MYDI := T5_MYDI ? " •• MyDispense" : ""
	T5ETHI := T5_ETHI ? " •• Ethicals" : ""
	T5RANB := T5_RANB ? " •• Ranbaxy Top 10" : ""
	T5PROD := T5_PROD ? " •• Products Available" : ""
	T5DRUG := T5_DRUG ? " •• Drug Breakdown" : ""
	T5PFUN := T5_PFUN ? " •• PF Unity" : ""
	T5PFFL := T5_PFFL ? " •• PF Flex" : ""
	T5SALE := T5_SALE ? " •• Salecat Good" : ""
	T5SANO := T5_SANO ? " •• Sanofi Advantage" : ""
	T5VMSO := T5_VMSO ? " •• VMS/OTC" : ""
	T5MYST := T5_MYST ? " •• MyStore" : ""
	T5POSR := T5_POSR ? " •• POS Reports" : ""
	T5OTCP := T5_OTCP ? " •• OTC Populated" : ""
	T5DAIL := T5_DAIL ? " •• Daily Substitution" : ""
	T5CORE := T5_CORE ? " •• Core Range Available" : ""
	T5OVER := T5_OVER ? " •• Overview Available" : ""

	T6PRIV := T6_PRIV ? " •• Privacy Unloaded" : ""
	T6DEAC := T6_DEAC ? " •• Deactivated Legacy" : ""
	T6CONF := T6_CONF ? " •• Confirmed Rep/Group" : ""
	T6ACCO := T6_ACCO ? " •• Account Activated" : ""
	T6DETA := T6_DETA ? " •• Details sent" : ""
	T6MYDI := T6_MYDI ? " •• MyDispense" : ""
	T6ETHI := T6_ETHI ? " •• Ethicals" : ""
	T6RANB := T6_RANB ? " •• Ranbaxy Top 10" : ""
	T6PROD := T6_PROD ? " •• Products Available" : ""
	T6DRUG := T6_DRUG ? " •• Drug Breakdown" : ""
	T6PFUN := T6_PFUN ? " •• PF Unity" : ""
	T6PFFL := T6_PFFL ? " •• PF Flex" : ""
	T6SALE := T6_SALE ? " •• Salecat Good" : ""
	T6SANO := T6_SANO ? " •• Sanofi Advantage" : ""
	T6VMSO := T6_VMSO ? " •• VMS/OTC" : ""
	T6MYST := T6_MYST ? " •• MyStore" : ""
	T6POSR := T6_POSR ? " •• POS Reports" : ""
	T6OTCP := T6_OTCP ? " •• OTC Populated" : ""
	T6DAIL := T6_DAIL ? " •• Daily Substitution" : ""
	T6CORE := T6_CORE ? " •• Core Range Available" : ""
	T6OVER := T6_OVER ? " •• Overview Available" : ""

	T7PRIV := T7_PRIV ? " •• Privacy Unloaded" : ""
	T7DEAC := T7_DEAC ? " •• Deactivated Legacy" : ""
	T7CONF := T7_CONF ? " •• Confirmed Rep/Group" : ""
	T7ACCO := T7_ACCO ? " •• Account Activated" : ""
	T7DETA := T7_DETA ? " •• Details sent" : ""
	T7MYDI := T7_MYDI ? " •• MyDispense" : ""
	T7ETHI := T7_ETHI ? " •• Ethicals" : ""
	T7RANB := T7_RANB ? " •• Ranbaxy Top 10" : ""
	T7PROD := T7_PROD ? " •• Products Available" : ""
	T7DRUG := T7_DRUG ? " •• Drug Breakdown" : ""
	T7PFUN := T7_PFUN ? " •• PF Unity" : ""
	T7PFFL := T7_PFFL ? " •• PF Flex" : ""
	T7SALE := T7_SALE ? " •• Salecat Good" : ""
	T7SANO := T7_SANO ? " •• Sanofi Advantage" : ""
	T7VMSO := T7_VMSO ? " •• VMS/OTC" : ""
	T7MYST := T7_MYST ? " •• MyStore" : ""
	T7POSR := T7_POSR ? " •• POS Reports" : ""
	T7OTCP := T7_OTCP ? " •• OTC Populated" : ""
	T7DAIL := T7_DAIL ? " •• Daily Substitution" : ""
	T7CORE := T7_CORE ? " •• Core Range Available" : ""
	T7OVER := T7_OVER ? " •• Overview Available" : ""

	T8PRIV := T8_PRIV ? " •• Privacy Unloaded" : ""
	T8DEAC := T8_DEAC ? " •• Deactivated Legacy" : ""
	T8CONF := T8_CONF ? " •• Confirmed Rep/Group" : ""
	T8ACCO := T8_ACCO ? " •• Account Activated" : ""
	T8DETA := T8_DETA ? " •• Details sent" : ""
	T8MYDI := T8_MYDI ? " •• MyDispense" : ""
	T8ETHI := T8_ETHI ? " •• Ethicals" : ""
	T8RANB := T8_RANB ? " •• Ranbaxy Top 10" : ""
	T8PROD := T8_PROD ? " •• Products Available" : ""
	T8DRUG := T8_DRUG ? " •• Drug Breakdown" : ""
	T8PFUN := T8_PFUN ? " •• PF Unity" : ""
	T8PFFL := T8_PFFL ? " •• PF Flex" : ""
	T8SALE := T8_SALE ? " •• Salecat Good" : ""
	T8SANO := T8_SANO ? " •• Sanofi Advantage" : ""
	T8VMSO := T8_VMSO ? " •• VMS/OTC" : ""
	T8MYST := T8_MYST ? " •• MyStore" : ""
	T8POSR := T8_POSR ? " •• POS Reports" : ""
	T8OTCP := T8_OTCP ? " •• OTC Populated" : ""
	T8DAIL := T8_DAIL ? " •• Daily Substitution" : ""
	T8CORE := T8_CORE ? " •• Core Range Available" : ""
	T8OVER := T8_OVER ? " •• Overview Available" : ""

	T9PRIV := T9_PRIV ? " •• Privacy Unloaded" : ""
	T9DEAC := T9_DEAC ? " •• Deactivated Legacy" : ""
	T9CONF := T9_CONF ? " •• Confirmed Rep/Group" : ""
	T9ACCO := T9_ACCO ? " •• Account Activated" : ""
	T9DETA := T9_DETA ? " •• Details sent" : ""
	T9MYDI := T9_MYDI ? " •• MyDispense" : ""
	T9ETHI := T9_ETHI ? " •• Ethicals" : ""
	T9RANB := T9_RANB ? " •• Ranbaxy Top 10" : ""
	T9PROD := T9_PROD ? " •• Products Available" : ""
	T9DRUG := T9_DRUG ? " •• Drug Breakdown" : ""
	T9PFUN := T9_PFUN ? " •• PF Unity" : ""
	T9PFFL := T9_PFFL ? " •• PF Flex" : ""
	T9SALE := T9_SALE ? " •• Salecat Good" : ""
	T9SANO := T9_SANO ? " •• Sanofi Advantage" : ""
	T9VMSO := T9_VMSO ? " •• VMS/OTC" : ""
	T9MYST := T9_MYST ? " •• MyStore" : ""
	T9POSR := T9_POSR ? " •• POS Reports" : ""
	T9OTCP := T9_OTCP ? " •• OTC Populated" : ""
	T9DAIL := T9_DAIL ? " •• Daily Substitution" : ""
	T9CORE := T9_CORE ? " •• Core Range Available" : ""
	T9OVER := T9_OVER ? " •• Overview Available" : ""

	T10PRIV := T10_PRIV ? " •• Privacy Unloaded" : ""
	T10DEAC := T10_DEAC ? " •• Deactivated Legacy" : ""
	T10CONF := T10_CONF ? " •• Confirmed Rep/Group" : ""
	T10ACCO := T10_ACCO ? " •• Account Activated" : ""
	T10DETA := T10_DETA ? " •• Details sent" : ""
	T10MYDI := T10_MYDI ? " •• MyDispense" : ""
	T10ETHI := T10_ETHI ? " •• Ethicals" : ""
	T10RANB := T10_RANB ? " •• Ranbaxy Top 10" : ""
	T10PROD := T10_PROD ? " •• Products Available" : ""
	T10DRUG := T10_DRUG ? " •• Drug Breakdown" : ""
	T10PFUN := T10_PFUN ? " •• PF Unity" : ""
	T10PFFL := T10_PFFL ? " •• PF Flex" : ""
	T10SALE := T10_SALE ? " •• Salecat Good" : ""
	T10SANO := T10_SANO ? " •• Sanofi Advantage" : ""
	T10VMSO := T10_VMSO ? " •• VMS/OTC" : ""
	T10MYST := T10_MYST ? " •• MyStore" : ""
	T10POSR := T10_POSR ? " •• POS Reports" : ""
	T10OTCP := T10_OTCP ? " •• OTC Populated" : ""
	T10DAIL := T10_DAIL ? " •• Daily Substitution" : ""
	T10CORE := T10_CORE ? " •• Core Range Available" : ""
	T10OVER := T10_OVER ? " •• Overview Available" : ""

	
    msgText = % Time " •• #QACOMP - Months on Website/Baldrick: " Months1 Months2 Months3 Months4 Months5 Months6 Months7 Months8 Months9 Months10 "/" Baldrick1 Baldrick2 Baldrick3 Baldrick4 Baldrick5 Baldrick6 Baldrick7 Baldrick8 Baldrick9 Baldrick10 T1SALE T2SALE T3SALE T4SALE T5SALE T6SALE T7SALE T8SALE T9SALE T10SALE " •• Dispense Departments = ( " DispDept1 DispDept2 DispDept3 DispDept4 DispDept5 DispDept6 DispDept7 DispDept8 DispDept9 DispDept10 " ) " T1PRIV T2PRIV T3PRIV T4PRIV T5PRIV T6PRIV T7PRIV T8PRIV T9PRIV T10PRIV T1DEAC T2DEAC T3DEAC T4DEAC T5DEAC T6DEAC T7DEAC T8DEAC T9DEAC T10DEAC T1CONF T2CONF T3CONF T4CONF T5CONF T6CONF T7CONF T8CONF T9CONF T10CONF T1MYDI T2MYDI T3MYDI T4MYDI T5MYDI T6MYDI T7MYDI T8MYDI T9MYDI T10MYDI T1ETHI T2ETHI T3ETHI T4ETHI T5ETHI T6ETHI T7ETHI T8ETHI T9ETHI T10ETHI T1RANB T2RANB T3RANB T4RANB T5RANB T6RANB T7RANB T8RANB T9RANB T10RANB T1PROD T2PROD T3PROD T4PROD T5PROD T6PROD T7PROD T8PROD T9PROD T10PROD T1DRUG T2DRUG T3DRUG T4DRUG T5DRUG T6DRUG T7DRUG T8DRUG T9DRUG T10DRUG T1PFUN T2PFUN T3PFUN T4PFUN T5PFUN T6PFUN T7PFUN T8PFUN T9PFUN T10PFUN T1PFFL T2PFFL T3PFFL T4PFFL T5PFFL T6PFFL T7PFFL T8PFFL T9PFFL T10PFFL T1SANO T2SANO T3SANO T4SANO T5SANO T6SANO T7SANO T8SANO T9SANO T10SANO T1VMSO T2VMSO T3VMSO T4VMSO T5VMSO T6VMSO T7VMSO T8VMSO T9VMSO T10VMSO T1MYST T2MYST T3MYST T4MYST T5MYST T6MYST T7MYST T8MYST T9MYST T10MYST T1POSR T2POSR T3POSR T4POSR T5POSR T6POSR T7POSR T8POSR T9POSR T10POSR T1OTCP T2OTCP T3OTCP T4OTCP T5OTCP T6OTCP T7OTCP T8OTCP T9OTCP T10OTCP T1DAIL T2DAIL T3DAIL T4DAIL T5DAIL T6DAIL T7DAIL T8DAIL T9DAIL T10DAIL T1CORE T2CORE T3CORE T4CORE T5CORE T6CORE T7CORE T8CORE T9CORE T10CORE T1OVER T2OVER T3OVER T4OVER T5OVER T6OVER T7OVER T8OVER T9OVER T10OVER T1ACCO T2ACCO T3ACCO T4ACCO T5ACCO T6ACCO T7ACCO T8ACCO T9ACCO T10ACCO T1DETA T2DETA T3DETA T4DETA T5DETA T6DETA T7DETA T8DETA T9DETA T10DETA " [ " QANotes " ]"

    if NOT (msgText == oldMsgText)
    {
       GuiControl, QA:Text, QAPreview, %msgText%
       oldMsgText := msgText
    }

    sleep 100
}

return

QAButtonBaldrick:
Gui, QA:Submit, NoHide
run, https://baldrick.intellipharm.com.au/sitestatus/index
return

QAButtonSanofiCentral:
Gui, QA:Submit, NoHide
run, https://sanoficentral2015.intellipharm.com.au/
return

QAButtonStoreIQ2:
Gui, QA:Submit, NoHide
run, https://storeiq.intellipharm.com.au/
return

QAButtonStoreIQ3:
Gui, QA:Submit, NoHide
run, https://storeiq3.intellipharm.com.au/
return

QAButtonApotex:
Gui, QA:Submit, NoHide
run, https://apotex.intellipharm.com.au/
return

QAButtonRanbaxy:
Gui, QA:Submit, NoHide
run, https://ranbaxy.intellipharm.com.au/
return

QAButtonSandoz:
Gui, QA:Submit, NoHide
run, https://sandoz.intellipharm.com.au/
return

QAButtonPrivateLabel:
Gui, QA:Submit, NoHide
run, https://endeavour.intellipharm.com.au/
return

QAButtonAPI:
Gui, QA:Submit, NoHide
run, https://storeiq3.intellipharm.com.au/
return

Complete:

WinGetPos, gui_x, gui_y,,, ahk_id %gui_id%
IniWrite, x%gui_x% y%gui_y%, C:\AutoHotKey\settings.ini, window position, QA_position

if (SCODE = ""){
msgbox, 16, Warning, Please enter a SITE CODE ID, 
return
}

Gui, QA:Submit
FormatTime, Date,, yyyy/MM/dd
FormatTime, Time,, h:mmtt
FormatTime, scripttime,, yyyyMM
IniRead, Name, C:\AutoHotKey\settings.ini, UserName, name
IniRead, Surname, C:\AutoHotKey\settings.ini, UserName, Surname
FileAppend, %Date% - %VerNum% - %SCODE% - %Time% - %Name% %Surname% - QA`n, G:\Support\Public Staff Folders\Aaron\Logs\scriptlog%scripttime%.txt
Clipboard= %msgText%

;POINTS CALC - ADDING SITE CODES
FormatTime, Date,, yyyyMMdd
FileAppend, %SCODE% `n, G:\Support\Public Staff Folders\Aaron\points\%Name%\%date% QA.txt

;ADDING POINTS

IfNotExist, G:\Support\Public Staff Folders\Aaron\points\%Name%\%date%.ini
{
	IniWrite, 0, G:\Support\Public Staff Folders\Aaron\points\%Name%\%date%.ini, Count Points, Points
}

IniRead, Points, G:\Support\Public Staff Folders\Aaron\points\%Name%\%date%.ini, Count Points, Points
Points++  ; This adds 1 to your variable TimesOpened.
IniWrite, %Points%, G:\Support\Public Staff Folders\Aaron\points\%Name%\%date%.ini, Count Points, Points

Reload
Return

QAExit:
WinGetPos, gui_x, gui_y,,, ahk_id %gui_id%
IniWrite, x%gui_x% y%gui_y%, C:\AutoHotKey\settings.ini, window position, QA_position
Reload
Return