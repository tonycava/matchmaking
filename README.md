# <h1 id="top">Running Matchmaking</h1>

This guide will help you set up, run, and build a Next.js app using the T3 stack. Follow the steps below to get started.

## 📋 Prerequisites

<hr>

## <img align="center" src="https://raw.githubusercontent.com/devicons/devicon/master/icons/git/git-original-wordmark.svg" alt="git" width="30" height="30"/> Git

Git is a free and open source distributed version control system designed to handle everything from small to very large
projects with speed and efficiency.

```
https://git-scm.com/downloads
```

## <img align="center" src="https://raw.githubusercontent.com/devicons/devicon/master/icons/nodejs/nodejs-original-wordmark.svg" alt="nodejs" width="30" height="30"/> NodeJS

Node.js® is an open-source, cross-platform JavaScript runtime environment.

```
https://nodejs.org/en/download/
```

## <img align="center" src="https://raw.githubusercontent.com/devicons/devicon/master/icons/yarn/yarn-original-wordmark.svg" alt="yarn" width="30" height="30"/> Yarn

Yarn is a package manager for your code. It allows you to use and share (e.g. JavaScript) code with other developers
from around the world. Yarn does this quickly, securely, and reliably so you don’t ever have to worry.

```
https://classic.yarnpkg.com/en/docs/install/
```

## <img align="center" src="https://raw.githubusercontent.com/devicons/devicon/master/icons/docker/docker-original-wordmark.svg" alt="docker" width="30" height="30"/> Docker

Develop faster. Run anywhere.

```
https://www.docker.com/
```

## <img align="center" src="https://www.vectorlogo.zone/logos/kubernetes/kubernetes-icon.svg"  alt="docker" width="30" height="30"/> Kubernetes (optional)

Kubernetes, also known as K8s, is an open-source system for automating deployment, scaling, and management of
containerized applications.

```
https://kubernetes.io/docs/tasks/tools/
```

## 🚀 Getting Started

<hr>

## :cyclone: Step 1 : Clone the repository

```bash
git clone --recurse-submodules https://github.com/tonycava/matchmaking
```

## :back: Step 2 : Go on the backend part and follow the `README.md` if you want to only run the backend part

```bash
cd backend/
```

## :bullettrain_front: Step 3 : Go on the backend part and follow the `README.md` if you want to only run the frontend part

```bash
cd frontend/
```

## 📝 Launching the app

<hr>

## :pencil2: Step 1: Fill the env variable

```bash
 cp .env.example .env
```

## :computer: Step 2: If you want to develop the app :

```bash
make start-dev
```

## 🌐 Step 3: If you want to lauch the app for production :

```bash
make start-prod
```