🔹 Project Title

CI/CD Pipeline for Snake Game using GitHub Actions & Self-Hosted Runner

🔹 Steps Taken

1. EC2 Setup

Launched Ubuntu 22.04 EC2 instance
Allowed ports:
22 (SSH)
80 (HTTP)

2. Self-Hosted Runner Setup

Configured GitHub self-hosted runner on EC2
Installed runner using:
./config.sh
./run.sh
Created separate runner directory for Snake project

3. Docker Setup

Installed Docker on EC2:
sudo apt update
sudo apt install docker.io -y

4. Application Deployment

Cloned Snake game repository
Built Docker image
Ran container on port 80

5. CI/CD Pipeline

Created GitHub Actions workflow to:

Build Docker image
Push image to Docker Hub
Deploy container on EC2
Perform health check
Send email notification


🔹 Learnings

Understanding of self-hosted runners
Docker build and deployment process
CI/CD pipeline creation using GitHub Actions
Debugging real-world issues (BuildKit, ports, permissions)
Importance of health checks and retries

🔹 Challenges Faced                                                                                Challenge	Solution

Docker BuildKit error	                                                                            Removed BuildKit dependency
Runner offline	                                                                                 Restarted runner / used service
Port mapping confusion	                                                                           Fixed container port (80:80)
Git push rejected	                                                                                  Used git pull --rebase
Health check failure	                                                                                 Added retry logic


🔹 Screenshots

1️⃣ EC2 Instance Running

<img width="1888" height="821" alt="image" src="https://github.com/user-attachments/assets/1168fed7-effa-49ae-941c-564aa2a2f62c" />

2️⃣ GitHub Actions Logs

<img width="1871" height="828" alt="image" src="https://github.com/user-attachments/assets/053a3310-2711-400a-85e6-eca1d206ac1b" />

<img width="1876" height="838" alt="image" src="https://github.com/user-attachments/assets/3e82bd8b-a480-4269-8b9f-068319052b31" />

3️⃣ Snake Game Running

<img width="1884" height="952" alt="image" src="https://github.com/user-attachments/assets/f3cc7ab1-76ce-4086-8183-5a9b837da82e" />

4️⃣ Github Self Hosted Runner

<img width="1862" height="878" alt="image" src="https://github.com/user-attachments/assets/27d4ef75-0570-4c4a-a815-94ae381cf214" />
