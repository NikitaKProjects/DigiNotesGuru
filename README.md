# DigiNotesGuru
DigiNotesGuru is a digital notes platform designed to help users create, manage, and organize their notes efficiently. 
The application leverages Java Servlets, JSP, and JDBC to provide a seamless user experience.

## Table of Contents
- [Features](#features)
- [Technologies Used](#technologies-used)
- [Installation](#installation)
- [Usage](#usage)
- [Project Structure](#project-structure)
- [Contributing](#contributing)
- [License](#license)
- [Contact](#contact)

## Features
- User authentication and authorization
- Create, edit, and delete notes
- Organize notes by categories
- Search and filter notes
- Rich text formatting for notes
- Responsive user interface

## Technologies Used
- **Frontend**: HTML, CSS,  JSP
- **Backend**: Java Servlets, JDBC
- **Database**: MySQL
- **Build Tool**: Maven
- **Version Control**: Git

## Installation

### Prerequisites
- Java 8 or higher
- Apache Tomcat 9 or higher
- MySQL
- Maven

### Steps
1. **Clone the repository**:
    ```bash
    git clone https://github.com/NikitaKProjects/repository.git
    cd diginotesguru
    ```

2. **Configure the database**:
    - Create a MySQL database.
    - Update the database configuration in `src/main/resources/hibernate.cfg.xml` and `src/main/webapp/WEB-INF/web.xml`.

3. **Build the project**:
    ```bash
    mvn clean install
    ```

4. **Deploy to Tomcat**:
    - Copy the generated WAR file from `target/` to the `webapps` directory of your Tomcat server.

5. **Start Tomcat**:
    - Start your Tomcat server and navigate to `http://localhost:8080/diginotesguru`.

## Usage
1. **Login**:
    - Access the application through the login page.
    
2. **Home Page**:
    - Once logged in, you will be redirected to the main dashboard.

3. **Create Notes**:
    - Navigate to the "Create Note" page to add new notes.

4. **Manage Notes**:
    - Edit or delete existing notes from the "Manage Notes" page.
    - Use the search and filter functionalities to find specific notes.

## Project Structure
diginotesguru/
│
├── src/
│ ├── main/
│ │ ├── java/
│ │ │ └── com/yourusername/diginotesguru/
│ │ │ ├── model/
│ │ │ ├── dao/
│ │ │ ├── service/
│ │ │ └── servlet/
│ │ ├── resources/
│ │ │ └── hibernate.cfg.xml
│ │ └── webapp/
│ │ ├── WEB-INF/
│ │ │ └── web.xml
│ │ ├── component/
│ │ └── user/
│ └── test/
│
├── pom.xml
└── README.md


## Contributing
Contributions are welcome! Please open an issue or submit a pull request for any improvements or bug fixes.

## License
This project is licensed under the MIT License.

## Contact
For any inquiries or support, please contact:
- **Name**: Nikita Kundu
- **Email**: [nikitarkundu92@gmail.com](mailto:nikitarkundu92@gmail.com)
