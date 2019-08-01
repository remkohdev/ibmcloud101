# IBM Watson

# Visual Recognition

# General
curl -X GET 'https://gateway.watsonplatform.net/visual-recognition/api/v3/classify?version=2018-03-19&url=https://upload.wikimedia.org/wikipedia/commons/d/d1/Spaghetti_with_Meatballs_%28cropped%29.jpg&classifier_ids=food&owner=IBM' -H 'Authorization: Basic YXBpa2V5Om4wb3hrTWVqNnc2VHFuQ09kS3lER0FnR0ZZTmJNMHBYNzE5cmxVem9QOGtC' -H 'Cache-Control: no-cache'

curl -X POST 'https://gateway.watsonplatform.net/visual-recognition/api/v3/classify?version=2018-03-19' -H 'Authorization: Basic YXBpa2V5Om4wb3hrTWVqNnc2VHFuQ09kS3lER0FnR0ZZTmJNMHBYNzE5cmxVem9QOGtC' -F threshold=0.6 -F owners=IBM -F classifier_ids=food -F 'images_file=@../../images/apis/spaghetti_with_meatballs.jpg' 

# Face
curl -X GET 'https://gateway.watsonplatform.net/visual-recognition/api/v3/detect_faces?version=2018-03-19&url=https://pbs.twimg.com/media/DLNtpwwXoAM9G_u.jpg' -H 'Authorization: Basic YXBpa2V5Om4wb3hrTWVqNnc2VHFuQ09kS3lER0FnR0ZZTmJNMHBYNzE5cmxVem9QOGtC'

curl -X POST 'https://gateway.watsonplatform.net/visual-recognition/api/v3/detect_faces?version=2018-03-19' -H 'Authorization: Basic YXBpa2V5Om4wb3hrTWVqNnc2VHFuQ09kS3lER0FnR0ZZTmJNMHBYNzE5cmxVem9QOGtC' -F 'images_file=@../../images/apis/developer-couch.jpg'

# Language Translator

# Translate
curl -X POST 'https://gateway.watsonplatform.net/language-translator/api/v3/translate?version=2018-05-01' -H 'Authorization: Basic YXBpa2V5OjBuT1ZiaGdtU0pveEtScjBwQ2l2amMwQzhzQ1J3YU5Mb0h2Tzc2Qjk0RXZM' -H 'Content-Type: application/json' -d '{"text":["Hello"],"model_id" : "en-es"}'

# Identification
curl -X POST 'https://gateway.watsonplatform.net/language-translator/api/v3/identify?version=2018-05-01' -H 'Authorization: Basic YXBpa2V5OjBuT1ZiaGdtU0pveEtScjBwQ2l2amMwQzhzQ1J3YU5Mb0h2Tzc2Qjk0RXZM' -H 'Content-Type: text/plain' -d 'Language translator translates text from one language to another'

curl -X POST 'https://gateway.watsonplatform.net/language-translator/api/v3/identify?version=2018-05-01' -H 'Authorization: Basic YXBpa2V5OjBuT1ZiaGdtU0pveEtScjBwQ2l2amMwQzhzQ1J3YU5Mb0h2Tzc2Qjk0RXZM' -H 'Content-Type: text/plain' -d 'Language translator translates text from one language to another'

# Documents
curl -X POST 'https://gateway.watsonplatform.net/language-translator/api/v3/documents?version=2018-05-01' -H 'Authorization: Basic YXBpa2V5OjBuT1ZiaGdtU0pveEtScjBwQ2l2amMwQzhzQ1J3YU5Mb0h2Tzc2Qjk0RXZM' -F file=@../../files/IBM-with-Red-Hat.pdf -F model_id=en-nl

curl -X GET 'https://gateway.watsonplatform.net/language-translator/api/v3/documents?version=2018-05-01' -H 'Authorization: Basic YXBpa2V5OjBuT1ZiaGdtU0pveEtScjBwQ2l2amMwQzhzQ1J3YU5Mb0h2Tzc2Qjk0RXZM'

curl -X GET 'https://gateway.watsonplatform.net/language-translator/api/v3/documents/7a24f52e-9fb3-4447-8e57-38b77d7486aa?version=2018-05-01' -H 'Authorization: Basic YXBpa2V5OjBuT1ZiaGdtU0pveEtScjBwQ2l2amMwQzhzQ1J3YU5Mb0h2Tzc2Qjk0RXZM' 

curl -X GET 'https://gateway.watsonplatform.net/language-translator/api/v3/documents/7a24f52e-9fb3-4447-8e57-38b77d7486aa?version=2018-05-01' -H 'Authorization: Basic YXBpa2V5OjBuT1ZiaGdtU0pveEtScjBwQ2l2amMwQzhzQ1J3YU5Mb0h2Tzc2Qjk0RXZM' --output IBM-with-Red-Hat-NL.pdf