Task 3 : CI/CD with GitHub Actions
● Set up a GitHub repository for your sample application.
● Create a GitHub Actions workflow to build and test the application on every push.
● Implement a deployment workflow for automatically deploying to a staging environment.



# node-js-sample

A barebones Node.js app using [Express 4](http://expressjs.com/).

## Running Locally

Make sure you have [Node.js](http://nodejs.org/) and the [Heroku Toolbelt](https://toolbelt.heroku.com/) installed.

```sh
git clone git@github.com:heroku/node-js-sample.git # or clone your own fork
cd node-js-sample
npm install
npm start
```

Your app should now be running on [localhost:5000](http://localhost:5000/).

## Deploying to staging using Github action workflow

On the push to the main branch it will trigger the workflow with name Build and Test.
-   Step 1: It will assign you a runner with ubuntu OS to setup your required environment and execute your steps
-   Step 2: Now it will checkout your code in first step, then it will run the docker build, after that it will push the docker image to your repository.

We can add another step for the testing but as i wasn't able to find an application with test case so wasn't able to add it in the pipeline. and also for the same I didn't had a registry and eks cluster with me.

All the environment variables would be passed as Github secrets from the respository settings.


Now once it is successful then only the job will be executed in the next deploy workflow.

Step1:- you would need to add the access key, secret key , and region as git repository secrets and those would be used to authenticate with the AWS for EKS.

Step2:- It will install the kubectl if it is not present there and then in the next step it will run the kubectl apply command for deploying it to the staging environment.

