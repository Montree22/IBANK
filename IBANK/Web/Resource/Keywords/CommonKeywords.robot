*** Settings ***
Library           OperatingSystem
Library           DateTime
Library           String
Library           Browser
Library    Collections
Resource          Login.robot
Resource          Quotation.robot

*** Variables ***
${window_fullscreen_size}       {'width': 1900, 'height': 1000}

*** Keywords ***
Open E-Selling Website
    Set Up Browser Fullscreen

    New Page    https://sit-partners-salestools.thailife.com/partnership-sales-tools-web/#/login
    # New Page    https://uat-partners-salestools.thailife.com/partnership-sales-tools-web/#/login
    # New Page    https://pre-partners-salestools.thailife.com/partnership-sales-tools-web/#/login
    # New Page    https://partners-salestools.thailife.com/partnership-sales-tools-web/#/login

Set Up Browser Fullscreen
    [Documentation]
    ...    browser=chromium (Google Chrome, Microsoft Edge (since 2020), Opera)
    ...    browser=firefox (Mozilla Firefox)
    ...    browser=webkit (Apple Safari, Mail, AppStore on MacOS and iOS)
    [Tags]    keyword_action
    [Arguments]    ${browser}=chromium    ${headless}=${False}    ${ignore_ssl_certificate}=${False}    ${downloads_path}=${None}    ${browser_timeout_new_context}=90s
    Set Browser Timeout    ${browser_timeout_new_context}
    ${active_context}           Create List
    ${active_context_list}      Get Variable Value    $CONTEXT_LIST    ${active_context}
    ${active_context_length}    Get Length            ${active_context_list}
    IF    ${active_context_length} == 0
        New Browser    browser=${browser}    headless=${headless}    downloadsPath=${downloads_path}
        ${id_context}    New Context    acceptDownloads=${True}    ignoreHTTPSErrors=${ignore_ssl_certificate}    viewport=${window_fullscreen_size}
    ELSE
        ${id_context}    New Context    acceptDownloads=${True}    ignoreHTTPSErrors=${ignore_ssl_certificate}    viewport=${window_fullscreen_size}
    END
    Append To List    ${active_context_list}    ${id_context}
    Set Suite Variable    \${CONTEXT_LIST}    ${active_context_list}
    RETURN    ${id_context}

