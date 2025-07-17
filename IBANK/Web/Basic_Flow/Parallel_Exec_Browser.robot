*** Settings ***
Resource          ../Resource/Keywords/CommonKeywords.robot

*** Test Cases ***
Parallel_Regression
    # Create File    /home/tleuser/Desktop/PDF_list.txt    PDF List
    ${path_automate_lib}    Evaluate    os.path.expanduser("${lo_automate_lib_path}")    os
    ${path}=    Convert To String    ${path_automate_lib}
    Evaluate    sys.path.append(\"${path}\")    sys
    # @{range}=    Create List
    # @{range}=    Create List    12135    12727
    # @{range}=    Create List    3069    3243
    @{range}=    Create List    1400    1582
    ${list_tabname}=    Run Keyword If    "${ar_ListTabname}" != "none"    Set Variable    ${ar_ListTabname}
    ...    ELSE    Set Variable    ${EMPTY}
    Log    ${list_tabname}
    ${data}=    Get Data From Database By User Type    ${ar_SType}    ${range}
    Execute    ${ar_Process}    ${lo_parallel_testsuite_browser}    test_template    ${lo_parallel_output_browser}    ${ar_environment}    ${ar_Execute_type}    ${ar_Mode}    60    ${ar_OS}    ${ar_Location}    ${data}    ${ar_Action}

Y01_test_template
    [Tags]    spark
    ${citizen_id}    Generate Citizen Id
    ${telno}    Generate TelNo
    Get Table Data    ${ar_table_name}    dic    ${pk}
    Set Global Variable    ${isCIMB}    ${False}
    Set Global Variable    ${isGIO}    ${False}
    Open TLProPlus Website
    Login TLProPlus    19210690    Aa12345678
    Input Firstname And Lastname    สปาร์ค    โอแอล
    ${day}    ${month}    ${year}    Convert Age to Birthdate    ${dic}[Age]
    Select Birthdate    ${day}    ${month}    ${year}
    Select Prefix    ${dic}[Sex]
    Select Occupation Class    ${dic}[Occl]
    Select Occupation And Job Description Auto    ${dic}[Occl]
    Input Citizen ID And Phone Number    ${citizen_id}    ${telno}
    Select Insurance Plan    ${dic}[PlanType]
    Select Mode    ${dic}[Mode]
    Input Coverage    ${dic}[Insured]
    Verify Total Premium    ${dic}[Premium]
    Select AC1    ${dic}[Ac01]    ${dic}[PremiumAc01]
    Select KG1    ${dic}[Kg01]    ${dic}[PremiumKg01]
    Select AC2    ${dic}[Ac02]    ${dic}[PremiumAc02]
    Select KG2    ${dic}[Kg02]    ${dic}[PremiumKg02]
    Select AC3    ${dic}[Ac03]    ${dic}[PremiumAc03]
    Select JP    ${dic}[Jp3]    ${dic}[PremiumJp3]
    Select RP    ${dic}[RP]    ${dic}[PremiumRP]
    Select RPG    ${dic}[HCG]    ${dic}[PremiumHCG]
    Select SR2    ${dic}[SR2]    ${dic}[PremiumSR2]
    Select MultiPay    ${dic}[D11]    ${dic}[PremiumD11]
    Select SPGPlus    ${dic}[SPGP]    ${dic}[PremiumSPGP]
    Select OP3    ${dic}[OP3]    ${dic}[PremiumOP3]
    Select Health Fit Multipay    ${dic}[C21]    ${dic}[PremiumC21]
    Select TR    ${dic}[D0102]    ${dic}[InsuranceD0102]    ${dic}[PremiumD0102]
    Select Health Fit 99    ${dic}[H99]    ${dic}[PremiumH99]
    Select Health Fit 99 Refund Plus    ${dic}[S99]    ${dic}[PremiumS99]
    Select VIP Deductible    ${dic}[VIP]    ${dic}[PremiumVIP]
    Select Health Fit DD    ${dic}[HDD]    ${dic}[PremiumHDD]
    Select Health Fit Ultra    ${dic}[HFU]    ${dic}[PremiumHFU]
    Select OP4    ${dic}[OP4]    ${dic}[PremiumOP4]
    Select OP6    ${dic}[OP6]    ${dic}[PremiumOP6]
    Select RP LifeFit    ${dic}[RpL]    ${dic}[PremiumRpL]
    Select TR48    ${dic}[TR48]    ${dic}[PremiumTR48]
    Select SR2 LifeFit    ${dic}[CR4]    ${dic}[PremiumCR4]
    Select Health Fit DD LifeFit    ${dic}[HDL]    ${dic}[PremiumHDL]
    Select OP5 LifeFit    ${dic}[OP5]    ${dic}[PremiumOP5]
    Select Health Fit Ultra Life Fit    ${dic}[HFULife]    ${dic}[PremiumHFULife]
    Select Health Fit 99 Life Fit    ${dic}[H9L]    ${dic}[PremiumH9L]
    Select Health Fit 99 RP Life Fit    ${dic}[S9L]    ${dic}[PremiumS9L]
    Select Taxes    ${dic}[Tax]    ${dic}[TaxRate]    ${dic}[NetValue]
    # Update Taxes    ${dic}[TaxRate]
    Save Quotation Form
    # Open PDF Quotation Page
    # Request ref number
    # Add Signature
    # Create App Form
    # Input Height And Weight    175    89
    # Select Nationality    ไทย
    # Input Email    romfa.tac@thailife.com
    # Select Identify    บัตรประชาชน
    # Input Identify Data    บัตรประชาชน    ${citizen_id}    ตลอดชีพ
    # Select Marital Status    โสด
    # Fill House Registration House Number    12345
    # Fill and Choose House Registration Province    ชลบุรี
    # Fill Current House Number    12345
    # Fill and Choose Current Province    น่าน
    # Fill Workplace House Number    12345
    # Fill and Choose Workplace Province    ประจวบคีรีขันธ์
    # Select Contact Address    ทะเบียนบ้าน
    # Input Annual Salary    600000
    # Go Next Page
    # Select Tax Reduce    ไม่มีความประสงค์
    # Select Relation And Input Payment Name    มารดา     นาง    ผู้ชำระ    เงิน
    # Select Payment birthdate    2535    3    1
    # Input Payment ID    1506523636635
    # Select Payment Type    เงินสด
    # Go Next Page
    # Fill Beneficiary Information    1    ผู้เอาประกัน    30    Permanent    100
    # Go Next Page
    # Select Other Insurance Answer    ไม่มี
    # Select Insurance Reject Answer    ไม่เคย
    # Go Next Page
    # # # Select Weight Change    ไม่เปลี่ยน
    # # # Select Selling Drugs    ไม่เคย
    # # # Select Drug Exp    ไม่เสพ/ไม่เคยเสพ
    # # # Select Drink History    ไม่ดื่ม/ไม่เคย
    # # # Select Q13_Data Smoke History    ไม่สูบ/ไม่เคย
    # # # Select Family Person Diagnose Disease    ไม่เป็น
    # # # Select Diagnose Disease History    ไม่เคย
    # # # Select Symptom History    ไม่เคย
    # # # Annual Check Up During 5 Year (ก.)    ไม่เคย
    # # # Annual Check Up During 5 Year (ข.)    ไม่เคย
    # # # Select Treatment Answer    ไม่เคย
    # Switch Page To Spark
    # Q10 Is Related With Drug Trafficking    ใช่
    # Q11 Use Or Have Ever Use Drug    ใช่    ไอซ์    30กรัม    5    5    เลิกใช้แล้ว    2020
    # Q12 Drink Or Have Ever Had Alcohol on a Regular Basis    ใช่    เลิกดื่มแล้ว    2020
    # Q12_Data Drinking History    เบียร์    2-5 ขวด    3    10
    # Q13 Smoke Or Have Ever Smoked    ใช่    เลิกสูบบุหรี่แล้ว    2020
    # Q13_Data Smoke History    0-10 มวน    5
    # Q14 Q14 Weight Changed In The Past 6 Months    ใช่    ลดลง    ออกกำลังกาย    10
    # Q15_1 Q15_1 Family Health History    ใช่    โรคหัวใจ    โรคมะเร็ง    โรคไต
    # Q16_1 Q16_1 History of Diagnosis Neuropathy    ใช่    สายตาพิการ
    # Q16_Data Input Diagnosis Details    สายตาพิการ    01/01/2020    หายแล้ว    รพ.พญาไท
    # Q16_2 History of Diagnosis Respiratory Disease    ใช่    โรคหอบหืด
    # Q16_Data Input Diagnosis Details    โรคหอบหืด    01/01/2020    หายแล้ว    รพ.พญาไท
    # Q16_3 History of Diagnosis Cardiovascular Disease    ใช่    โรคหัวใจ
    # Q16_Data Input Diagnosis Details    โรคหัวใจ    01/01/2020    หายแล้ว    รพ.พญาไท
    # Q16_4 History of Diagnosis Gastrointestinal Disease    ใช่     ดีซ่าน
    # Q16_Data Input Diagnosis Details    ดีซ่าน    01/01/2020    หายแล้ว    รพ.พญาไท
    # Q16_5 History of Diagnosis Endocrine System Disease    ใช่    โรคไต
    # Q16_Data Input Diagnosis Details    โรคไต    01/01/2020    หายแล้ว    รพ.พญาไท
    # Q16_6 History of Diagnosis Musculoskeletal Diseases    ใช่     โรคเก๊าท์
    # Q16_Data Input Diagnosis Details    โรคเก๊าท์    01/01/2020    หายแล้ว    รพ.พญาไท
    # Q16_7 History of Diagnosis Tumors and Cysts    ใช่     โรคมะเร็ง
    # Q16_Data Input Diagnosis Details    โรคมะเร็ง    01/01/2020    หายแล้ว    รพ.พญาไท
    # Q16_8 History of Diagnosis Other Diseases    ใช่    โรคเลือด
    # Q16_Data Input Diagnosis Details    โรคเลือด    01/01/2020    หายแล้ว    รพ.พญาไท
    # Q17_1 Medical History Nervous System and Movement Symptoms    ใช่   กล้ามเนื้ออ่อนแรง
    # Q17_Data Input Medical History    กล้ามเนื้ออ่อนแรง    01/01/2019    เหนื่อยใจ
    # Q17_2 Medical History Respiratory and Thoracic Symptoms    ใช่    ใจสั่น
    # Q17_Data Input Medical History    ใจสั่น    01/01/2019    เหนื่อยใจ
    # Q17_3 Medical History Abdominal Symptoms    ใช่    ท้องเสียเรื้อรัง
    # Q17_Data Input Medical History    ท้องเสียเรื้อรัง    01/01/2019    เหนื่อยใจ
    # Q17_4 Medical History Others    ใช่    จ้ำเลือด
    # Q17_Data Input Medical History    จ้ำเลือด    01/01/2019    เหนื่อยใจ
    # Q17_5 Medical History Past 6 Month_1    ใช่    น้ำหนักลด
    # Q17_Data Input Medical History    น้ำหนักลด    01/01/2019    เหนื่อยใจ
    # Q17_6 Medical History Past 6 Month_2    ใช่    กำลังตั้งครรภ์
    # Q17_Data Input Medical History    กำลังตั้งครรภ์    01/01/2019    เหนื่อยใจ    9
    # Q18_A Health Check History_1    ใช่
    # Q18_A_Data Health Check Detail    1    ตรวจคลื่นหัวใจ    01/10/2011    รพ.จุฬา    คิดไปเอง    ไม่มี
    # Q18_A_Data Health Check Detail    2    ตรวจปอด    11/10/2011    รพ.จุฬา    กรดไหลย้อน    ไม่มี
    # Q18_A_Data Health Check Detail    3
    # Q18_B Health Check History_2    ใช่
    # Q18_B_Data Injury Detail    1    ผ่าตัดสมอง    01/07/2017    รพ.พญาไท    หายดี
    # Q18_B_Data Injury Detail    2    ผ่าตัดหัวใจ    01/07/2018    รพ.พญาไท2    หายไปจากเธอ
    # Q18_B_Data Injury Detail    3
    # Q19_1 Health Attachment_History of Diagnosis Neuropathy    ใช่    สมาธิสั้น
    # Q19_Data Health Attachment Detail    สมาธิสั้น    05/06/2015    รพ.ตำรวจ    ผ่าตัด    หายแล้ว    มากกว่า 5 ปี
    # Q19_Data Health Attachment Detail
    # Q19_Data Health Attachment Detail
    # Q19_2 Health Attachment_History of Diagnosis Gastrointestinal Disease    ใช่    ไส้เลื่อน
    # Q19_Data Health Attachment Detail    ไส้เลื่อน    05/06/2018    รพ.ตำรวจ    กินยา    หายแล้ว    ภายใน 2 ปีที่ผ่านมา    ไส้เลื่อนกระบังลม
    # Q19_Data Health Attachment Detail
    # Q19_Data Health Attachment Detail
    # Q19_3 Health Attachment_History of Diagnosis Urinary Tract Disease    ใช่    นิ่ว
    # Q19_Data Health Attachment Detail    นิ่ว    05/06/2019    รพ.จุฬา    ผ่าตัด    ยังมีอาการอยู่    มากกว่า 10 ปี    นิ่วในไต
    # Q19_Data Health Attachment Detail
    # Q19_Data Health Attachment Detail
    # Q19_4 Health Attachment_History of Diagnosis Musculoskeletal Disease    ใช่    ข้อเสื่อม
    # Q19_Data Health Attachment Detail    ข้อเสื่อม    11/11/2011    รพ.พญาไท    ไม่ได้รักษา    เป็นๆหายๆ     specific_type=ข้อศอก
    # Q19_Data Health Attachment Detail
    # Q19_Data Health Attachment Detail
    # Q19_5 Health Attachment_History of Diagnosis Respiratory Disease    ใช่    ภูมิแพ้
    # Q19_Data Health Attachment Detail    ภูมิแพ้    05/06/2015    รพ.ตำรวจ    นอน    หายแล้ว    ภายใน 3 เดือนที่ผ่านมา    ภูมิแพ้อากาศ
    # Q19_Data Health Attachment Detail
    # Q19_Data Health Attachment Detail
    # Continue Spark
    # Switch To Pro Plus
    # Select National Check Answer    ไม่มี
    # Select Nationality Address Answer    ไม่เป็น
    # Select Nationality Tax Answer    ไม่มี
    # Select Nationality Status Answer    ไม่มี
    # Confirm FATCA
    # Go Next Page
    # Input Place    ไทยประกันชีวิต
    # Input Witness Name    16    นาย    ไม่จ่าย    เงิน    บิดา    นาง    จ่าย    เงิน
    # Input Payment Name App Sign    16    นาย Rose Garden
    # Save App Form
    [Teardown]    Keywords For Teardown

Y02_test_template
    [Tags]    sparkpa
    # ${citizen_id}    Generate Citizen Id
    # ${telno}    Generate TelNo
    Get Table Data    ${ar_table_name}    dic    ${pk}
    Set Global Variable    ${isCIMB}    ${False}
    Set Global Variable    ${isGIO}    ${False}
    Open TLProPlus Website
    Login TLProPlus    19210690    Aa12345678
    Input Firstname And Lastname    สปาร์ค    โอแอล
    # ${day}    ${month}    ${year}    Convert Age to Birthdate    ${dic}[Age]
    # Select Birthdate    ${day}    ${month}    ${year}
    Select Birthdate    7    3    2538
    Select Prefix    ${dic}[Sex]
    Select Occupation Class    ${dic}[Occl]
    Select Occupation And Job Description Auto    ${dic}[Occl]
    # Input Citizen ID And Phone Number    ${citizen_id}    0876943643
    Input Citizen ID And Phone Number    1103701653345    0876943643
    Select Insurance Plan    ${dic}[PlanType]
    Select Mode    ${dic}[Mode]
    Input Coverage    ${dic}[Insured]
    Input Coverage    500000
    # Verify Total Premium    ${dic}[Premium]
    # Select AC1    ${dic}[Ac01]    ${dic}[PremiumAc01]
    # Select KG1    ${dic}[Kg01]    ${dic}[PremiumKg01]
    # Select AC2    ${dic}[Ac02]    ${dic}[PremiumAc02]
    # Select KG2    ${dic}[Kg02]    ${dic}[PremiumKg02]
    # Select AC3    ${dic}[Ac03]    ${dic}[PremiumAc03]
    # Select JP    ${dic}[Jp3]    ${dic}[PremiumJp3]
    # Select RP    ${dic}[RP]    ${dic}[PremiumRP]
    # Select RPG    ${dic}[HCG]    ${dic}[PremiumHCG]
    # Select SR2    ${dic}[SR2]    ${dic}[PremiumSR2]
    # Select MultiPay    ${dic}[D11]    ${dic}[PremiumD11]
    # Select SPGPlus    ${dic}[SPGP]    ${dic}[PremiumSPGP]
    # Select OP3    ${dic}[OP3]    ${dic}[PremiumOP3]
    # Select Health Fit Multipay    ${dic}[C21]    ${dic}[PremiumC21]
    # Select TR    ${dic}[D0102]    ${dic}[InsuranceD0102]    ${dic}[PremiumD0102]
    # Select Health Fit 99    ${dic}[H99]    ${dic}[PremiumH99]
    # Select Health Fit 99 Refund Plus    ${dic}[S99]    ${dic}[PremiumS99]
    # Select VIP Deductible    ${dic}[VIP]    ${dic}[PremiumVIP]
    # Select Health Fit DD    ${dic}[HDD]    ${dic}[PremiumHDD]
    # Select Health Fit Ultra    ${dic}[HFU]    ${dic}[PremiumHFU]
    # Select OP4    ${dic}[OP4]    ${dic}[PremiumOP4]
    # Select OP6    ${dic}[OP6]    ${dic}[PremiumOP6]
    # Select KB    ${dic}[Kb2Sex]    ${dic}[Kb2Age]    ${dic}[PremiumKb2]
    # Select RP LifeFit    ${dic}[RpL]    ${dic}[PremiumRpL]
    # Select TR48    ${dic}[TR48]    ${dic}[PremiumTR48]
    # Select SR2 LifeFit    ${dic}[CR4]    ${dic}[PremiumCR4]
    # Select Health Fit DD LifeFit    ${dic}[HDL]    ${dic}[PremiumHDL]
    # Select OP5 LifeFit    ${dic}[OP5]    ${dic}[PremiumOP5]
    # Select Health Fit Ultra Life Fit    ${dic}[HFULife]    ${dic}[PremiumHFULife]
    # Select Health Fit 99 Life Fit    ${dic}[H9L]    ${dic}[PremiumH9L]
    # Select Health Fit 99 RP Life Fit    ${dic}[S9L]    ${dic}[PremiumS9L]
    # Verify Total Premium After Set Rider     ${dic}[PremiumRider]
    # Select Taxes    ${dic}[Tax]    ${dic}[TaxRate]    ${dic}[NetValue]
    # Update Taxes    ${dic}[TaxRate]
    Save Quotation Form
    # Open PDF Quotation Page
    # Request ref number
    # Add Signature
    # Create App Form
    # Get Reference Number
    # Input Height And Weight    175    89
    # Select Nationality    ไทย
    # Input Email    nat.tan@thailife.com
    # Select Identify    บัตรประชาชน
    # Input Identify Data    บัตรประชาชน    1103701653345    ตลอดชีพ
    # Select Marital Status    โสด
    # # Select Weight Change    ไม่เปลี่ยน
    # # Select Selling Drugs    ไม่เคย
    # # Select Drug Exp    ไม่เสพ/ไม่เคยเสพ
    # # Select Drink History    ไม่ดื่ม/ไม่เคย
    # # Select Q13_Data Smoke History    ไม่สูบ/ไม่เคย
    # Fill House Registration House Number    12345
    # Fill and Choose House Registration Province    ชลบุรี
    # Fill Current House Number    12345
    # Fill and Choose Current Province    น่าน
    # Fill Workplace House Number    12345
    # Fill and Choose Workplace Province    ประจวบคีรีขันธ์
    # Select Contact Address    ทะเบียนบ้าน
    # Input Annual Salary    600000
    # Go Next Page
    # Select Tax Reduce    ไม่มีความประสงค์
    # Select Relation And Input Payment Name    มารดา     นาง    ผู้ชำระ    เงิน
    # Select Payment birthdate    2535    3    1
    # Input Payment ID    1506523636635
    # Select Payment Type    เงินสด
    # Go Next Page
    # Fill Beneficiary Information    1    ผู้เอาประกัน    30    Permanent    100
    # Go Next Page
    # Select Other Insurance Answer    ไม่มี
    # Select Insurance Reject Answer    ไม่เคย
    # # Go Next Page
    # # # Select Weight Change    ไม่เปลี่ยน
    # # # Select Selling Drugs    ไม่เคย
    # # # Select Drug Exp    ไม่เสพ/ไม่เคยเสพ
    # # # Select Drink History    ไม่ดื่ม/ไม่เคย
    # # # Select Q13_Data Smoke History    ไม่สูบ/ไม่เคย
    # # # Select Family Person Diagnose Disease    ไม่เป็น
    # # # Select Diagnose Disease History    ไม่เคย
    # # # Select Symptom History    ไม่เคย
    # # # Annual Check Up During 5 Year (ก.)    ไม่เคย
    # # # Annual Check Up During 5 Year (ข.)    ไม่เคย
    # # # Select Treatment Answer    ไม่เคย
    # Switch Page To Spark
    # Q10 Is Related With Drug Trafficking    ไม่ใช่
    # Q11 Use Or Have Ever Use Drug    ไม่ใช่
    # Q12 Drink Or Have Ever Had Alcohol on a Regular Basis    ไม่ใช่
    # Q13 Smoke Or Have Ever Smoked    ไม่ใช่
    # Q14 Weight Changed In The Past 6 Months    ไม่ใช่
    # Q15_1 Family Health History    ไม่ใช่
    # Q16_1 History of Diagnosis Neuropathy    ไม่ใช่
    # Q16_2 History of Diagnosis Respiratory Disease    ไม่ใช่
    # Q16_3 History of Diagnosis Cardiovascular Disease    ไม่ใช่
    # Q16_4 History of Diagnosis Gastrointestinal Disease    ไม่ใช่
    # Q16_5 History of Diagnosis Endocrine System Disease    ไม่ใช่
    # Q16_6 History of Diagnosis Musculoskeletal Diseases    ไม่ใช่
    # Q16_7 History of Diagnosis Tumors and Cysts    ไม่ใช่
    # Q16_8 History of Diagnosis Other Diseases    ไม่ใช่
    # Q17_1 Medical History Nervous System and Movement Symptoms    ไม่ใช่
    # Q17_2 Medical History Respiratory and Thoracic Symptoms    ไม่ใช่
    # Q17_3 Medical History Abdominal Symptoms    ไม่ใช่
    # Q17_4 Medical History Others    ไม่ใช่
    # Q17_5 Medical History Past 6 Month_1    ไม่ใช่
    # Q17_6 Medical History Past 6 Month_2    ไม่ใช่
    # Q18_A Health Check History_1    ไม่ใช่
    # Q18_B Health Check History_2    ไม่ใช่
    # Q19_1 Health Attachment_History of Diagnosis Neuropathy    ไม่ใช่
    # Q19_2 Health Attachment_History of Diagnosis Gastrointestinal Disease    ไม่ใช่
    # Q19_3 Health Attachment_History of Diagnosis Urinary Tract Disease    ไม่ใช่
    # Q19_4 Health Attachment_History of Diagnosis Musculoskeletal Disease    ไม่ใช่
    # Q19_5 Health Attachment_History of Diagnosis Respiratory Disease    ไม่ใช่
    # Continue Spark
    # Switch To Pro Plus
    # Select National Check Answer    ไม่มี
    # Select Nationality Address Answer    ไม่เป็น
    # Select Nationality Tax Answer    ไม่มี
    # Select Nationality Status Answer    ไม่มี
    # Confirm FATCA
    # Go Next Page
    # Input Place    ไทยประกันชีวิต
    # Input Parent Detail    ${dic}[Age]    มารดา    นาง    ปกครอง    ไง    1544281576219    07/06/2501
    # Save App Form
    [Teardown]    Keywords For Teardown

Y01_PA_test_template
    [Tags]    sparkpa
    Get Table Data    ${ar_table_name}    dic    ${pk}
    ${citizen_id}    Generate Citizen Id
    ${telno}    Generate TelNo
    # ${fname}    Set First Name    ${dic}[Fname]
    # ${lname}    Set Last Name    ${dic}[Lname]
    Set Global Variable    ${isCIMB}    ${False}
    Set Global Variable    ${isGIO}    ${False}
    Open TLProPlus Website
    Login TLProPlus    19210690    Aa12345678
    Input Firstname And Lastname    สปาร์ค    พีเอ
    ${day}    ${month}    ${year}    Convert Age to Birthdate    ${dic}[Age]
    Select Birthdate    ${day}    ${month}    ${year}
    Select Prefix    ${dic}[Sex]
    Select Occupation Class    ${dic}[Occl]
    Select Occupation And Job Description Auto    ${dic}[Occl]
    Input Citizen ID And Phone Number    ${citizen_id}    ${telno}
    Select Insurance Plan    ${dic}[PlanType]
    Select Package    ${dic}[Plan]
    Verify Total Premium    ${dic}[Premium]
    Save Quotation Form
    # Open PDF Quotation Page
    # Request ref number
    # Add Signature
    # Create App Form
    # Input Height And Weight    ${dic}[Height]    ${dic}[Weight]
    # Input Email    noonehere@thmnawq.com
    # Select Identify    ${dic}[Idtype]
    # Input Identify Data    ${dic}[Idtype]    ${dic}[IDCard]    ${dic}[Expirydate]
    # Select Marital Status    ${dic}[Maritalstatus]
    # Fill House Registration House Number    12345
    # Fill and Choose House Registration Province    ชลบุรี
    # Fill Current House Number    12345
    # Fill and Choose Current Province    ${dic}[Caddress]
    # Fill Workplace House Number    12345
    # Fill and Choose Workplace Province    ประจวบคีรีขันธ์
    # Select Contact Address    ทะเบียนบ้าน
    # Input Annual Salary    ${dic}[Salary]
    # Go Next Page
    # # Input Payer Info    ${dic}[Age]
    # Select Tax Reduce    ไม่มีความประสงค์
    # Select Relation And Input Payment Name    ${dic}[Payer_Relation]     ${dic}[Payer_Prename]    ${dic}[Payer_Fname]    ${dic}[Payer_Lname]
    # IF    "${dic}[Payer_Relation]"!="ผู้เอาประกัน"
    #     ${day}    ${month}    ${year}    Convert String To Birthdate    ${dic}[Payer_Birthdate]
    #     Select Payment birthdate    ${year}    ${month}    ${day}
    #     Input Payment ID    ${dic}[Payer_ID]
    # END
    # Select Payment Type    เงินสด
    # Go Next Page
    # # Fill Beneficiary Information    1    ผู้เอาประกัน    ${dic}[Age]    Permanent    100
    # Fill Beneficiary Information    1    ${dic}[Beneficiary_Relation_1]    ${dic}[Beneficiary_Age_1]    Permanent    ${dic}[Beneficiary_Percent_1]    ${dic}[Beneficiary_Prename_1]    ${dic}[Beneficiary_Fname_1]    ${dic}[Beneficiary_Lname_1]
    # Fill Beneficiary Information    2    ${dic}[Beneficiary_Relation_2]    ${dic}[Beneficiary_Age_2]    Permanent    ${dic}[Beneficiary_Percent_2]    ${dic}[Beneficiary_Prename_2]    ${dic}[Beneficiary_Fname_2]    ${dic}[Beneficiary_Lname_2]
    # Fill Beneficiary Information    3    ${dic}[Beneficiary_Relation_3]    ${dic}[Beneficiary_Age_3]    Permanent    ${dic}[Beneficiary_Percent_3]    ${dic}[Beneficiary_Prename_3]    ${dic}[Beneficiary_Fname_3]    ${dic}[Beneficiary_Lname_3]
    # Fill Beneficiary Information    4    ${dic}[Beneficiary_Relation_4]    ${dic}[Beneficiary_Age_4]    Permanent    ${dic}[Beneficiary_Percent_4]    ${dic}[Beneficiary_Prename_4]    ${dic}[Beneficiary_Fname_4]    ${dic}[Beneficiary_Lname_4]
    # Go Next Page
    # Select Other Insurance Answer    ${dic}[Q_Other]
    # Other Insurance Data P.A.    ${dic}[Q_Other_Ins]    ${dic}[Q_Other_Sum]
    # Select Insurance Reject Answer    ${dic}[Q_Reject]
    # Input Insurance Rejection Data P.A.    1    ${dic}[Q_Reject_Company1]    ${dic}[Q_Reject_Insured1]
    # Input Insurance Rejection Data P.A.    2    ${dic}[Q_Reject_Company2]    ${dic}[Q_Reject_Insured2]
    # # Go Next Page
    # # # Select Weight Change    ไม่เปลี่ยน
    # # # Select Selling Drugs    ไม่เคย
    # # # Select Drug Exp    ไม่เสพ/ไม่เคยเสพ
    # # # Select Drink History    ไม่ดื่ม/ไม่เคย
    # # # Select Q13_Data Smoke History    ไม่สูบ/ไม่เคย
    # # # Select Family Person Diagnose Disease    ไม่เป็น
    # # # Select Diagnose Disease History    ไม่เคย
    # # # Select Symptom History    ไม่เคย
    # # # Annual Check Up During 5 Year (ก.)    ไม่เคย
    # # # Annual Check Up During 5 Year (ข.)    ไม่เคย
    # # # Select Treatment Answer    ไม่เคย
    # Switch Page To Spark
    # Q08_P.A. Drive Or Ride Motorcycle?    ${dic}[Q08_PA]
    # Q09_P.A. Drink Liquor or Alcoholic Beverages?    ${dic}[Q09_PA]
    # Q14_P.A. Have Ever Taken Hard Drug?    ${dic}[Q14_PA]    ${dic}[Q14_PA_Detail]
    # Q15_P.A. Have Ever Been Convicted of a Drug-Related Crime?    ${dic}[Q15_PA]    ${dic}[Q15_PA_Detail]
    # Q10_P.A. Have Ever Been Admit To a Hospital in The Past 2 Years?    ${dic}[Q10_PA]    ${dic}[Q10_PA_Day]    ${dic}[Q10_PA_State]    ${dic}[Q10_PA_Result]    ${dic}[Q10_PA_Place]
    # Q12_P.A. Have Any Abnormalities In Your Eyesight Or Hearing?    ${dic}[Q12_PA]    ${dic}[Q12_PA_Detail]
    # Q13_P.A. Have Any Abnormal Organs Or Disabilities?    ${dic}[Q13_PA]    ${dic}[Q13_PA_Detail]
    # Q11_1_P.A. Medical History_Epilepsy    ${dic}[Q11_1]
    # Q11_2_P.A. Medical History_Heart Disease    ${dic}[Q11_2]
    # Q11_3_P.A. Medical History_Hypertension    ${dic}[Q11_3]
    # Q11_4_P.A. Medical History_Diabetes    ${dic}[Q11_4]
    # Q11_5_P.A. Medical History_Bone or Muscle Disease    ${dic}[Q11_5]
    # Q11_6_P.A. Medical History_Cancer    ${dic}[Q11_6]
    # Q11_7_P.A. Medical History_AIDS    ${dic}[Q11_7]
    # Continue Spark
    # Switch To Pro Plus P.A.
    # Input Parent Detail P.A.    ${dic}[Age]    ${dic}[parent_relation]    ${dic}[parent_prefix]    ${dic}[parent_fname]    ${dic}[parent_lname]    ${dic}[parent_id]    ${dic}[parent_bdate]
    # Save App Form
    # Get Appform No
    # Log Many    ${global_refno}    ${global_appform}
    # Connect To MySQL
    # Input Data To Database    ${pk}    ${ar_table_name}    Refno_${ar_environment}    ${global_refno}
    # Input Data To Database    ${pk}    ${ar_table_name}    Appform_${ar_environment}    ${global_appform}
    # Disconnect From Database
    [Teardown]    Keywords For Teardown

Y01_PA_Micro_test_template
    [Tags]    sparkpa
    Get Table Data    ${ar_table_name}    dic    ${pk}
    ${citizen_id}    Generate Citizen Id
    ${telno}    Generate TelNo
    # ${fname}    Set First Name    ${dic}[Fname]
    # ${lname}    Set Last Name    ${dic}[Lname]
    Set Global Variable    ${isCIMB}    ${False}
    Set Global Variable    ${isGIO}    ${False}
    Open TLProPlus Website
    Login TLProPlus    19210690    Aa12345678
    Input Firstname And Lastname    สปาร์ค    พีเอไมโคร
    ${day}    ${month}    ${year}    Convert Age to Birthdate    ${dic}[Age]
    Select Birthdate    ${day}    ${month}    ${year}
    Select Prefix    ${dic}[Sex]
    Select Occupation Class    ${dic}[Occl]
    Select Occupation And Job Description Auto    ${dic}[Occl]
    Input Citizen ID And Phone Number    ${citizen_id}    ${telno}
    Select Insurance Plan    ${dic}[PlanType]
    Select Package    ${dic}[Plan]
    Verify Total Premium    ${dic}[Premium]
    Save Quotation Form
    # Open PDF Quotation Page
    # Request ref number
    # Add Signature
    # Create App Form
    # Input Email    noonehere@thmnawq.com
    # Select Identify    ${dic}[Idtype]
    # Input Identify Data    ${dic}[Idtype]    ${dic}[IDCard]    ${dic}[Expirydate]
    # Select Marital Status    ${dic}[Maritalstatus]
    # Fill House Registration House Number    12345
    # Fill and Choose House Registration Province    ชลบุรี
    # Fill Current House Number    12345
    # Fill and Choose Current Province    ${dic}[Caddress]
    # Fill Workplace House Number    12345
    # Fill and Choose Workplace Province    ประจวบคีรีขันธ์
    # Select Contact Address    ทะเบียนบ้าน
    # Go Next Page
    # Select Tax Reduce    ไม่มีความประสงค์
    # Select Relation And Input Payment Name    ${dic}[Payer_Relation]     ${dic}[Payer_Prename]    ${dic}[Payer_Fname]    ${dic}[Payer_Lname]
    # IF    "${dic}[Payer_Relation]"!="ผู้เอาประกัน"
    #     ${day}    ${month}    ${year}    Convert String To Birthdate    ${dic}[Payer_Birthdate]
    #     Select Payment birthdate    ${year}    ${month}    ${day}
    #     Input Payment ID    ${dic}[Payer_ID]
    # END
    # Select Payment Type    เงินสด
    # Go Next Page
    # Fill Beneficiary Information    1    ${dic}[Beneficiary_Relation_1]    ${dic}[Beneficiary_Age_1]    Permanent    ${dic}[Beneficiary_Percent_1]    ${dic}[Beneficiary_Prename_1]    ${dic}[Beneficiary_Fname_1]    ${dic}[Beneficiary_Lname_1]
    # Fill Beneficiary Information    2    ${dic}[Beneficiary_Relation_2]    ${dic}[Beneficiary_Age_2]    Permanent    ${dic}[Beneficiary_Percent_2]    ${dic}[Beneficiary_Prename_2]    ${dic}[Beneficiary_Fname_2]    ${dic}[Beneficiary_Lname_2]
    # Fill Beneficiary Information    3    ${dic}[Beneficiary_Relation_3]    ${dic}[Beneficiary_Age_3]    Permanent    ${dic}[Beneficiary_Percent_3]    ${dic}[Beneficiary_Prename_3]    ${dic}[Beneficiary_Fname_3]    ${dic}[Beneficiary_Lname_3]
    # Fill Beneficiary Information    4    ${dic}[Beneficiary_Relation_4]    ${dic}[Beneficiary_Age_4]    Permanent    ${dic}[Beneficiary_Percent_4]    ${dic}[Beneficiary_Prename_4]    ${dic}[Beneficiary_Fname_4]    ${dic}[Beneficiary_Lname_4]
    # # Go Next Page
    # Switch Page To Spark
    # Q11_1_P.A. Medical History_Epilepsy    ${dic}[Q11_1]
    # Q11_2_P.A. Medical History_Heart Disease    ${dic}[Q11_2]
    # Q11_3_P.A. Medical History_Hypertension    ${dic}[Q11_3]
    # Q11_4_P.A. Medical History_Diabetes    ${dic}[Q11_4]
    # Q11_5_P.A. Medical History_Bone or Muscle Disease    ${dic}[Q11_5]
    # Q11_6_P.A. Medical History_Cancer    ${dic}[Q11_6]
    # Q11_7_P.A. Medical History_AIDS    ${dic}[Q11_7]
    # Continue Spark
    # Switch To Pro Plus P.A.
    # Input Parent Detail P.A.    ${dic}[Age]    ${dic}[parent_relation]    ${dic}[parent_prefix]    ${dic}[parent_fname]    ${dic}[parent_lname]    ${dic}[parent_id]    ${dic}[parent_bdate]
    # Save App Form
    # Get Appform No
    # Log Many    ${global_refno}    ${global_appform}
    # Connect To MySQL
    # Input Data To Database    ${pk}    ${ar_table_name}    Refno_${ar_environment}    ${global_refno}
    # Input Data To Database    ${pk}    ${ar_table_name}    Appform_${ar_environment}    ${global_appform}
    # Disconnect From Database
    [Teardown]    Keywords For Teardown

Y02_UL_test_template
    [Tags]    sparkpa
    ${citizen_id}    Generate Citizen Id
    ${telno}    Generate TelNo
    Get Table Data    ${ar_table_name}    dic    ${pk}
    Set Global Variable    ${isCIMB}    ${False}
    Set Global Variable    ${isGIO}    ${False}
    Open TLProPlus Website
    Login TLProPlus    33112134    Aa12345678
    Select Tab and SubTab    InsuranceWithInvestment    UniversalLife
    Input Firstname And Lastname    เดฟไอโอนิค    ยูแอล
    ${day}    ${month}    ${year}    Convert Age to Birthdate    ${dic}[Age]
    Select Birthdate    ${day}    ${month}    ${year}
    Select Prefix    ${dic}[Sex]
    Select Occupation Class    ${dic}[Occl]
    Select Occupation And Job Description Auto    ${dic}[Occl]
    Input Citizen ID And Phone Number    ${citizen_id}    ${telno}
    Select Insurance Plan UL    ${dic}[PlanType]
    Select UL Sale Offer        ${dic}[Mode]
    Input Premium And Coverage UL    ${dic}[Premium]    ${dic}[Insured]
    Input Payment And Premium TopUP UL    ${dic}[PaymentTopUp]    ${dic}[PremiumTopUp]
    Select AC1    ${dic}[Ac01]    ${dic}[PremiumAc01]
    Select KG1    ${dic}[Kg01]    ${dic}[PremiumKg01]
    Select AC2    ${dic}[Ac02]    ${dic}[PremiumAc02]
    Select KG2    ${dic}[Kg02]    ${dic}[PremiumKg02]
    Select AC3    ${dic}[Ac03]    ${dic}[PremiumAc03]
    Select RP    ${dic}[RP]    ${dic}[PremiumRP]
    Select RPG    ${dic}[HCG]    ${dic}[PremiumHCG]
    Select SR2    ${dic}[SR2]    ${dic}[PremiumSR2]
    Select MultiPay    ${dic}[D11]    ${dic}[PremiumD11]
    Select SPGPlus    ${dic}[SPGP]    ${dic}[PremiumSPGP]
    Select OP3    ${dic}[OP3]    ${dic}[PremiumOP3]
    Select Health Fit Multipay    ${dic}[C21]    ${dic}[PremiumC21]
    Select TR    ${dic}[D0102]    ${dic}[InsuranceD0102]    ${dic}[PremiumD0102]
    Select Health Fit 99    ${dic}[H99]    ${dic}[PremiumH99]
    Select Health Fit 99 Refund Plus    ${dic}[S99]    ${dic}[PremiumS99]
    Select VIP Deductible    ${dic}[VIP]    ${dic}[PremiumVIP]
    Select Health Fit DD    ${dic}[HDD]    ${dic}[PremiumHDD]
    Select Health Fit Ultra    ${dic}[HFU]    ${dic}[PremiumHFU]
    Select OP4    ${dic}[OP4]    ${dic}[PremiumOP4]
    # Verify Total Premium With Rider UL     ${dic}[PremiumTopupRider]
    # Save Quotation Form
    # Open PDF Quotation Page
    # Request ref number
    # Add Signature UL
    # Create App Form
    # Input Height And Weight    175    89
    # Select Nationality    ไทย
    # Input Email    romfa.tac@thailife.com
    # Select Identify    บัตรประชาชน
    # Input Identify Data    บัตรประชาชน    ${citizen_id}    ตลอดชีพ
    # Select Marital Status    โสด
    # # Select Weight Change    ไม่เปลี่ยน
    # # Select Selling Drugs    ไม่เคย
    # # Select Drug Exp    ไม่เสพ/ไม่เคยเสพ
    # # Select Drink History    ไม่ดื่ม/ไม่เคย
    # # Select Q13_Data Smoke History    ไม่สูบ/ไม่เคย
    # Fill House Registration House Number    12345
    # Fill and Choose House Registration Province    ชลบุรี
    # Fill Current House Number    12345
    # Fill and Choose Current Province    น่าน
    # Fill Workplace House Number    12345
    # Fill and Choose Workplace Province    ประจวบคีรีขันธ์
    # Select Contact Address    ทะเบียนบ้าน
    # Input Annual Salary    600000
    # Go Next Page
    # Select Tax Reduce    ไม่มีความประสงค์
    # Select Relation And Input Payment Name    มารดา     นาง    ผู้ชำระ    เงิน
    # Select Payment birthdate    2535    3    1
    # Input Payment ID    1506523636635
    # Select Payment Type    เงินสด
    # Go Next Page
    # Fill Beneficiary Information    1    ผู้เอาประกัน    30    Permanent
    # Go Next Page
    # Select Other Insurance Answer    ไม่มี
    # Select Insurance Reject Answer    ไม่เคย
    # Go Next Page
    # # # Select Weight Change    ไม่เปลี่ยน
    # # # Select Selling Drugs    ไม่เคย
    # # # Select Drug Exp    ไม่เสพ/ไม่เคยเสพ
    # # # Select Drink History    ไม่ดื่ม/ไม่เคย
    # # # Select Q13_Data Smoke History    ไม่สูบ/ไม่เคย
    # # # Select Family Person Diagnose Disease    ไม่เป็น
    # # # Select Diagnose Disease History    ไม่เคย
    # # # Select Symptom History    ไม่เคย
    # # # Annual Check Up During 5 Year (ก.)    ไม่เคย
    # # # Annual Check Up During 5 Year (ข.)    ไม่เคย
    # # # Select Treatment Answer    ไม่เคย
    # Switch Page To Spark
    # Q08_P.A. Drive Or Ride Motorcycle?    ไม่เป็น
    # Q09_P.A. Drink Liquor or Alcoholic Beverages?    ไม่เป็น
    # Q14_P.A. Have Ever Taken Hard Drug?    ไม่ใช่
    # Q15_P.A. Have Ever Been Convicted of a Drug-Related Crime?    ไม่ใช่
    # Q10_P.A. Have Ever Been Admit To a Hospital in The Past 2 Years?    ไม่ใช่
    # Q12_P.A. Have Any Abnormalities In Your Eyesight Or Hearing?    ไม่ใช่
    # Q13_P.A. Have Any Abnormal Organs Or Disabilities?    ไม่ใช่
    # Q11_1_P.A. Medical History_Epilepsy    ไม่ใช่
    # Q11_2_P.A. Medical History_Heart Disease    ไม่ใช่
    # Q11_3_P.A. Medical History_Hypertension    ไม่ใช่
    # Q11_4_P.A. Medical History_Diabetes    ไม่ใช่
    # Q11_5_P.A. Medical History_Bone or Muscle Disease    ไม่ใช่
    # Q11_6_P.A. Medical History_Cancer    ไม่ใช่
    # Q11_7_P.A. Medical History_AIDS    ไม่ใช่
    # Continue Spark
    # Switch To Pro Plus
    # # Select National Check Answer    ไม่มี
    # # Select Nationality Address Answer    ไม่เป็น
    # # Select Nationality Tax Answer    ไม่มี
    # # Select Nationality Status Answer    ไม่มี
    # # Confirm FATCA
    # # Go Next Page
    # # Input Place    ไทยประกันชีวิต
    # # Input Witness Name    16    นาย    ไม่จ่าย    เงิน    บิดา    นาง    จ่าย    เงิน
    # Input Payment Name App Sign    30    นาย Rose Garden
    # Save App Form
    [Teardown]    Keywords For Teardown

Y01_UK_test_template
    [Tags]    uktest
    ${citizen_id}    Generate Citizen Id
    ${telno}    Generate TelNo
    Get Table Data    ${ar_table_name}    dic    ${pk}
    Set Global Variable    ${isCIMB}    ${False}
    Set Global Variable    ${isGIO}    ${False}
    Open TLProPlus Website
    Login TLProPlus    ${dic}[User]    Aa12345678
    Select Tab and SubTab    InsuranceWithInvestment    UnitLink
    Select Prefix    หญิง
    Input Firstname And Lastname    สองหนึ่ง    ยูเคหนึ่ง
    Select Occupation Class    2
    Select Occupation And Job Description    นักเรียน    เรียนหนังสือ
    ${day}    ${month}    ${year}    Convert Age to Birthdate    ${dic}[Age]
    Select Birthdate    ${day}    ${month}    ${year}
    Input Citizen ID And Phone Number    ${citizen_id}    0876943643
    Select Investment    หุ้นกู้
    Select Insurance Plan UK    [UA01]
    Select Mode UK    ชำระครั้งเดียว
    # Input RPP    18000
    # Input Insurance RPP    1000000
    Click    //*[@id="quatationForm_premiunIncrememter"]/button[2]
    # Select Health Fit Multipay    300000
    Save Quotation Form
    Open PDF Quotation Page
    Request ref number UK
    Add Signature UK
    Create App Form
    Get Reference Number UK
    Edit App Form Document    ใบคำขอเอาประกันภัย
    Input Height And Weight    175    89
    Select Nationality    ไทย
    Input Email    romfa.tac@thailife.com
    Select Identify    บัตรประชาชน
    Input Identify Data    บัตรประชาชน    ${citizen_id}    ตลอดชีพ
    Select Marital Status    โสด
    Fill House Registration House Number    12345
    Fill and Choose House Registration Province    ชลบุรี
    Fill Current House Number    12345
    Fill and Choose Current Province    น่าน
    Fill Workplace House Number    12345
    Fill and Choose Workplace Province    ประจวบคีรีขันธ์
    Select Contact Address    ทะเบียนบ้าน
    Input Annual Salary    600000
    Go Next Page
    Select Tax Reduce    ไม่มีความประสงค์
    Select Relation And Input Payment Name    มารดา     นาง    ผู้ชำระ    เงิน
    Select Payment birthdate    2535    3    1
    Input Payment ID    1506523636635
    Go Next Page
    Fill Beneficiary Information    1    ผู้เอาประกัน    ${dic}[Age]    Permanent    100
    Go Next Page
    # Select Other Insurance Answer    ไม่มี
    # Select Insurance Reject Answer    ไม่เคย
    # Go Next Page
    # Switch Page To Spark
    # Q10 Is Related With Drug Trafficking    ไม่ใช่
    # Q11 Use Or Have Ever Use Drug    ไม่ใช่
    # Q12 Drink Or Have Ever Had Alcohol on a Regular Basis    ไม่ใช่
    # Q13 Smoke Or Have Ever Smoked    ไม่ใช่
    # Q14 Weight Changed In The Past 6 Months    ไม่ใช่
    # Q15_1 Family Health History    ไม่ใช่
    # Q16_1 History of Diagnosis Neuropathy    ไม่ใช่
    # Q16_2 History of Diagnosis Respiratory Disease    ไม่ใช่
    # Q16_3 History of Diagnosis Cardiovascular Disease    ไม่ใช่
    # Q16_4 History of Diagnosis Gastrointestinal Disease    ไม่ใช่
    # Q16_5 History of Diagnosis Endocrine System Disease    ไม่ใช่
    # Q16_6 History of Diagnosis Musculoskeletal Diseases    ไม่ใช่
    # Q16_7 History of Diagnosis Tumors and Cysts    ไม่ใช่
    # Q16_8 History of Diagnosis Other Diseases    ไม่ใช่
    # Q17_1 Medical History Nervous System and Movement Symptoms    ไม่ใช่
    # Q17_2 Medical History Respiratory and Thoracic Symptoms    ไม่ใช่
    # Q17_3 Medical History Abdominal Symptoms    ไม่ใช่
    # Q17_4 Medical History Others    ไม่ใช่
    # Q17_5 Medical History Past 6 Month_1    ไม่ใช่
    # Q17_6 Medical History Past 6 Month_2    ไม่ใช่
    # Q18_A Health Check History_1    ไม่ใช่
    # Q18_B Health Check History_2    ไม่ใช่
    # # Q19_1 Health Attachment_History of Diagnosis Neuropathy    ไม่ใช่
    # # Q19_2 Health Attachment_History of Diagnosis Gastrointestinal Disease    ไม่ใช่
    # # Q19_3 Health Attachment_History of Diagnosis Urinary Tract Disease    ไม่ใช่
    # # Q19_4 Health Attachment_History of Diagnosis Musculoskeletal Disease    ไม่ใช่
    # # Q19_5 Health Attachment_History of Diagnosis Respiratory Disease    ไม่ใช่
    # Continue Spark
    # Switch To Pro Plus
    Select National Check Answer    ไม่มี
    Select Nationality Address Answer    ไม่เป็น
    Select Nationality Tax Answer    ไม่มี
    Select Nationality Status Answer    ไม่มี
    Confirm FATCA
    Go Next Page
    Input Place    ไทยประกันชีวิต
    Input Witness Name    ${dic}[Age]    นาย    ไม่จ่าย    เงิน    บิดา    นาง    จ่าย    เงิน
    Input Payment Name App Sign    ${dic}[Age]    นาย Rose Garden
    Save App Form
    # Set Global Variable    ${global_refno}    256600000303
    # Select Menu    AppForm
    # Open and Edit Appform UK By Ref    ${global_refno}
    Edit App Form Document    แบบสอบถามประเมินความเสี่ยง
    Select Financial Burden    มากกว่าร้อยละ 75 ของรายได้ทั้งหมด
    Select Financial Status    มีทรัพย์สินน้อยกว่าหนี้สิน
    Select Investment Problem    ไม่เกิน 1 ปี
    Select Investment Objective    เน้นเงินต้นต้องปลอดภัยและได้รับผลตอบแทนสม่ำเสมอแต่ตํ่าได้
    Select Investment Group    กลุ่มการลงทุนที่ 1
    Select High Risk Acception    กังวลและตื่นตระหนกกลัวขาดทุน
    Select Investment Fund Decrease Proportion    5% หรือน้อยกว่า
    Select Investment Fund Decrease Feeling    ตกใจ และต้องการขายการลงทุนที่เหลือทิ้ง
    Select Foreign Exchange Risk Acception    ไม่ได้
    Analyze Risk Profile
    Save Risk Profile
    Edit App Form Document    ใบคำร้องเกี่ยวกับเบี้ยประกันภัย
    Select Fund Allocation
    Select Investment Allocation    RPP
    Input Fund RPP    TMBMF    100
    Save Allocation
    Go Next Page app life premium
    Input Sign Place    TCRB    นาย    พยาน    โนหนึ่ง    นางสาว    พยาน    โนสอง
    Save App Life Premium
    Edit App Form Document    แบบฟอร์มการรับทราบความเสี่ยง
    Go To Sign Insurred Page
    Save Risk Form
    Edit App Form Document    แบบแสดงข้อมูลผู้ถือหน่วยลงทุน
    Select Investment Document    /    ${EMPTY}    ${EMPTY}    ${EMPTY}    ${EMPTY}
    Select Educational Background    ปริญญาตรีหรือเทียบเท่า
    Select Money Sources    เงินเดือน,เงินออม
    Select Financial Burden Amount    น้อยกว่า 1 ล้านบาท
    Go To Investment Info
    Select Investment Objectives    /    ${EMPTY}    /    ${EMPTY}    ${EMPTY}
    Input Approximate Net Assets    5000000
    Select Expect Fund    น้อยกว่า 1 ล้านบาท
    Select Investment Experiences    /    /    /    ${EMPTY}    ${EMPTY}    ${EMPTY}
    ...    ${EMPTY}
    Select Interested Mutual Fund    /    ${EMPTY}    ${EMPTY}    /    /    ${EMPTY}
    ...    ${EMPTY}
    Select Controlling Person    ตนเอง
    Go To Investment Info
    Save Investment Info
    Select Menu    Home
    Select Menu    AppForm
    Get Appform No
    Log Many    ${global_refno}    ${global_appform}
    Connect To MySQL
    Input Data To Database    ${pk}    ${ar_table_name}    Refno_${ar_environment}    ${global_refno}
    Input Data To Database    ${pk}    ${ar_table_name}    Appformno_${ar_environment}    ${global_refno}
    Disconnect From Database
    [Teardown]    Keywords For Teardown

Y02_UK_test_template
    [Tags]    uktest
    ${citizen_id}    Generate Citizen Id
    ${telno}    Generate TelNo
    Get Table Data    ${ar_table_name}    dic    ${pk}
    Set Global Variable    ${isCIMB}    ${False}
    Set Global Variable    ${isGIO}    ${False}
    Open TLProPlus Website
    Login TLProPlus    19210690    Aa12345678
    Select Tab and SubTab    InsuranceWithInvestment    UnitLink
    Input Firstname And Lastname    เดฟไอโอนิค    ยูเค
    ${day}    ${month}    ${year}    Convert Age to Birthdate    ${dic}[Age]
    Select Birthdate    ${day}    ${month}    ${year}
    Select Prefix    ${dic}[Sex]
    Select Occupation Class    ${dic}[Occl]
    Select Occupation And Job Description Auto    ${dic}[Occl]
    Input Citizen ID And Phone Number    ${citizen_id}    ${telno}
    Select Investment    ${dic}[Investment]    ${dic}[Investment2]    ${dic}[Investment3]    ${dic}[Investment4]
    Select Insurance Plan UK    ${dic}[PlanType]
    Select Mode UK    ${dic}[Mode]
    Input RPP    ${dic}[Premium]
    Input Insurance RPP    ${dic}[Insured]
    Select AC1    ${dic}[Ac01]    ${dic}[PremiumAc01]
    Select KG1    ${dic}[Kg01]    ${dic}[PremiumKg01]
    Select AC2    ${dic}[Ac02]    ${dic}[PremiumAc02]
    Select KG2    ${dic}[Kg02]    ${dic}[PremiumKg02]
    Select AC3    ${dic}[Ac03]    ${dic}[PremiumAc03]
    Select RP    ${dic}[RP]    ${dic}[PremiumRP]
    Select RPG    ${dic}[HCG]    ${dic}[PremiumHCG]
    Select SR2    ${dic}[SR2]    ${dic}[PremiumSR2]
    Select MultiPay    ${dic}[D11]    ${dic}[PremiumD11]
    Select SPGPlus    ${dic}[SPGP]    ${dic}[PremiumSPGP]
    Select OP3    ${dic}[OP3]    ${dic}[PremiumOP3]
    # Select Health Fit Multipay    ${dic}[C21]    ${dic}[PremiumC21]
    Select TR    ${dic}[D0102]    ${dic}[InsuranceD0102]    ${dic}[PremiumD0102]
    Select Health Fit 99    ${dic}[H99]    ${dic}[PremiumH99]
    Select Health Fit 99 Refund Plus    ${dic}[S99]    ${dic}[PremiumS99]
    Select VIP Deductible    ${dic}[VIP]    ${dic}[PremiumVIP]
    Select Health Fit DD    ${dic}[HDD]    ${dic}[PremiumHDD]
    Select Health Fit Ultra    ${dic}[HFU]    ${dic}[PremiumHFU]
    Select OP4    ${dic}[OP4]    ${dic}[PremiumOP4]
    Save Quotation Form
    # Open PDF Quotation Page
    # Request ref number UK
    # Add Signature UK
    # Create App Form
    # Get Reference Number UK
    # Edit App Form Document    ใบคำขอเอาประกันภัย
    # Input Height And Weight    175    89
    # Select Nationality    ไทย
    # Input Email    romfa.tac@thailife.com
    # Select Identify    บัตรประชาชน
    # Input Identify Data    บัตรประชาชน    ${citizen_id}    ตลอดชีพ
    # Select Marital Status    โสด
    # Fill House Registration House Number    12345
    # Fill and Choose House Registration Province    ชลบุรี
    # Fill Current House Number    12345
    # Fill and Choose Current Province    น่าน
    # Fill Workplace House Number    12345
    # Fill and Choose Workplace Province    ประจวบคีรีขันธ์
    # Select Contact Address    ทะเบียนบ้าน
    # Input Annual Salary    600000
    # Go Next Page
    # Select Tax Reduce    ไม่มีความประสงค์
    # Select Relation And Input Payment Name    มารดา     นาง    ผู้ชำระ    เงิน
    # Select Payment birthdate    2535    3    1
    # Input Payment ID    1506523636635
    # Go Next Page
    # Fill Beneficiary Information    1    ผู้เอาประกัน    ${dic}[Age]    Permanent    100
    # Go Next Page
    # Select Other Insurance Answer    ไม่มี
    # Select Insurance Reject Answer    ไม่เคย
    # Go Next Page
    # Switch Page To Spark
    # Q10 Is Related With Drug Trafficking    ไม่ใช่
    # Q11 Use Or Have Ever Use Drug    ไม่ใช่
    # Q12 Drink Or Have Ever Had Alcohol on a Regular Basis    ไม่ใช่
    # Q13 Smoke Or Have Ever Smoked    ไม่ใช่
    # Q14 Weight Changed In The Past 6 Months    ไม่ใช่
    # Q15_1 Family Health History    ไม่ใช่
    # Q16_1 History of Diagnosis Neuropathy    ไม่ใช่
    # Q16_2 History of Diagnosis Respiratory Disease    ไม่ใช่
    # Q16_3 History of Diagnosis Cardiovascular Disease    ไม่ใช่
    # Q16_4 History of Diagnosis Gastrointestinal Disease    ไม่ใช่
    # Q16_5 History of Diagnosis Endocrine System Disease    ไม่ใช่
    # Q16_6 History of Diagnosis Musculoskeletal Diseases    ไม่ใช่
    # Q16_7 History of Diagnosis Tumors and Cysts    ไม่ใช่
    # Q16_8 History of Diagnosis Other Diseases    ไม่ใช่
    # Q17_1 Medical History Nervous System and Movement Symptoms    ไม่ใช่
    # Q17_2 Medical History Respiratory and Thoracic Symptoms    ไม่ใช่
    # Q17_3 Medical History Abdominal Symptoms    ไม่ใช่
    # Q17_4 Medical History Others    ไม่ใช่
    # Q17_5 Medical History Past 6 Month_1    ไม่ใช่
    # Q17_6 Medical History Past 6 Month_2    ไม่ใช่
    # Q18_A Health Check History_1    ไม่ใช่
    # Q18_B Health Check History_2    ไม่ใช่
    # # Q19_1 Health Attachment_History of Diagnosis Neuropathy    ไม่ใช่
    # # Q19_2 Health Attachment_History of Diagnosis Gastrointestinal Disease    ไม่ใช่
    # # Q19_3 Health Attachment_History of Diagnosis Urinary Tract Disease    ไม่ใช่
    # # Q19_4 Health Attachment_History of Diagnosis Musculoskeletal Disease    ไม่ใช่
    # # Q19_5 Health Attachment_History of Diagnosis Respiratory Disease    ไม่ใช่
    # Continue Spark
    # Switch To Pro Plus
    # Select National Check Answer    ไม่มี
    # Select Nationality Address Answer    ไม่เป็น
    # Select Nationality Tax Answer    ไม่มี
    # Select Nationality Status Answer    ไม่มี
    # Confirm FATCA
    # Go Next Page
    # Input Place    ไทยประกันชีวิต
    # Input Witness Name    ${dic}[Age]    นาย    ไม่จ่าย    เงิน    บิดา    นาง    จ่าย    เงิน
    # Input Payment Name App Sign    ${dic}[Age]    นาย Rose Garden
    # Save App Form
    # # Set Global Variable    ${global_refno}    256600000303
    # # Select Menu    AppForm
    # # Open and Edit Appform UK By Ref    ${global_refno}
    # Edit App Form Document    แบบสอบถามประเมินความเสี่ยง
    # Select Financial Burden    มากกว่าร้อยละ 75 ของรายได้ทั้งหมด
    # Select Financial Status    มีทรัพย์สินน้อยกว่าหนี้สิน
    # Select Investment Problem    ไม่เกิน 1 ปี
    # Select Investment Objective    เน้นเงินต้นต้องปลอดภัยและได้รับผลตอบแทนสม่ำเสมอแต่ตํ่าได้
    # Select Investment Group    กลุ่มการลงทุนที่ 1
    # Select High Risk Acception    กังวลและตื่นตระหนกกลัวขาดทุน
    # Select Investment Fund Decrease Proportion    5% หรือน้อยกว่า
    # Select Investment Fund Decrease Feeling    ตกใจ และต้องการขายการลงทุนที่เหลือทิ้ง
    # Select Foreign Exchange Risk Acception    ไม่ได้
    # Analyze Risk Profile
    # Save Risk Profile
    # Edit App Form Document    ใบคำร้องเกี่ยวกับเบี้ยประกันภัย
    # Select Fund Allocation
    # Select Investment Allocation    RPP
    # Input Fund RPP    TMBMF    100
    # Save Allocation
    # Go Next Page app life premium
    # Input Sign Place    TCRB    นาย    พยาน    โนหนึ่ง    นางสาว    พยาน    โนสอง
    # Save App Life Premium
    # Edit App Form Document    แบบฟอร์มการรับทราบความเสี่ยง
    # Go To Sign Insurred Page
    # Save Risk Form
    # Edit App Form Document    แบบแสดงข้อมูลผู้ถือหน่วยลงทุน
    # Select Investment Document    /    ${EMPTY}    ${EMPTY}    ${EMPTY}    ${EMPTY}
    # Select Educational Background    ปริญญาตรีหรือเทียบเท่า
    # Select Money Sources    เงินเดือน,เงินออม
    # Select Financial Burden Amount    น้อยกว่า 1 ล้านบาท
    # Go To Investment Info
    # Select Investment Objectives    /    ${EMPTY}    /    ${EMPTY}    ${EMPTY}
    # Input Approximate Net Assets    5000000
    # Select Expect Fund    น้อยกว่า 1 ล้านบาท
    # Select Investment Experiences    /    /    /    ${EMPTY}    ${EMPTY}    ${EMPTY}
    # ...    ${EMPTY}
    # Select Interested Mutual Fund    /    ${EMPTY}    ${EMPTY}    /    /    ${EMPTY}
    # ...    ${EMPTY}
    # Select Controlling Person    ตนเอง
    # Go To Investment Info
    # Save Investment Info
    # Select Menu    Home
    # Select Menu    AppForm
    # Get Appform No
    # Log Many    ${global_refno}    ${global_appform}
    # Connect To MySQL
    # Input Data To Database    ${pk}    ${ar_table_name}    Refno_${ar_environment}    ${global_refno}
    # Input Data To Database    ${pk}    ${ar_table_name}    Appformno_${ar_environment}    ${global_refno}
    # Disconnect From Database
    [Teardown]    Keywords For Teardown