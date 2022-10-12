# Automate-Gitlab-CI-CD-to-deploy-Terraform-Configurations-in-AWS
![cicd](https://user-images.githubusercontent.com/115148205/195254235-19bce57f-7676-4d3c-b49e-fa23d2bccfa1.png)

What you will need to complete this lab?
Basic knowledge of how to build a YAML file
Terraform
AWS
CI/CD Processes
Gitlab (free account)
* Hint: when creating your free account you import your repositories hosted in your GitHub account.

# What is Gitlab?
GitLab is an open-source end-to-end software development platform with built-in version control, issue tracking, code review, CI/CD, and more. Self-host GitLab on your own servers, in a container, or on a cloud provider.

# Github vs. Gitlab
See the below link on Gitlabs’ organization page about the difference between the two. https://about.gitlab.com/devops-tools/github-vs-gitlab/.
Gitlab has some vibrant features that assist developers and the CI/CD process on one single platform whereas Github is more “available” and more widely used. Gitlab has secret detection where in some cases you can deploy the code if secrets exist in your code protecting you from security vulnerabilities. I found that out by trial and error 😂.
In this lab, you can use any existing terraform code you may have. We won’t be focusing on the intricacies of Terraform in the lab but more on the CI/CD process that Gitlab provides that can enhance your organization’s code, container, and package repositories. Below I will provide the link to my public repository where my custom vpc code for this presentation will reside. Feel free to copy, paste, and change the code to your liking:
Navigate to Gitlab.com, create your account, and create a repository to host your code in.

We will start inside of my/your repository… let’s get started.
<img width="903" alt="gitlab" src="https://user-images.githubusercontent.com/115148205/195268326-cb8a88c7-b08e-4345-95fc-980f40107b0a.PNG">

I have labeled a few things on the above screenshot I would like to point out before we proceed.

Two green arrows: Cloning. This is where you can clone this repository into your local/dev environment using either SSH or HTTPS.

The + at the top of the screen where you can create new projects/snippets/repositories and more.

Two red boxes: Master. This is where your branch(es) are located. Remember best CI/CD practice is to not push anything to the master branch until it has been tested and ready for production. Code should only end up in the master branch as the result of approved code from your senior member or manager as the result of a merge request.

.gitlab-ci.yml file — this file has to be in the branch where you want to eventually run your CI/CD pipeline. This file essentially creates that pipeline and Gitlab have several template files based on the provider that you want to provision infrastructure to.



