*** Settings ***
Library           Selenium2Library

*** Test Cases ***
ATDD
    Open Firefox Browser    https://www.google.co.th/
    #Page Search Toy
    Select Age    id=SelectAge    3_to_5
    Select Gender    id=SelectGender    Female
    Click Web Element    id=Search
    Click Web Element    id=ToyId7
    Web Page Should Contain    43 Piece dinner Set
    Web Page Should Contain    Best Froends Forever Magnetic Dress Up
    Web Page Should Contain    Princess Palace
    Web Page Should Contain    Pricess Training Bicycle
    Web Page Should Contain    Sleeping Queens Board Game
    #Page Product Detail
    Select Quantity    id=DetailQuantity    5
    Calculate Product Total Price
    Click Web Element    id=ProcessToCheckout
    #Page Shipping
    Input Full Name    id=FullName    นายประธาน \ ด่านสกุลเจริญกิจ
    Input Address 1    id=Address1    เลขที่ 3 อาคารพร้อมพันธุ์ - ลาดพร้าว 3
    Input Address 2    id=Address2    ถนนลาดพร้าว แขวงจอมพล
    Input City    id=City    จตุจักร
    Input Province    id=Province    กรุงเทพ
    Input Post Code    id=PostCode    10900
    Click Web Element    id=DeliverBtn
    #Page Thank You
    Web Page Should Contain    7
    Web Page Should Contain    Best Froends Forever Magnetic Dress Up
    Web Page Should Contain    5
    Web Page Should Contain    124.75
    Web Page Should Contain    50
    Web Page Should Contain    174.75
    Web Page Should Contain    นายประธาน \ ด่านสกุลเจริญกิจ
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
