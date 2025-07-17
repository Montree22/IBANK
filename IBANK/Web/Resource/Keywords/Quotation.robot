*** Settings ***
Resource          CommonKeywords.robot

*** Keywords ***
Create Prospect
    Click    //button[contains(text(),"สร้างผู้มุ่งหวัง")]

Select Prospect Prename
    [Arguments]    ${prename}
    Click    //app-quotation//label[contains(text(),"คำนำหน้า")]/following-sibling::div//input
    Type Text    //app-quotation//label[contains(text(),"คำนำหน้า")]/following-sibling::div//input    ${prename}
    # Click    //*[@class="ddl-autocomplete"]//label[text()="${prename}"]
    Click    //*[@id="suggestions"]//*[text()="${prename}"]

Input First Name
    [Arguments]    ${name}
    Type Text    //app-quotation//input[@formcontrolname="firstname"]    ${name}

Input Last Name
    [Arguments]    ${lname}
    Type Text    //app-quotation//input[@formcontrolname="lastname"]    ${lname}

Convert Age to Birthdate
    [Arguments]    ${age}
    ${age}    Convert To String    ${age}
    ${isDay}    Run Keyword And Return Status    Should Match Regexp    ${age}    วัน
    ${isMonth}    Run Keyword And Return Status    Should Match Regexp    ${age}    เดือน
    Set Global Variable    ${is_age_day}    ${isDay}
    Set Global Variable    ${is_age_month}    ${isMonth}
    ${age}    Get Regexp Matches    ${age}    \\d+
    ${age}    Convert To Integer    ${age[0]}
    ${curdate}    Get Current Date    result_format=datetime
    ${year}    Convert To Integer    ${curdate.year}
    ${month}    Convert To Integer    ${curdate.month}
    ${temp_year}    Evaluate    int(${year}-${age}+543)
    ${age}    Run Keyword If    ${temp_year} < 2483 and ("${month}" == "1" or "${month}" == "2" or "${month}" == "3") and "${is_age_day}" == "False" and "${is_age_month}" == "False"    Evaluate    ${age}+1
    ...    ELSE IF    ${temp_year} < 2483 and ("${month}" == "1" or "${month}" == "2" or "${month}" == "3") and "${is_age_day}" == "False" and "${is_age_month}" == "False"    Evaluate    ${age}+1
    ...    ELSE    Set Variable    ${age}
    # Run Keyword If    ${isDay} or ${isMonth}    Set Global Variable    ${glo_age}    0
    # ...    ELSE    Set Global Variable    ${glo_age}    ${age}
    ${day}    ${month}    ${year}    Run Keyword If    ${isDay}     Convert Age(day) to Birthdate    ${age}
    ...    ELSE IF    ${isMonth}    Convert Age(month) to Birthdate    ${age}
    ...    ELSE IF    ${isDay}==${False} and ${isMonth}==${False}     Convert Age(year) to Birthdate    ${age}
    #[Return]    ${day}    ${month}    ${year}

Convert Age(day) to Birthdate
    [Arguments]    ${day}
    ${curdate}    Get Current Date    result_format=datetime
    #:::::Check Digit:::::
    ${month_digit}=    Evaluate    len('${curdate.month}')
    ${day_digit}=    Evaluate    len('${curdate.day}')
    ${hour_digit}=    Evaluate    len('${curdate.hour}')
    ${minute_digit}=    Evaluate    len('${curdate.minute}')
    ${second_digit}=    Evaluate    len('${curdate.second}')
    #:::::::::::::::::::::
    ${curdate_month}=    Set Variable if    ${month_digit}==1    0${curdate.month}    ${curdate.month}
    ${curdate_day}=    Set Variable if    ${day_digit}==1    0${curdate.day}    ${curdate.day}
    ${curdate_hour}=    Set Variable if    ${hour_digit}==1    0${curdate.hour}    ${curdate.hour}
    ${curdate_minute}=    Set Variable if    ${minute_digit}==1    0${curdate.minute}    ${curdate.minute}
    ${curdate_second}=    Set Variable if    ${second_digit}==1    0${curdate.second}    ${curdate.second}
    #::::::::::::::::::::
    ${curdate_month}=    Convert To String    ${curdate_month}
    ${curdate_day}=    Convert To String    ${curdate_day}
    ${curdate_hour}=    Convert To String    ${curdate_hour}
    ${curdate_minute}=    Convert To String    ${curdate_minute}
    ${curdate_second}=    Convert To String    ${curdate_second}
    #::::::::::::::::::::
    ${is_monthly_payment}=    Run Keyword And Return Status    List Should Contain Value    ${monthly_payment}  ${plancode_abbrev}
    ${curdate_day}=    Set Variable if    ${is_monthly_payment}    01    ${curdate_day}
    ${curdate}=   Set Variable    ${curdate.year}-${curdate_month}-${curdate_day} ${curdate_hour}:${curdate_minute}:${curdate_second}
    ${curdate}    Convert Date    ${curdate}
    Log    ${curdate}
    #:::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    ${Birth}    Subtract Time From Date    ${curdate}    ${day} days    result_format=datetime
    ${Birthyear}    Convert To Integer    ${Birth.year}
    ${Birthyear}    Evaluate    ${Birthyear}+543
    ${Birthyear}    Convert To String    ${Birthyear}
    ${Birthmonth}    Convert To String    ${Birth.month}
    ${Birthday}    Convert To String    ${Birth.day}
    #[Return]    ${Birthday}    ${Birthmonth}    ${Birthyear}    

Convert Age(month) to Birthdate
    [Arguments]    ${age}
    ${curdate}    Get Current Date    result_format=datetime
    ${year}    Convert To Integer    ${curdate.year}
    ${month}    Convert To Integer    ${curdate.month}
    ${is_monthly_payment}=    Run Keyword And Return Status    List Should Contain Value    ${monthly_payment}  [${code}]
    ${curdate_day}=    Set Variable if    ${is_monthly_payment}    1    ${curdate.day}
    ${day}    Convert To Integer    ${curdate_day}
    ${year}    Evaluate    ${year}+543
    ${expected_month}=    Run Keyword If    ${age}>${month}    Evaluate    12-(${age}-${month})    ELSE    Evaluate    ${month}-${age}
    ${month_char}=    Set Variable If    "${expected_month}"=="1"    ม.ค.    "${expected_month}"=="2"    ก.พ.    "${expected_month}"=="3"
    ...    มี.ค.    "${expected_month}"=="4"    เม.ย.    "${expected_month}"=="5"    พ.ค.    "${expected_month}"=="6"
    ...    มิ.ย.    "${expected_month}"=="7"    ก.ค.    "${expected_month}"=="8"    ส.ค.    "${expected_month}"=="9"
    ...    ก.ย.    "${expected_month}"=="10"    ต.ค.    "${eGo Next MainPagexpected_month}"=="11"    พ.ย.    "${expected_month}"=="12" or "${expected_month}"=="0"
    ...    ธ.ค.
    #[Return]    ${day}    ${expected_month}    ${year}

Convert Age(year) to Birthdate
    [Arguments]    ${age}
    ${age}    Convert To String    ${age}
    ${age}    Get Regexp Matches    ${age}    \\d+
    ${age}    Convert To Integer    ${age[0]}
    ${curdate}    Get Current Date    result_format=datetime
    ${year}    Convert To Integer    ${curdate.year}
    ${month}    Convert To Integer    ${curdate.month}
    ${is_monthly_payment}=    Run Keyword And Return Status    List Should Contain Value    ${monthly_payment}  ${plancode_abbrev}
    Set Global Variable    ${is_monthly_payment}    ${is_monthly_payment}
    ${curdate_day}=    Set Variable if    ${is_monthly_payment}    1    ${curdate.day}
    ${day}    Convert To Integer    ${curdate_day}
    ${temp_year}    Evaluate    int(${year}-${age}+543)
    ${age}    Run Keyword If    ${temp_year} < 2483 and ("${month}" == "1" or "${month}" == "2" or "${month}" == "3") and "${is_age_day}" == "False" and "${is_age_month}" == "False"    Evaluate    ${age}+1
    ...    ELSE IF    ${temp_year} < 2483 and ("${month}" == "1" or "${month}" == "2" or "${month}" == "3") and "${is_age_day}" == "False" and "${is_age_month}" == "False"    Evaluate    ${age}+1
    ...    ELSE    Set Variable    ${age}
    ${day}    Run Keyword If    ${day} <= 15 and "${age}"=="30"    Evaluate    ${day}+1
    ...    ELSE IF    ${day} >15 and "${age}"=="30"    Evaluate    ${day}-1
    ...    ELSE    Set Variable    ${day}
    ${year}    Evaluate    ${year}-${age}+543
    #[Return]    ${day}    ${month}    ${year}

Select Year Quotation
    [Arguments]    ${year}
    # Click Element by javascript    document.querySelector('ion-datetime#datetimeQuotation').shadowRoot.querySelector('.calendar-month-year').querySelector('button')
    FOR    ${index}    IN RANGE    1    86
        ${text}    Evaluate JavaScript    ${None}    document.querySelector('ion-datetime#datetimeQuotation').shadowRoot.querySelector('.datetime-year').querySelector('ion-picker').querySelector('.year-column').querySelector('ion-picker-column-option:nth-child(${index})').innerText
        ${text}    Get Regexp Matches    ${text}    \\d+
        ${text}    Set Variable    ${text[0]}
        IF    ${text}==${year}
            Click Element by javascript    document.querySelector('ion-datetime#datetimeQuotation').shadowRoot.querySelector('.datetime-year').querySelector('ion-picker').querySelector('.year-column').querySelector('ion-picker-column-option:nth-child(${index})').shadowRoot.querySelector('button')
            Exit For Loop
        END
    END
    # Click Element by javascript    document.querySelector('ion-datetime#datetimeQuotation').shadowRoot.querySelector('.datetime-year').querySelector('button')
Select Month Quotation
    [Arguments]    ${month}
    ${month}    Convert To Integer    ${month}
    Click Element by javascript    document.querySelector('ion-datetime#datetimeQuotation').shadowRoot.querySelector('.datetime-year').querySelector('ion-picker').querySelector('.month-column').querySelector('ion-picker-column-option:nth-child(${month})').shadowRoot.querySelector('button')
Select Day Quotation
    [Arguments]    ${day}
    Sleep    0.5s
    ${day}    Convert To Integer    ${day}
    Click Element by javascript    document.querySelector('ion-datetime#datetimeQuotation').shadowRoot.querySelector('.calendar-month:nth-child(2)').querySelector('[data-day="${day}"]')
Select Birthdate
    [Documentation]    เลือกวัน,เดือน,ปีเกิด
    [Arguments]    ${day}    ${month}    ${year}
    Click    //app-quotation//input[@formcontrolname="dateOfBirth"]
    Click Element by javascript    document.querySelector('ion-datetime#datetimeQuotation').shadowRoot.querySelector('.calendar-month-year').querySelector('button')
    Select Year Quotation    ${year}
    Select Month Quotation    ${month}
    Click Element by javascript    document.querySelector('ion-datetime#datetimeQuotation').shadowRoot.querySelector('.datetime-year').querySelector('button')
    Select Day Quotation    ${day}
    Sleep    1s
    Click    //ion-datetime[@id="datetimeQuotation"]//ion-button[text()="ตกลง"]

Input Telno
    [Arguments]    ${telno}
    Sleep    2s
    Type Text    //*[@formcontrolname="phoneNumber"]    ${telno}

Send SMS and Verify
    Click    //*[contains(text(),"ส่ง SMS")]
    Sleep    1s
    Click    //*[contains(text(),"ตรวจสอบผล")]

Input Referral Code
    [Arguments]    ${code}
    IF    "${code}"=="ไม่มี"
        Click    //*[@id="quotation.refCode"]//ion-checkbox[text()="ไม่มี"]
    ELSE
        Click    //*[@id="quotation.refCode"]//ion-checkbox[text()="มี"]
        Type Text    //*[@formcontrolname="code"]    ${code}
    END

Go Next Page
    Click    //ion-fab-button[contains(text(),"ถัดไป")]
    Sleep    5s

Select Occupation
    [Arguments]    ${occ}
    # Type Text    //app-plancode//label[contains(text(),"อาชีพ")]//following-sibling::app-autocomplete//input    ${occ}
    # Click    //div[@class="ddl-autocomplete"]//label[text()="${occ}"]

    Type Text    //app-plancode//label[contains(text(),"อาชีพ")]//following-sibling::app-autocomplete//textarea    ${occ}
    Click    //div[@class="ddl-autocomplete"]//label[text()="${occ}"]

Select Type
    [Arguments]    ${type}
    Log    type = ${type}
    IF    ${type}=="CL"
        Click    //button[@id="quotation.planList.cl.display"]

    ELSE
        Click    //button[@id="quotation.planList.ol.display"]
    END


Select Plan
    [Arguments]    ${plancode}
    Click    //app-plancode//button[@id="quotation.planList.ol.display"]//ion-checkbox
    Type Text    //app-plancode//label[contains(text(),"แบบประกัน")]//following-sibling::app-autocomplete//textarea    ${plancode}
    Click    //div[@class="ddl-autocomplete"]//label[contains(text(),"${plancode}")]

Input Sum Insured
    [Arguments]    ${insured}
    Click    //app-plan-detail//input[@id="calType1"]
    Type Text    //*[@formcontrolname="premium"]    ${insured}00
    Click    //button[contains(text(),"คำนวณ")]

Verify Quotation
    Click Element by javascript    document.querySelector('app-step-form-quotation-main').querySelector('ion-fab-button:nth-child(2)').shadowRoot.querySelector('button')


Go Next MainPage
    Click    //*[@id="header"]/ion-toolbar[2]/ion-segment/ion-segment-button[1]

# Create Appform
#     Sleep    2s
#     Click Element by javascript    document.querySelector('app-step-form-quotation-main').querySelector('ion-fab-button#application\\\\.display').shadowRoot.querySelector('button')