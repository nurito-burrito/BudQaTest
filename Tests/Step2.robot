*** Settings ***
Library           AppiumLibrary

*** Variables ***
${Appium Server}    http://localhost:4723/wd/hub
${searchBar}      id=search_plate
${clearSearchTag}    id=iv_tag_fake_remove_btn
${xButton}        id=Navigate up
${gotIt}          id=gotit
${searchIcon}     xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.ScrollView/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.LinearLayout[1]/android.widget.RelativeLayout[1]/android.widget.TextView
${searchTag}      id=com.shpock.android:id/tv_tag
${favIcon}        id=action_favorite
${applyButton}    id=com.shpock.android:id/btn_apply

*** Test Cases ***
Step 2

    [Documentation]
    ...    *TAP*: on ‘search’ option at the top of the app
    ...    *TAP*: clear (x) on the right side of the search input field
    ...    *TYPE*: the text ‘sofa’ into the search input field
    ...    *SELECT*: the ‘sofa bed’ from the suggested options
    ...    *VERIFY*: the search option
    ...    *TAP*: one of the displayed option
    ...    *IGNORE*: the popup is ‘ASK QUESTIONS’ if visible (Close)
    ...    *VERIFY*: the product selection is correct
    ...    *TAP*: on the favourite symbol at the top-right-side of the screen
    ...    *VERIFY*: the symbol is checked

    [Setup]    Start app

    Sleep            10s
    Click Element    ${xButton}
    Sleep            3s
    Click Button     index=1
    Sleep            3s
    Click Element    ${gotIt}
    Sleep            3s
    AppiumLibrary.Click A Point    x=1175    y=175
    Click Element    id=Clear query
    AppiumLibrary.Input Text    ${searchBar}    sofa
    Sleep            3s
    Click Element    xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.ScrollView/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.LinearLayout[1]/android.widget.RelativeLayout[2]/android.widget.TextView
    Element Text Should Be    ${searchTag}    "sofa bed"
    AppiumLibrary.Click Element At Coordinates    380    880
    AppiumLibrary.Click Element At Coordinates    350    850
    Click Element    ${gotIt}
    Click Element    ${gotIt}
    Click Element    ${favIcon}
    Click Element    ${xButton}
    AppiumLibrary.Page Should Contain Element    xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.RelativeLayout/android.widget.FrameLayout/android.view.ViewGroup/android.support.v7.widget.LinearLayoutCompat/android.widget.TextView[2]

    [Teardown]    Close Application


*** Keywords ***
Start app
    Open Application    ${Appium Server}    platformName=Android    platformVersion=9    deviceName=emulator-5554    app=C:\\Users/\Nurseda\\Desktop\\com.shpock.android.apk    automationName=appium
    ...    appPackage=com.shpock.android    appActivity=com.shpock.android.ui.tab.GappTabActivity
