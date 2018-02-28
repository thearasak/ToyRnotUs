*** Settings ***
Library           Selenium2Library

*** Variables ***
${URL}            ${EMPTY}
${General_TimeOut}    60

*** Test Cases ***
ATDD
    Open Firefox Browser    http://128.199.163.79:8080/ToyRnotUs/
    #Page Search Toy
    Search Select Age    SelectAge    3_to_5
    Search Select Gender    SelectGender    Female
    Click Web Element    id=SearchButton
    Comment    Web Page Should Contain    43 Piece dinner Set
    Comment    Web Page Should Contain    Best Froends Forever Magnetic Dress Up
    Comment    Web Page Should Contain    Princess Palace
    Comment    Web Page Should Contain    Pricess Training Bicycle
    Comment    Web Page Should Contain    Sleeping Queens Board Game
    Comment    Click Web Element    id=ToyId7
    Comment    #Page Product Detail
    Comment    Comment    Select Quantity    id=DetailQuantity    5
    Comment    Calculate Product Total Price
    Comment    Click Web Element    id=CheckOutBtn
    Comment    Comment    #Page Shipping
    Comment    Comment    Input Full Name    id=FullName    นายประธาน ด่านสกุลเจริญกิจ
    Comment    Comment    Input Address 1    id=Address1    เลขที่ 3 อาคารพร้อมพันธุ์ - ลาดพร้าว 3
    Comment    Comment    Input Address 2    id=Address2    ถนนลาดพร้าว แขวงจอมพล
    Comment    Comment    Input City    id=City    จตุจักร
    Comment    Comment    Input Province    id=Province    กรุงเทพ
    Comment    Comment    Input Post Code    id=PostCode    10900
    Comment    Comment    Click Web Element    id=DeliverBtn
    Comment    #Page Thank You
    Comment    Web Page Should Contain    7
    Comment    Web Page Should Contain    Best Froends Forever Magnetic Dress Up
    Comment    Web Page Should Contain    5
    Comment    Web Page Should Contain    124.75
    Comment    Web Page Should Contain    50
    Comment    Web Page Should Contain    174.75
    Comment    Web Page Should Contain    นายประธาน ด่านสกุลเจริญกิจ
    Comment    Web Page Should Contain    เลขที่ 3 อาคารพร้อมพันธุ์ - ลาดพร้าว 3
    Comment    Web Page Should Contain    ถนนลาดพร้าว แขวงจอมพล
    Comment    Web Page Should Contain    จตุจักร
    Comment    Web Page Should Contain    กรุงเทพ
    Comment    Web Page Should Contain    10900
    [Teardown]    Close Browser

*** Keywords ***
Click Web Element
    [Arguments]    ${Locator}    ${Timeout}=${General_TimeOut}
    ${result}    BuiltIn.Run Keyword And Return Status    Selenium2Library.Wait Until Element Is Visible    ${Locator}    ${Timeout}
    BuiltIn.Run Keyword If    '${result}'=='False'    Wait Web Until Page Contains Element    ${Locator}    ${Timeout}
    Selenium2Library.Click Element    ${Locator}

Search Select Age
    [Arguments]    ${Locator}    ${Value}
    Wait Element Visible    ${Locator}
    Selenium2Library.Select From List By Index    ${Locator}    ${Value}

Search Select Gender
    [Arguments]    ${Locator}    ${Value}
    Wait Element Visible    ${Locator}
    Selenium2Library.Select From List By Index    ${Locator}    ${Value}

Open Firefox Browser
    [Arguments]    ${Url}
    Open Browser    ${Url}
    Selenium2Library.Maximize Browser Window

Wait Element Visible
    [Arguments]    ${Locator}    ${Timeout}=${General_TimeOut}
    ${result}    BuiltIn.Run Keyword And Return Status    Selenium2Library.Wait Until Element Is Visible    ${Locator}    ${Timeout}
    BuiltIn.Run Keyword If    '${result}'=='False'    Wait Web Until Page Contains Element    ${Locator}    ${Timeout}

Select Search Toy

Select Quantity
    [Arguments]    ${Locator}    ${Value}
    Wait Element Visible    ${Locator}
    Selenium2Library.Select From List By Label    ${Locator}    ${Value}

Input Full Name
    [Arguments]    ${Locator}    ${Value}
    Wait Element Visible    ${Locator}
    Input Text    ${Locator}    ${Value}

Input Address 1
    [Arguments]    ${Locator}    ${Value}
    Wait Element Visible    ${Locator}
    Input Text    ${Locator}    ${Value}

Input Address 2
    [Arguments]    ${Locator}    ${Value}
    Wait Element Visible    ${Locator}
    Input Text    ${Locator}    ${Value}

Input City
    [Arguments]    ${Locator}    ${Value}
    Wait Element Visible    ${Locator}
    Input Text    ${Locator}    ${Value}

Input Province
    [Arguments]    ${Locator}    ${Value}
    Wait Element Visible    ${Locator}
    Input Text    ${Locator}    ${Value}

Input Post Code
    [Arguments]    ${Locator}    ${Value}
    Wait Element Visible    ${Locator}
    Input Text    ${Locator}    ${Value}

Web Page Should Contain
    [Arguments]    ${Text}
    Page Should Contain    ${Text}

Calculate Product Total Price
    ${Text}    Evaluate    (24.95*5)+50
    Web Page Should Contain    ${Text}
