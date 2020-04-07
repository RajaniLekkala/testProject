*** Settings ***
Documentation  This is some basic info about the whole test suite of infotiv rental car webpage
Resource       ../Resources/keywords.robot
Library        SeleniumLibrary
Library        DateTime

Test Setup     Begin Web Test
Test Teardown  End Web Test


*** Test Cases ***
User Can Access Infotiv Home Page
    [Documentation]  This is to access the infotiv home page
    [Tags]           Test_HomePage
    Verify Header Of The Home Page
    Verify Title Of Home Page
    Verify Home Tab Is Clickable


User Can Check The Tabs Present In The Header Of Home Page
    [Documentation]  This is to check the tabs of the home page
    [Tags]           Test_HomePageTabs
    Verify Home Tab Is Clickable
    Verify Counter Tab Is Clickable
    Verify Fetch Data Tab Is Clickable


User Can Check The Current Count Is Increasing Or Not in Counter Page
    [Documentation]  This is to check whether the current count is increasing or not when user clicks on the Increment button
    [Tags]           Test_Count
    Verify Current Count Is Increasing Or Not When Clicking Increment Button


#Test Whether The Data Is Fetching From Server
    #[Documentation]  This is to check whether the data is fetched from server or not
    #[Tags]           Test_FetchData
   # Verify The Data Is Fetching From Server Or Not