# BiteMe

<p align="center">
  <img src="https://github.com/user-attachments/assets/3853b632-c2da-4e3f-a768-fbcad23f0120" alt="BiteMe Logo" width="400"/>
</p>

## Project Overview
BiteMe is a comprehensive client-server application developed as part of a degree project. It is designed to manage food orders for both private and business accounts, with a focus on efficiency and user experience. The application supports various user roles including branch managers, suppliers, customers, employees, and CEOs, each with specific responsibilities and access levels.

## Technology Stack
- **Frontend**: JavaFx
- **Backend**: Java
- **Client-Server Communication**: OCSF Framework
- **Database**: MySQL
- **Database Connectivity**: JDBC API

## Getting Started
### Prerequisites
Before you begin, ensure you have the following installed on your system:
1. **Java Development Kit (JDK)** - Version 8
   - Download: [Oracle JDK](https://www.oracle.com/java/technologies/javase/javase8-archive-downloads.html)
   - Verify installation: `java -version`
2. **MySQL Database** - Version 8.0.xx
   - Download: [MySQL Community Server](https://dev.mysql.com/downloads/mysql/)
3. **Git** (Optional)
   - Download: [Git](https://git-scm.com/downloads)
   - Verify installation: `git --version`

### Installation and Usage
1. **Download project files:**
   - **Option 1: Clone the repository for all project files (if you have Git installed)**:
     ```
     git clone https://github.com/David-Zorin/BiteMe.git
     ```
     **Alternatively, you can download the project as a ZIP file from the GitHub repository and extract it.**
   
   - **Option 2: Download specific files**:
     You can download the following files individually from the GitHub repository:
     - `Client.jar`
     - `Server.jar`
     - `biteme.sql`
     - `ImportSimulation.zip` (Optional)

2. **Set up the database**:
   - Create a MySQL database (if you don't have one)
   - Import the database schema using the provided SQL file in the project: `biteme.sql`

3. **Launch server (Server.jar)**:
   - Connect to your MySQL database (make sure your DB name and password are correct, no need to change anything else)

4. **Launch Client (Client.jar)**:
   - Enter IP and port matching those you entered in the server
   - Click connect

## Screenshots
Here are some screenshots of our application:

1. **Restaurant Selection**
   ![Select Restaurant Screen](https://github.com/user-attachments/assets/bf7c923b-b06e-463d-afc3-0b0da7f3ee4a)

2. **Menu**
   ![Menu Screen](https://github.com/user-attachments/assets/3c8ae75b-c9c1-45e7-983a-4ca943ceb148)

3. **CEO Reports**
   - Quarterly Reports
     ![Quarterly Report](https://github.com/user-attachments/assets/7fbc0329-33cb-4b92-a869-fc36268b58ae)
   - Monthly Reports
     ![Monthly Report](https://github.com/user-attachments/assets/bfd0bcf4-9e94-442d-882a-3650b5f9dd6d)

## Project Outcomes
- Achieved an overall score of 96
- Provided experience in efficient teamwork and task division
- Offered insights into industry-like software development practices, including:
  - Server-side development
  - Client-side development
  - Parallel task execution

## Acknowledgments
This project was developed as part of a degree program, providing valuable experience in software development and teamwork.
