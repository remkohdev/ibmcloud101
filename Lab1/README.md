# Lab1 - Get Started using IBM Watson APIs

1. Login to IBM Cloud, for instructions see [Lab0](../Lab0/README.md),

2. Browse the IBM Cloud Catalog, 

    * Go to the [Catalog](https://cloud.ibm.com/catalog),
    * Filter the list of services by selecting the [AI](https://cloud.ibm.com/catalog?category=ai) category in the left menu of Categories,
    * You will see a list of services related to AI computing, among them IBM Watson services, to only name a few:
        * [Watson Assistant](https://cloud.ibm.com/catalog/services/watson-assistant), to build a chatbot,
        * [Language Translator](https://cloud.ibm.com/catalog/services/language-translator), 
        * [Speech-to-Text](https://cloud.ibm.com/catalog/services/speech-to-text) and [Text-to-Speech](https://cloud.ibm.com/catalog/services/text-to-speech),
        * [Tone Analyzer](https://cloud.ibm.com/catalog/services/tone-analyzer),
        * [Visual Recognition](https://cloud.ibm.com/catalog/services/visual-recognition),
    * If you enter a search criterium of `Watson` you will see a few more services like Watson starter services, 

3. Create an IBM Watson API Service,

    * Go to the [Catalog](https://cloud.ibm.com/catalog), and find the [Visual Recognition](https://cloud.ibm.com/catalog/services/visual-recognition) service,
    * Click the [Visual Recognition](https://cloud.ibm.com/catalog/services/visual-recognition) panel to create a service to analyze images,
    * Configure the Visual Recognition service,
        * Service name: `visualrecognition-101`,
        * Choose your location, e.g. `Dallas`,
        * Select a resource group: `default`,
    * Note in the left side of the page links to the documentatin for the Visual Recognition service,
    * Click the `Create` button,
    * You are forwarded to the `Getting Started` page of the service management section,
        * Review the `Getting Started` information,
    * Click the `Manage` link in the left column,
    * The `Manage` page and the `Service credentials` page both give access to the service credentials, in this case you can authenticate using an API Key,
    * You also see a link to the [Getting started tutorial](https://cloud.ibm.com/docs/services/visual-recognition?topic=visual-recognition-getting-started-tutorial#getting-started-tutorial) in the IBM Cloud Docs, and to the [API reference](https://cloud.ibm.com/apidocs/visual-recognition),
    * Copy the API Key value so we can use it in the next step,

4. Call the Visual Recognition API,

    * Using an example image and the commandline tool [curl](https://curl.haxx.se/), replace the {apikey} with your API Key copied in the previous step, and run the following curl command,

        ```
        curl -u "apikey:{apikey}" "https://gateway.watsonplatform.net/visual-recognition/api/v3/classify?url=https://upload.wikimedia.org/wikipedia/commons/d/d1/Spaghetti_with_Meatballs_%28cropped%29.jpg&version=2018-03-19"
        ```

    * In this example we called the `classify` endpoint to `classify an image` against the 'default' classifier. Looking at the [classify an image](https://cloud.ibm.com/apidocs/visual-recognition#classify-an-image) documentatin in the API Reference, the `default` classifier returns classes from thousands of general tags. The API has the following built-in classifiers: 
        1. default,
        2. food,
        3. explicit.

    * 