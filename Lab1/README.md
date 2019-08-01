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

    * You can also train your own classifier using the custom `/classifiers` endpoints, but that is beyond the scope of this IBM Cloud 101.

5. Using the [Watson SDKs](https://cloud.ibm.com/docs/services/watson?topic=watson-using-sdks),

    * You can use the API Reference to determine how you have to call the APIs from the client and use your favorite native language or tools. 
    * If you prefer however, you can also use the Watson SDKs that offer utility code to manage your client requests. 
    * Go to the [Watson SDKs](https://cloud.ibm.com/docs/services/watson?topic=watson-using-sdks) docs and download the language SDK of your choice,

6. Using the Java SDK,

    * [Install Appsody](https://appsody.dev/docs/getting-started/installation),
    * Check the available stacks in Appsody,

        ```console
        $ appsody list
        NAME             	VERSION	DESCRIPTION                              
        swift            	0.1.0  	Swift runtime                            
        java-microprofile	0.2.3  	Microprofile using AdoptOpenJDK and Maven
        java-spring-boot2	0.3.2  	Spring Boot using IBM Java SDK and Maven 
        nodejs           	0.2.2  	Node.js Runtime                          
        nodejs-express   	0.2.2  	Express web framework for Node.js
        ```
    
    * Create a Spring Boot application named `spring-watson`,

        ```console
        $ mkdir spring-watson
        $ cd spring-watson
        $ appsody init java-spring-boot2

        Running appsody init...
        Downloading java-spring-boot2 template project from https://github.com/appsody/stacks/releases/download/java-spring-boot2-v0.3.2/incubator.java-spring-boot2.templates.default.tar.gz
        Download complete. Extracting files from java-spring-boot2.tar.gz
        Setting up the development environment
        Running command: docker[pull appsody/java-spring-boot2:0.3]
        Running command: docker[run --rm --entrypoint /bin/bash appsody/java-spring-boot2:0.3 -c find /project -type f -name .appsody-init.sh]
        Extracting project from development environment
        Running command: docker[create --name spring-watson-extract -v /Users/user1/dev/src/spring-watson/.:/project/user-app -v /Users/user1/.m2/repository:/mvn/repository appsody/java-spring-boot2:0.3]
        Running command: docker[cp spring-watson-extract:/project /Users/user1/.appsody/extract/spring-watson]
        Running command: docker[rm spring-watson-extract -f]
        Project extracted to /Users/user1/dev/src/github/temp/spring-watson/.appsody_init
        Running command: ./.appsody-init.sh[]
        Successfully initialized Appsody project
        ```

    * Run the Spring Boot application,

        ```console
        $ appsody run
        ```

        * Open a new browser window and open the web application at http://localhost:8080/


    * Create a [Watson Language Translator](https://cloud.ibm.com/catalog/services/language-translator) service, name the service `languagetranslator-101`, and click the `Create` button,
    * Import or open the `spring-watson` project in your favorite Java IDE,
    * Create a new Class `application/TranslatorEndpoint.java`,

        ```console
        $ vi src/main/java/application/TranslatorEndpoint.java

        package application;

        import org.springframework.stereotype.Component;
        import org.springframework.boot.actuate.endpoint.annotation.Endpoint;
        import org.springframework.boot.actuate.endpoint.annotation.ReadOperation;
        import org.springframework.web.bind.annotation.RequestParam;

        @Endpoint(id = "language-translator")
        @Component
        public class TranslatorEndpoint {
            
            @ReadOperation
            public String translate(@RequestParam String text){
                return "Ola" ;
            }
            
        }

        :wq
        ```

    * Add an expose the new endpoint `language-translator` to the Spring properties file `src/main/resources/application.properties`,

        ```console
        $ vi src/main/resources/application.properties

        management.endpoints.web.exposure.include=health,metrics,prometheus,liveness,language-translator

        :wq
        ```

    * Open a browser and view the exposed endpoints at `http://localhost:8080/actuator/`,
    * Try the new endpoint,

        ```console
        $ curl -X GET 'http://localhost:8080/actuator/language-translator/translate?text=no%20matter%20what%20you%20say'
        Ola
        ```

    * Now we can add the actual Java code using the Watson SDK to call the Watson Language Translator API,
    * Add a dependency for `ibm-watson` to the Maven build file `pom.xml`,

        ```console
        $ vi pom.xml

        <?xml version="1.0" encoding="UTF-8"?>
        <project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
        xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
        <modelVersion>4.0.0</modelVersion>
        <parent><!--required parent POM-->
            <groupId>dev.appsody</groupId>
            <artifactId>spring-boot2-stack</artifactId>
            <version>0.3.2</version>
            <relativePath/>
        </parent>
        <groupId>dev.appsody</groupId>
        <artifactId>application</artifactId>
        <version>0.0.1-SNAPSHOT</version>
        <packaging>jar</packaging>
        <!-- versions will come from the parent pom (and included bom):
            mvn dependency:tree
            mvn dependency:display-ancestors
            mvn help:effective-pom | grep '\.version>'
            -->
        <dependencies>
            <!-- From parent:
            org.springframework.boot:spring-boot-starter
            org.springframework.boot:spring-boot-starter-actuator
            org.springframework.boot:spring-boot-starter-test
            -->
            <dependency>
                <groupId>org.springframework.boot</groupId>
                <artifactId>spring-boot-starter-web</artifactId>
            </dependency>
            <!--  All Watson Services -->
            <dependency>
                <groupId>com.ibm.watson</groupId>
                <artifactId>ibm-watson</artifactId>
                <version>7.3.0</version>
            </dependency>
        </dependencies>
        </project>

        :wq
        ```

    * Add the Watson SDK code and edit the Class `application/TranslatorEndpoint.java`, replacing `<your apikey>` by your API Key for the Watson Language Translator service,

        ```console
        $ vi src/main/java/application/TranslatorEndpoint.java

        package application;

        import org.springframework.stereotype.Component;
        import org.springframework.web.bind.annotation.RequestParam;

        import com.ibm.cloud.sdk.core.service.security.IamOptions;
        import com.ibm.watson.language_translator.v3.LanguageTranslator;
        import com.ibm.watson.language_translator.v3.model.TranslateOptions;
        import com.ibm.watson.language_translator.v3.model.TranslationResult;

        import org.springframework.boot.actuate.endpoint.annotation.Endpoint;
        import org.springframework.boot.actuate.endpoint.annotation.ReadOperation;

        @Endpoint(id = "language-translator")
        @Component
        public class TranslatorEndpoint {
            
            @ReadOperation
            public String translate(@RequestParam String text, @RequestParam String model){

                String[] languages = model.split("-");
                String source = languages[0];
                String target = languages[1];
                
                LanguageTranslator service = new LanguageTranslator("2018-05-01");
                IamOptions iamOptions = new IamOptions.Builder()
                .apiKey("<your apikey>")
                .build();
                service.setIamCredentials(iamOptions);

                TranslateOptions translateOptions = new TranslateOptions.Builder()
                .addText(text)
                .source(source)
                .target(target)
                .build();
                TranslationResult translationResult = service.translate(translateOptions).execute().getResult();
                
                return translationResult.toString();
            }
        }
        ```

    * Start the application again,

        ```console
        $ appsody run
        ```

    * Send a translation request to translate from English (en) to Dutch (nl) using the model `en-nl`,

        ```console
        $ curl -X GET 'http://localhost:8080/actuator/language-translator?text=no%20matter%20what%20you%20say&model=en-nl'
        {
        "word_count": 5,
        "character_count": 22,
        "translations": [
            {
            "translation": "Het maakt niet uit wat je zegt."
            }
        ]
        }
        ```
        
    * Send another translation request to translate from English (en) to Spanish (es) using the model `en-es`,

        ```console
        $ curl -X GET 'http://localhost:8080/actuator/language-translator?text=no%20matter%20what%20you%20say&model=en-es'
        {
        "word_count": 5,
        "character_count": 22,
        "translations": [
            {
            "translation": "no importa lo que diga"
            }
        ]
        }
        ```