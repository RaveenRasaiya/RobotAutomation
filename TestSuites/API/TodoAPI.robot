*** Settings ***
Library     RequestsLibrary
Library     Collections
Library     OS
Library     JSONLibrary

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

    ${contentTypeValue}=    Get From Dictionary  ${response.headers}  Content-Type

    Should Be Equal  ${contentTypeValue}  application/json; charset=utf-8


I want to create new post
    create session  mysession   ${BaseUrl}
    ${body}=    Create Dictionary  name=Raveen  email=test@gmail
    ${header}=  Create Dictionary  Content-Type=application/json
    ${response}=    post request    mysession   /posts  data=${body}    headers=${header} 
    ${responseCode}=    Convert To String  ${response.status_code}
    Should be equal     ${responseCode}     201
    Log To Console  ${response.status_code} 
    ${content}=     Convert to String   ${response.content} 
    Should Contain  ${content}  id  
   