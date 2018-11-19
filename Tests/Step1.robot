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
Step 1

    [Documentation]
    ...    *LOAD*: the Shpock app on the device
    ...    *TAP*: on settings at the top-left-side of the app
    ...    *ADJUST*: ‘listed in the last’ 7 days
    ...    *TAP*: on ‘Sort by’
    ...    *ADJUST*: ‘Radius’ to 10 min
    ...    *TAP*: ‘APPLY’ button
    ...    *VERIFY*: the settings

    [Setup]    Start app

    Wait Until Page Contains Element    ${xButton}    timeout=10s    error=None
    AppiumLibrary.Click Element         ${xButton}
    Sleep                               3s
    AppiumLibrary.Click Button          index=1
    Sleep                               3s
    AppiumLibrary.Click Element         ${gotIt}
    Sleep                               3s
    AppiumLibrary.Click A Point         x=1350    y=175
    Sleep                               3s
    AppiumLibrary.Click A Point         x=775    y=500
    AppiumLibrary.Click A Point         x=635    y=1460
    AppiumLibrary.Click Element         ${applyButton}
    AppiumLibrary.Page Should Contain Element    com.shpock.android:id/bottom_navigation_item_my_shpock

    [Teardown]    Close Application


*** Keywords ***
Start app
    Open Application    ${Appium Server}    platformName=Android    platformVersion=9    deviceName=emulator-5554    app=C:\\Users/\Nurseda\\Desktop\\com.shpock.android.apk    automationName=appium
    ...    appPackage=com.shpock.android    appActivity=com.shpock.android.ui.tab.GappTabActivity
