<include a CircleCI status badge, here>

## Project Overview

In this project, you will apply the skills you have acquired in this course to operationalize a Machine Learning Microservice API. 

You are given a pre-trained, `sklearn` model that has been trained to predict housing prices in Boston according to several features, such as average rooms in a home and data about highway access, teacher-to-pupil ratios, and so on. You can read more about the data, which was initially taken from Kaggle, on [the data source site](https://www.kaggle.com/c/boston-housing). This project tests your ability to operationalize a Python flask app—in a provided file, `app.py`—that serves out predictions (inference) about housing prices through API calls. This project could be extended to any pre-trained machine learning model, such as those for image recognition and data labeling.

### Project Tasks

Your project goal is to operationalize this working, machine learning microservice using [kubernetes](https://kubernetes.io/), which is an open-source system for automating the management of containerized applications. In this project you will:
* Test your project code using linting
* Complete a Dockerfile to containerize this application
* Deploy your containerized application using Docker and make a prediction
* Improve the log statements in the source code for this application
* Configure Kubernetes and create a Kubernetes cluster
* Deploy a container using Kubernetes and make a prediction
* Upload a complete Github repo with CircleCI to indicate that your code has been tested

You can find a detailed [project rubric, here](https://review.udacity.com/#!/rubrics/2576/view).

**The final implementation of the project will showcase your abilities to operationalize production microservices.**

---

## Setup the Environment

* Create a virtualenv with Python 3.7 and activate it. Refer to this link for help on specifying the Python version in the virtualenv. 
```bash
python3 -m pip install --user virtualenv
# You should have Python 3.7 available in your host. 
# Check the Python path using `which python3`
# Use a command similar to this one:
python3 -m virtualenv --python=<path-to-Python3.7> .devops
source .devops/bin/activate
```
* Run `make install` to install the necessary dependencies

### Running `app.py`

1. Standalone:  `python app.py`
2. Run in Docker:  `./run_docker.sh`
3. Run in Kubernetes:  `./run_kubernetes.sh`

### Kubernetes Steps

* Setup and Configure Docker locally
* Setup and Configure Kubernetes locally
* Create Flask app in Container
* Run via kubectl

### Project Files and Details:
* Project folder contains files that are required to create docker container,kubernetes pod and all plugins required for installation. LEts take a look at the files,
    * app.py - its the main python application file.
    * Makefile - its a make file to be used for the project setup and running in the environment. ensure the Make is installed. if windows machine is used, please install using scoop.
    * Dockerfile - this is main docker file , has key information for creating ikage and running it.
    * requirement.txt - this is immportant file, given as input to Makefile. sometimes you may face issue with the plugins, so take a look at this and ensure that you have proper version of plugin relvant to python3.7.
    * run_docker.sh,run_kubernetes.sh - shell script to run docker and kubernetes command. the run kubernetes command might had to be run few times, as the pod creation will happen in background. Fetch the kubernetes pod running status, if the pod is running then execute run_kubernetes.sh again to make the port in listening pode. 
    * upload_docker.sh - the shell script is used to upload the docker image creating using run_docker.sh. when this is executed you will be prompted to enter password. Please loginto dockerhub to confirm the docker image is uploaded. This is important because the run_kubernetes script will pull the docker image from the dockerhub only.
    * make_prediction.sh - its a prediction input script, run it when the docker and kubernetes are running the app to get the output.
    * .circleci/config.yml - its the circle configuration file to support devops deployement.

### Executing the scripts:
* Ensure the project environment is setup correctly. Ensure python 3.7 is installed and the class path is set. in Windows use the following command in the project directory to create virtual environment and activate it.
    * py -m venv devops
    * Goto the devops/Scripts, then hit activate.bat
    * you should see the terminal and something like below can be  observed.
* Ensure the Makefile is updated with required details, if there are intendation error, Make will throw error. Once the issues are resolved on the termail where the local environment is enabled, hit "make install"
* Encure the Docker file is having the right details. Verify the port is exposed and it has the CMD command to run app.py file on startup. Once Docker file is completed run the command "make lint" to ensure no errors in the terminal.
* Ensure the run_docker.sh files has the proper details to create docker image with tag attribute and exposing the port as expected. run the file as ./run_docker.sh 
* run the make_prediction.sh to see the app is working and capture the output.Run the file as ./make_prediction.sh
* run the upload_docker.sh to upload the docker image create in previous step into Dockerhub. Please ensure the tag used in previous steps for docker image creaiton is mentioned in this upload script also. Ensure the correct username is given.Run the file as ./upload_docker.sh
* once you have minikube installed, open the termail and hit the command "minikube start", this will create a image in docker and minikube will start with a cluster.
* execute the run_kubernetes.sh with the command ./run_kubernetes.sh . This command will try creating a pod. Ensure thhat pod is running using the command "kubectl ged pod". Once the pod is in running state , run the run_kubernetes.sh command again to ensure pod is listenening to port. 





