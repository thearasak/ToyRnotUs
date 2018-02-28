*** Settings ***
Library           Selenium2Library

*** Variables ***
${URL}            ${EMPTY}

*** Test Cases ***
ATDD
    Open Firefox Browser    http://128.199.163.79:8080/ToyRnotUs/
    #Page Search Toy
    Select Age    name=SelectAge    3_to_5
    Select Gender    name=SelectGender    Female
    Click Web Element    id=SearchButton
    Web Page Should Contain    43 Piece dinner Set
    Web Page Should Contain    Best Froends Forever Magnetic Dress Up
    Web Page Should Contain    Princess Palace
    Web Page Should Contain    Pricess Training Bicycle
    Web Page Should Contain    Sleeping Queens Board Game
    Click Web Element    id=ToyId7
    #Page Product Detail
    Comment    Select Quantity    id=DetailQuantity    5
    Calculate Product Total Price
    Click Web Element    id=CheckOutBtn
    Comment    #Page Shipping
    Comment    Input Full Name    id=FullName    นายประธาน ด่านสกุลเจริญกิจ
    Comment    Input Address 1    id=Address1    เลขที่ 3 อาคารพร้อมพันธุ์ - ลาดพร้าว 3
    Comment    Input Address 2    id=Address2    ถนนลาดพร้าว แขวงจอมพล
    Comment    Input City    id=City    จตุจักร
    Comment    Input Province    id=Province    กรุงเทพ
    Comment    Input Post Code    id=PostCode    10900
    Comment    Click Web Element    id=DeliverBtn
    #Page Thank You
    Web Page Should Contain    7
    Web Page Should Contain    Best Froends Forever Magnetic Dress Up
    Web Page Should Contain    5
    Web Page Should Contain    124.75
    Web Page Should Contain    50
    Web Page Should Contain    174.75
    Web Page Should Contain    นายประธาน ด่านสกุลเจริญกิจ
    Web Page Should Contain    เลขที่ 3 อาคารพร้อมพันธุ์ - ลาดพร้าว 3
    Web Page Should Contain    ถนนลาดพร้าว แขวงจอมพล
    Web Page Should Contain    จตุจักร
    Web Page Should Contain    กรุงเทพ
    Web Page Should Contain    10900

*** Keywords ***
Click Web Element
    [Arguments]    ${Locator}    ${Timeout}=${General_TimeOut}
    ${result}    BuiltIn.Run Keyword And Return Status    Selenium2Library.Wait Until Element Is Visible    ${Locator}    ${Timeout}
    BuiltIn.Run Keyword If    '${result}'=='False'    Wait Web Until Page Contains Element    ${Locator}    ${Timeout}
    Selenium2Library.Click Element    ${Locator}

Select Age
    [Arguments]    ${Locator}    ${Value}
    Wait Element Visible    ${Locator}
    Selenium2Library.Select From List By Label    ${Locator}    ${Value}

Select Gender
    [Arguments]    ${Locator}    ${Value}
    Wait Element Visible    ${Locator}
    Selenium2Library.Select From List By Label    ${Locator}    ${Value}

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
