*** Settings ***
Library  SeleniumLibrary
Library  RequestsLibrary
Library  DatabaseLibrary

Resource  variables.robot

*** Keywords ***
Verifier si user existe dans BD
    Connect To Database Using Custom Params  pymysql  database='demo', user='root',  password='', host='localhost'
    Row Count Is 0  select id from users where username= '${USERNAME}' and password = md5('${PASSWORD}')
Inscription utilisateur par une requete post
    Create Session  session1  ${WEBSITE_LINK}
    ${data}=  create Dictionary  username= ${USERNAME}  password=${PASSWORD}
    ${headers}=  create Dictionary  Content-Type=application/x-www-form-urlencoded
    ${response}=  POST On Session  session1  signup.php  data= ${data} headers=${headers}
    ${json}=  set Variable  {$response.json()}
    Log  ${json}
    Should Be Equal As Strings  ${response.status_code}  200
Verifier que user est ajouter dans la BD
    Connect To Database Using Custom Params  pymsql  database='demo', user='root',  password='', host='localhost'
    Row Count Is Equal To X  select id from users where username= '${USERNAME}' and password = md5('${PASSWORD}')  1