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
Step 3

    [Documentation]
    ...    *Modify* ​STEP: 2​ to run iteratively three times. Each iteration must SET and VERIFY a new input:
    ...    The first iteration should search and verify ‘Bed’
    ...    The second iteration should search and verify ‘Sofa’
    ...    The third iteration should search and verify ‘Table’

    [Setup]    Start app

    Sleep                                   6s
    Click Element                           ${xButton}
    Sleep                                   3s
    Click Button                            index=1
    Sleep                                   3s
    Click Element                           ${gotIt}
    Sleep                                   3s
    AppiumLibrary.Click A Point             x=1175    y=175
    Sleep                                   3s
    AppiumLibrary.Input Text                ${searchBar}    bed
    Click Element                           ${searchIcon}
    AppiumLibrary.Click Element At Coordinates    380    880
    Element Text Should Be                  ${searchTag}    "bed"
    Click Element                           ${clearSearchTag}
    Sleep                                   3s
    AppiumLibrary.Click A Point             x=1175    y=175
    AppiumLibrary.Input Text                ${searchBar}    sofa
    Click Element                           ${searchIcon}
    AppiumLibrary.Click Element At Coordinates    380    880
    Element Text Should Be                  ${searchTag}    "sofa"
    Click Element                           ${clearSearchTag}
    Sleep                                   3s
    AppiumLibrary.Click A Point             x=1175    y=175
    AppiumLibrary.Input Text                ${searchBar}    table
    Click Element                           ${searchIcon}
    AppiumLibrary.Click Element At Coordinates    380    880
    Element Text Should Be                  ${searchTag}    "table"

   [Teardown]    Close Application

*** Keywords ***
Start app
    Open Application    ${Appium Server}    platformName=Android    platformVersion=9    deviceName=emulator-5554    app=C:\\Users/\Nurseda\\Desktop\\com.shpock.android.apk    automationName=appium
    ...    appPackage=com.shpock.android    appActivity=com.shpock.android.ui.tab.GappTabActivity
