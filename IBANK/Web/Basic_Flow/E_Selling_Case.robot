*** Settings ***
Resource          ../Resource/Keywords/CommonKeywords.robot
Resource    ../Resource/Keywords/Login.robot

*** Test Cases ***
TestCase
    [Tags]
    Open E-Selling Website 
    Login E-Selling    IBANK    1234
    log    testcase1
    Create Prospect
    Select Prospect Prename   นาย 	
    Input First Name    ทดสอบ
    Input Last Name    ระบบ
    Select Birthdate    11    01    2538
    Input Telno    0992263861
    Input Referral Code    ไม่มี
    Go Next Page
    Select Occupation    กรรมกร / ก่อสร้างทั่วไป
    Select Type    CL
    Select Plan    ตะกาฟุลคุ้มครองสินเชื่อ แบบตะซาบุต (MG01)
    Go Next Page




    # Input Sum Insured    500000
    # Go Next Page
    # Go Next Page
    # Verify Quotation
    # Go Next MainPage
    Sleep    5s


