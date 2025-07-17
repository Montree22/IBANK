*** Settings ***
Resource          CommonKeywords.robot

*** Keywords ***
Input User ID
    [Arguments]    ${user}
    Type Text    //ion-input[@label="รหัสผู้ใช้งาน"]//input    ${user}

Input Password ID
    [Arguments]    ${password}
    Type Text    //ion-input[@label="รหัสผ่าน"]//input    ${password}

Login E-Selling
    [Arguments]    ${user}    ${password}
    Input User ID    ${user}
    Input Password ID    ${password}
    Click    //button[contains(text(),"เข้าสู่ระบบ")]