#!/bin/bash


 echo "Choisissez votre personnage en tapant son ID"
while IFS=',' read -r id name X
do
   
    echo " $id $name"
done < players.csv    


token="eyJpZGVudGl0eSI6ImV5SnBaQ0k2TXpNeU5qTXNJbXh2WjJsdUlqb2lZMmhwYTJodlgya2lMQ0psYldGcGJDSTZJbU5vYVd0b2IxOXBRR1YwYm1FdFlXeDBaWEp1WVc1alpTNXVaWFFpTENKc2IyZGhjeUk2Wm1Gc2MyVXNJbWR5YjNWd2N5STZXeUp6ZEhWa1pXNTBJbDBzSW14dloybHVYMlJoZEdVaU9pSXlNREl4TFRBekxURXlJREE1T2pNMk9qSTRJbjA9Iiwic2lnbmF0dXJlIjoiV0pUWEhpakdySG91ZFk2aWVWSVZOUms3MmRaSFRlY29CVnRGVVVZUEpCOXR6SVdTUjA0R1pCV1dxSCs1VUFsVnNHa1RcL1VuTTZqSjhwajRmR01IMFdNcnNaMmlra1V3MUJDVXNkdzhLVGc3OTNFNHpBdzdsbzJ2VVU5cHBxV1hPakl5azZURFluT1AwY1BYckdiOW0yY3NaMVFab1pvM3RHM3hwcFpsM0czK0VNWnpPWjhDXC9QdUtHWnhuOXFNUTBDV3VKRmlvd1FcLzhheWpTVlJxbjJGNmd5SW5wcmIyNVQ0eml0RjgrSGxWVlJNaWg4RXNWSUU4ZTBoOHM3ZHJVTGZkcnRVR29UdWdmQ2NuQWM3OUd0cjh3UmZuRE0rSTNTMk52a011S0cyY1oxU0NtNmJFV2dwXC92T1N3ZXh5cVREK0dKXC9iUGE3MTY5dHdNOHEyRVFic25UQ0lwUnlYOXhyTzNIT2Uxbjcwb3RGczdpVlRTc1hwWlpxNHhpYk5Hc3Nobkp6aEpjd25Vc2V4WFRnMjJvQ3A0YjQrOWlTSmJSOXl2QUErM0tEdFloYjJSamc5aDhcL2o5REM2VWJ5MHNMcFFXb2VmelwveGhYd0hHQ3l4djNuUmJpdWp0b2tLWEl5Rzd1VEZcL2RhRjRBcEJuXC90WGE1TXlQN0pOWHBtODl3MGVSdkdWRVIrZGcwOWJrZVlnSkdtU21SVTQ5RHFFVjgyd0psMEdDYmFBUFpqYVo1TnJcLzFVR0RBenhSeTdta05UWHR1NlA0M1wvdUxUNHhKODdlVGJqVUpGK09ZSXZhWGEydjQ1NjJXMzNQVkgzVDdaNEkwWlBFRGNLSUpGWmR3V3FlWlFEN3ZXaWZwZTFrMjRWY1g2Q1RPaXF6aHgzYitkVTg3YU92UVZTSWhZTT0ifQ%3D%3D"

URL="https://modules-api.etna-alternance.net/7754/activities/42370/download/FDI-UNIX/025/project/The%20Hyrule%20Castle/public/csv/players.csv"

#wget --header "Cookie:authenticator=$token" $URL