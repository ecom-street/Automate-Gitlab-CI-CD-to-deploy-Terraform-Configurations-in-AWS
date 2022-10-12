# Automate Gitlab CI/CD to deploy Terraform Configurations in AWS

We are a preferred AWS consultant and offers the <a href="https://www.ecomstreet.com/aws-consulting-services-company/" target="_blank">best cloud AWS consulting service</a>. Our AWS-certified expert consultants conduct a thorough review and evaluation of your existing IT infrastructure and service interaction model to provide top-notch solutions.
<h3><a href="https://www.ecomstreet.com/aws-consulting-services-company/" target="_blank">Schedule your free consultation today!</a></h3> <br/>

![cicd](https://user-images.githubusercontent.com/115148205/195272372-aaa9f10f-a818-4317-b7dd-512d8e431860.png)

What you will need to complete this lab?

Basic knowledge of how to build a YAML file
Terraform
AWS
CI/CD Processes
Gitlab (free account)
* Hint: when creating your free account you import your repositories hosted in your GitHub account.
# What is Gitlab?
GitLab is an open-source end-to-end software development platform with built-in version control, issue tracking, code review, CI/CD, and more. Self-host GitLab on your own servers, in a container, or on a cloud provider
# Github vs. Gitlab
See the below link on Gitlabs’ organization page about the difference between the two. https://about.gitlab.com/devops-tools/github-vs-gitlab/.

Gitlab has some vibrant features that assist developers and the CI/CD process on one single platform whereas Github is more “available” and more widely used. Gitlab has secret detection where in some cases you can deploy the code if secrets exist in your code protecting you from security vulnerabilities. I found that out by trial and error 😂.

In this lab, you can use any existing terraform code you may have. We won’t be focusing on the intricacies of Terraform in the lab but more on the CI/CD process that Gitlab provides that can enhance your organization’s code, container, and package repositories. Below I will provide the link to my public repository where my custom vpc code for this presentation will reside. Feel free to copy, paste, and change the code to your liking:

Navigate to Gitlab.com, create your account, and create a repository to host your code in.

We will start inside of my/your repository… let’s get started.
<img width="903" alt="gitlab" src="https://user-images.githubusercontent.com/115148205/195275601-7ca5f6f8-06b7-4c12-8c52-f55d668ba32e.PNG">


I have labeled a few things on the above screenshot I would like to point out before we proceed.

Two green arrows: Cloning. This is where you can clone this repository into your local/dev environment using either SSH or HTTPS.

The + at the top of the screen where you can create new projects/snippets/repositories and more.

Two red boxes: Master. This is where your branch(es) are located. Remember best CI/CD practice is to not push anything to the master branch until it has been tested and ready for production. Code should only end up in the master branch as the result of approved code from your senior member or manager as the result of a merge request.

.gitlab-ci.yml file — this file has to be in the branch where you want to eventually run your CI/CD pipeline. This file essentially creates that pipeline and Gitlab have several template files based on the provider that you want to provision infrastructure to.
![image](https://user-images.githubusercontent.com/115148205/195287830-ab82f86c-5711-46fd-941f-5985418a9e32.png)

Notice how many template files Gitlab provides. While they would require a little modification many times it’s a great starting point. (You can find the above option by going to new file.

Blue box: Merge Requests. This is where you can submit a request to the admin, in this case in our personal accounts. Here you can merge branches.

Blue arrow: CI/CD processes. Here is where you can locate the Pipelines, Jobs, Schedules, and Test Cases. Today we will address the Pipeline.
<img width="330" alt="gl2" src="https://user-images.githubusercontent.com/115148205/195288268-9b10e56e-871b-435a-acdc-226b715391f7.PNG">

# .Gitlab-ci.yml file for Terraform.
In short, in this file, you will notice that the processes here are running in an official docker container under the official hashicorp image.
<img width="851" alt="GT4" src="https://user-images.githubusercontent.com/115148205/195320746-e7a97a1a-e7c1-42f8-a9bf-f1a95ab2ee33.PNG">
<img width="800" alt="GT5" src="https://user-images.githubusercontent.com/115148205/195321024-962429c0-12dd-4a21-9131-147d03e0d84e.PNG">
<img width="837" alt="GT6" src="https://user-images.githubusercontent.com/115148205/195321289-659c6e40-0d35-4d58-989b-60ed0bbff274.PNG">
<img width="794" alt="GT7" src="https://user-images.githubusercontent.com/115148205/195321689-f51cc766-5c61-4c0f-9950-041b66cba026.PNG">

The stages sections of the file are the “stages” you will see in just a few on the CI/CD pipeline.
<img width="559" alt="stage" src="https://user-images.githubusercontent.com/115148205/195322036-428b4086-c7b4-419b-8144-7ac9877f5699.PNG">

Validate: let us make sure that our terraform configurations file contains valid code and doesn’t have any functional or syntax errors by running -terraform validate. This stage will happen automatically due to not specifying a “when:” attribute that you will see in the apply and destroy stages which require a manual “approve” action.
Plan: Here we will test our code to see what it will deploy by running the -terraform plan command. This stage will happen automatically due to not specifying a “when:” attribute that you will see in the apply and destroy stages which require a manual “approve” action.

Apply: Here we will deploy terraform code to the AWS console where you can see the infrastructure being built. This stage contains the “when:” attribute block because in a production setup your manager will likely have to approve the code before deploying the resources to your specified cloud provider.
<img width="588" alt="apply1" src="https://user-images.githubusercontent.com/115148205/195322471-084f7938-7a40-4b0f-9888-70de972ee5ef.PNG">

Destroy: BRING THE ENTIRE CLOUD INFRASTRUCTURE DOWN. As you can imagine this is an extremely dangerous command to run in a production environment. Hence, here you will see the same attribute of “when:” and manual.

I also want to point out the “only:” attribute here that is set to -master. The pipeline will not run on any of the other branches with this option set to master. This denotes your master branch. Guess how I found out? Because I tried it in another branch and it did not work.
<img width="591" alt="destoy1" src="https://user-images.githubusercontent.com/115148205/195323251-55185d7a-fc45-4aa2-ad9b-dc62bea1c1ce.PNG">

Before we run our pipeline we have to set up environment variables with our AWS login, and Default region where we will provision this infrastructure. Go to setting on the left-hand bottom side of the repo menu pull your credentials from your AWS/Cloud account. Scroll down to Variables and enter in the information.

*Please make sure you do not host any credentials in any of your configuration files. Gitlab will fail your pipeline if they do exist.
<img width="946" alt="variable1" src="https://user-images.githubusercontent.com/115148205/195323773-64822f81-1ef0-453f-b264-4084b175d3fa.PNG">

Now let us navigate to the CI/CD tab on the left-hand side of your repo menu screen and select Pipelines. Once you arrive on the next screen select Run Pipeline. Again nothing will provision in your cloud account because of the manual setting we have in our .gitlab-ci.yml file, which requires us to click approve to spin up the infrastructure.

<img width="949" alt="run" src="https://user-images.githubusercontent.com/115148205/195326544-098d24f8-9051-48c0-bd36-f1d83b78fa3f.PNG">

You should see the Pipeline has started to run.

