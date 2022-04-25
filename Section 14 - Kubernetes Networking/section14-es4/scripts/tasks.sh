curl -X POST \
    http://192.168.49.2:31659/tasks \
   -H 'Content-Type: application/json' \
   -H 'Authorization: Bearer abc' \
   -d '{"title":"TITLE","text":"TEXT"}'

curl -X GET \
    http://192.168.49.2:31659/tasks \
   -H 'Content-Type: application/json' \
   -H 'Authorization: Bearer abc' \
 