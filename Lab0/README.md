# Lab0 - Setup

## Pre-requisites:
   
1. An IBM Cloud account,

2. Install the [IBM Cloud Developer Tools CLI](https://cloud.ibm.com/docs/cli?topic=cloud-cli-getting-started) on your localhost,

    ```console
    $ curl -sL https://ibm.biz/idt-installer | bash
    ```

    * This command will install the latest stand-alone `IBM Cloud CLI` plus the following tools:
        * Homebrew (Mac only),
        * Git,
        * Docker,
        * Helm,
        * kubectl,
        * curl,
        * IBM Cloud Developer Tools plug-in  (`ibmcloud dev`)
        * IBM Cloud Functions plug-in
        * IBM Cloud Object Storage plug-in
        * IBM Cloud Container Registry plug-in (`ibmcloud cr`)
        * IBM Cloud Kubernetes Service plug-in (`ibmcloud ks`)


3. Login to your IBM Cloud account,

    ```console
    $ ibmcloud login
    API endpoint: https://cloud.ibm.com
    Region: us-south

    Email> userone@email.com

    Password> 
    Authenticating...
    OK

    Select an account:
    1. USER ONE's Account (1ab2c3de456789fg01h23i4j5k6l78mn) <-> 1234567
    Enter a number> 1
    Targeted account USER ONE's Account (1ab2c3de456789fg01h23i4j5k6l78mn) <-> 1234567

                        
    API endpoint:      https://cloud.ibm.com   
    Region:            us-south   
    User:              userone@email.com   
    Account:           USER ONE's Account (1ab2c3de456789fg01h23i4j5k6l78mn) <-> 1234567   
    Resource group:    No resource group targeted, use 'ibmcloud target -g RESOURCE_GROUP'   
    CF API endpoint:      
    Org:                  
    Space:          
    ```

4.  [Optional] Assign a [Resource Group](https://cloud.ibm.com/docs/resources?topic=resources-rgs),

    * If you don't have a custom resource group, then use the `default`,

    ```console
    $ ibmcloud target -g default
    Targeted resource group default

    API endpoint:      https://cloud.ibm.com   
    Region:            us-south   
    User:              userone@email.com   
    Account:           USER ONE's Account (1ab2c3de456789fg01h23i4j5k6l78mn) <-> 1234567   
    Resource group:    default   
    CF API endpoint:      
    Org:                  
    Space:         
    ```

