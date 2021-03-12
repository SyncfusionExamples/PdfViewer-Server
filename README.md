# Overview:

The docker image (pdfviewer-server) contains Web APIs mandatory for PDF Viewer control such as opening, text selection, text search, and saving pdf documents. You can build your own docker file to add new functionality and customize the existing functionalities from the existing docker project using this repository. 

# Prerequisites 

Have ‘Docker’ installed in your environment: 

•	On Windows, install Docker for Windows. 

•	On macOS, install Docker for Mac. 


# Configure the PDF Viewer server-side service 
 
This PDF Viewer component uses a server-side backend (web service) to render the pages and extract the PDF contents. We have provided the server-side backend (web service) as a docker image to quickly get started with our PDF Viewer component. 
 
Step 1: Pull the pdfviewer-server image from Docker Hub. 

```sh
docker pull syncfusion/pdfviewer-server 
```

Note: PDF Viewer is a commercial product, and it requires a valid license to use it in a production environment (request license or trial key) 
 
Step 2: Create the docker-compose.yml file with the following code in your file system. 
  
```sh
version: '3.4'  
 
services:  
 pdfviewer-server: 
    image: syncfusion/pdfviewer-server:latest 
    environment:  
      #Provide your license key for activation 
       SYNCFUSION_LICENSE_KEY: YOUR_LICENSE_KEY 
    volumes:  
      -  C:\Docker\Data:/app/Data 
    ports: 
    - "6001:80" 
```

N> You should mention the folder path which contains pdf files in the volumes section of compose file. 
 
Step 3: In a terminal tab, navigate to the directory where you’ve placed the docker-compose.yml file and execute the following. 

```sh
docker-compose up 
```

Also, you can run the Docker container along with the license key using this docker run command. 

```sh
docker run -d -p 6001:80 –e SYNCFUSION_LICENSE_KEY=YOUR_LICENSE_KEY syncfusion/pdfviewer-server:latest 
```

For Ex: docker run -d -p 6001:80 –e SYNCFUSION_LICENSE_KEY=Mzg1ODMzQDMxMzgyZTM0MmUzMGdFRGJvUno1MUx4Tit4S09CeS9xRHZzZU4ySVBjQVFuT0VpdWpHUWJ6aXM9 syncfusion/pdfviewer-server:latest 
Now the PDF Viewer server Docker instance runs in the localhost with the provided port number http://localhost:6001. Open this link in the browser and navigate to the PDF Viewer Web API control http://localhost:6001/api/pdfviewer. It returns the default get method response. 
 
