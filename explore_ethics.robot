*** Settings ***
Library  QWeb
Library  OperatingSystem
Library  normalize_text.py
Suite Setup  OpenBrowser    about:blank    chrome
Suite Teardown    CloseAllBrowsers


*** Variables ***
@{reasons}  We foster a holistic view of being a human
...         We see our organisation as a community of human beings, not as a machine
...         Gofore is essentially a part of society, and we must care about it
...         We are not allowed to put any more strain on the environment than is necessary.


*** Test Cases ***
Verify Reasons to Exist
    Appstate  Gofore
    Download Code of Ethics
    Verify Reasons to Exist


*** Keywords ***
Appstate
    [Arguments]    ${state}
    RunKeywordIf   '${state}' == 'Gofore'  RunKeywords    GoTo    https://gofore.com    AND
    ...            VerifyText              Pioneering an ethical digital world          AND
    ...            ClickText               OK                                           AND
    ...            Return From Keyword
    Fail           Appstate ${state} does not exist!

Download Code of Ethics
    HoverText    About us
    ClickText    Code of Ethics
    SaveFile     Download    Gofore-CodeOfEthics-2020-WEB-pages.pdf

Verify Reasons to Exist
    UsePdf          Gofore-CodeOfEthics-2020-WEB-pages.pdf
    ${pdftext}=     GetPdfText
    Create File     pdfcontent.txt  ${pdftext}
    ${formattedpdftext}=  Normalize Text  ${pdftext}
    Create File     formattedpdfcontent.txt  ${formattedpdftext}
    UseFile         formattedpdfcontent.txt
    FOR  ${reason}  IN  @{reasons}
        VerifyFileText  ${reason}
    END
