*** Settings ***
Library     SeleniumLibrary
Library     DateTime

*** Variables ***
${BROWSER} =  chrome
${URL} =  http://localhost:61933/


*** Keywords ***
Begin Web Test
    Open Browser                about:blank   ${BROWSER}
    Maximize Browser Window
    Go To                       ${URL}


Verify Header Of The Home Page
    ${link_text} =  Get Text            xpath://*[@id="root"]/div/header/nav/div/a
    Should Be Equal   ${link_text}      MarysMajesticMovies


Verify Title Of Home Page
    ${link_text} =      Get Text             xpath://*[@id="root"]/div/div/div/h1
    Should Be Equal     ${link_text}         Hello, world!


Verify Home Tab Is Clickable
    Click Element       xpath://*[@id="root"]/div/header/nav/div/div/ul/li[1]/a
    ${link_text} =      Get Text           //*[@id="root"]/div/div/div/p[1]
    Should Be Equal     ${link_text}       Welcome to your new single-page application, built with:


Verify Counter Tab Is Clickable
    Click Element       xpath://*[@id="root"]/div/header/nav/div/div/ul/li[2]/a
    ${link_text} =      Get Text          //*[@id="root"]/div/div/div/p[1]
    Should Be Equal     ${link_text}      This is a simple example of a React component.


Verify Fetch Data Tab Is Clickable
    Click Element       xpath://*[@id="root"]/div/header/nav/div/div/ul/li[3]/a
    ${link_text} =      Get Text      xpath://*[@id="tabelLabel"]
    Should Be Equal     ${link_text}    Weather forecast


Verify Current Count Is Increasing Or Not When Clicking Increment Button
    Click Element       xpath://*[@id="root"]/div/header/nav/div/div/ul/li[2]/a
    Click Element       xpath://*[@id="root"]/div/div/div/button
    ${link_text} =      Get Text    xpath://*[@id="root"]/div/div/div/p[2]/strong
    Should Be True      '${link_text}' >= '1'


Verify The Data Is Fetching From Server Or Not
    Click Element                   xpath://*[@id="root"]/div/header/nav/div/div/ul/li[3]/a
    Table Column Should Contain     xpath://*[@id="root"]/div/div/div/table     1       2020-04-08T14:11:28.6316626+02:00
    Table Column Should Contain     xpath://*[@id="root"]/div/div/div/table     2       7
    Table Column Should Contain     xpath://*[@id="root"]/div/div/div/table     4       Chilly


End Web Test
    Close Browser