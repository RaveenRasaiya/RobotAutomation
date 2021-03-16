*** Settings ***
Library     RequestsLibrary

*** Variables ***
${BaseUrl}  https://jsonplaceholder.typicode.com

*** Test Cases ***
I want to todo data from todo
    create session  mysession    ${BaseUrl}
    ${response}=    get request     mysession     /todos/1
    log to console  ${response.status_code}
    log to console  ${response.content}
    log to console  ${response.headers}

    #Validation    
    ${StatusCode}=  Convert To String  ${response.status_code}   
    Should Be Equal     ${StatusCode}  200