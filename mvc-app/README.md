# Carolina Explorer - CRUD MVC Application

A full-stack **Spring Boot MVC application** for booking and managing guided tours across North Carolina.  
This project demonstrates real-world implementation of **MVC architecture, booking systems, and user role-based dashboards**.

## Table of Contents

- [What is This Project?](#what-is-this-project)
- [Technology Stack](#technology-stack)
- [Installation & Setup](#installation--setup)
- [Running the Application](#running-the-application)
- [Project Architecture](#project-architecture)
- [Web UI Routes](#web-ui-routes)
- [Key Spring Boot Concepts](#key-spring-boot-concepts)
- [UML Class Diagram](#uml-class-diagram)

---

## What is This Project?

This is a **CRUD MVC Application** (Create, Read, Update, Delete) that manages tour booking platform. It demonstrates:

- How to build a REST API with Spring Boot
- How to build a web interface using Spring MVC
- How to connect to a PostgreSQL database using JPA
- How to structure a Spring Boot application with layers (Controller, Service, Repository)
- How to handle HTTP requests and responses
- How to render web pages with FreeMarker templates
- How to perform database operations

**CRUD** stands for:

- **C**reate - Add new users/tours 
- **R**ead - Retrieve user/tour information
- **U**pdate - Modify existing user profile
- **D**elete - Remove user/tour records

The application provides both a **REST API** for programmatic access and a **web interface** for user interaction.

---

## Technology Stack

| Technology          | Version | Purpose                                |
| ------------------- | ------- | -------------------------------------- |
| **Java**            | 25      | Programming language                   |
| **Spring Boot**     | 4.0.3   | Framework for building the application |
| **Spring MVC**      | Latest  | Web framework for handling requests    |
| **FreeMarker**      | Latest  | Template engine for web views          |
| **Spring Data JPA** | Latest  | ORM layer for database access          |
| **Hibernate**       | Latest  | JPA implementation                     |
| **PostgreSQL**      | Latest  | Relational database                    |
| **Maven**           | Latest  | Build and dependency management        |

### Java - [Spring ORM with JPA and Hibernate](https://medium.com/@burakkocakeu/jpa-hibernate-and-spring-data-jpa-efa71feb82ac)
- We are using ORM (Object-Relational Mapping) to deal with databases. This is a technique that allows us to interact with a relational database using object-oriented programming principles.
- JPA (Jakarta Persistence, formerly Java Persistence API) is a specification that defines ORM standards in Java. It provides an abstraction layer for ORM frameworks to make concrete implementations.
- Hibernate: Hibernate is a popular ORM framework that implements JPA. It simplifies database operations by mapping Java objects to database tables and handling queries efficiently.
- Spring ORM allows seamless integration of Hibernate and JPA, making database interactions more manageable and reducing boilerplate code.

### Key Dependencies Explained

**spring-boot-starter-data-jpa**: Provides Spring Data JPA for simplified database access through repositories and automatic query generation.

**spring-boot-starter-web**: Provides Spring Web MVC for building both REST APIs and web applications with annotations like `@Controller`, `@GetMapping`, etc.

**spring-boot-starter-freemarker**: Provides FreeMarker template engine for rendering dynamic web pages.

**postgresql**: JDBC driver to connect to PostgreSQL database.

---

## Installation & Setup

### Prerequisites

Before you begin, ensure you have installed:

1. **Java 25 JDK**
   - Download from [Oracle Java](https://www.oracle.com/java/technologies/downloads/) or use a package manager
   - Verify installation: `java -version`

2. **Neon.tech PostgreSQL Database** (Cloud-based, Serverless)
   - This project uses [Neon.tech](https://neon.tech), a serverless PostgreSQL database in the cloud
   - You don't need to install PostgreSQL locally
   - Sign up for a free account at [Neon.tech](https://neon.tech)
   - You only need an internet connection to connect to the database

3. **Git** (optional, for cloning the project)
   - Download from [Git Official Site](https://git-scm.com/)

### About Maven Wrapper

**Good news!** This project includes the **Maven Wrapper** (`mvnw` on Mac/Linux and `mvnw.cmd` on Windows). This means you **do not need to install Maven separately**. The wrapper automatically downloads the correct Maven version for you.

The Maven Wrapper is a handy tool that ensures everyone working on the project uses the same Maven version, reducing compatibility issues.

### Setup Instructions

1. **Clone or Download the Project**

   ```bash
   git clone <repository-url>
   cd sp26-crud-api-demo
   ```

2. **Install Dependencies**
   The Maven Wrapper will automatically download dependencies from the `pom.xml` file:

   **On Windows**:

   ```cmd
   mvnw.cmd clean install
   ```

   **On Mac/Linux**:

   ```bash
   ./mvnw clean install
   ```

   This command:
   - `clean`: Removes previous build artifacts
   - `install`: Downloads all dependencies and compiles the project
   - First run may take a few minutes as Maven is downloaded

3. **Database Configuration (Neon.tech Serverless PostgreSQL)**

   #### Step 1: Get Your Neon.tech Connection String

   1. Navigate to [Neon.tech](https://neon.tech)
   2. Sign in to your account
   3. In your project dashboard, find your connection string
   4. It will look like: `postgresql://username:password@host:5432/dbname`

   #### Step 2: Stop Tracking `application.properties` Locally

   To prevent accidentally committing your database credentials to Git, use `git skip-worktree` to exclude your local copy:

   ```bash
   git update-index --skip-worktree src/main/resources/application.properties
   ```

   This tells Git to ignore any changes you make to this file locally. You can now safely edit the file without worrying about committing sensitive data.

   #### Step 3: Update Your Connection String

   Edit `src/main/resources/application.properties` and add your Neon.tech PostgreSQL connection string:

   ```properties
   spring.application.name=crud-api
   spring.datasource.url=jdbc:postgresql://host:5432/dbname
   spring.datasource.username=your_neon_username
   spring.datasource.password=your_neon_password
   spring.jpa.hibernate.ddl-auto=update

   #Log out sql queries
   logging.level.org.hibernate.SQL=DEBUG
   logging.level.org.hibernate.type.descriptor.sql.BasicBinder=TRACE
   logging.level.org.hibernate.orm.jdbc.bind=TRACE
   ```

   Replace with your actual Neon.tech credentials:
   - `host`: Your Neon.tech host (e.g., `some-cool-projectName-pooler.c-7.us-east-1.aws.neon.tech`)
   - `dbname`: Your database name (usually `neondb`)
   - `your_neon_username`: Your Neon.tech username
   - `your_neon_password`: Your Neon.tech password

   #### Example Connection String

   ```properties
   spring.datasource.url=jdbc:postgresql://ep-cool-cherry-ai9ih0ua-pooler.c-7.us-east-1.aws.neon.tech:5432/neondb
   spring.datasource.username=neondb_owner
   spring.datasource.password=your_password_here
   ```

   #### To Resume Tracking the File

   If you need to revert and track the file again:

   ```bash
   git update-index --no-skip-worktree src/main/resources/application.properties
   ```

   **Important Note**: This approach (using `git skip-worktree`) keeps credentials safe locally while the file can be tracked in Git. However, in production environments, database credentials should be managed using environment variables or cloud-based secret management services like AWS Secrets Manager or Azure Key Vault.

4. **Verify Setup**

   **On Windows (PowerShell)**:

   ```cmd
   mvnw.cmd compile
   ```

   **On Mac/Linux (Bash/zsh)**:

   ```bash
   ./mvnw compile
   ```

   If successful, you'll see `BUILD SUCCESS` at the end.

---

## Running the Application

### Using Maven Wrapper

**On Windows**:

```cmd
mvnw.cmd spring-boot:run
```

**On Mac/Linux**:

```bash
./mvnw spring-boot:run
```

The application will start on **http://localhost:8080**

You should see output like:

```
Started CrudApiApplication in 4.532 seconds
```

### Using Java (After Building)

Alternatively, after building the project, you can run the compiled JAR file:

```bash
java -jar target/crud-api-0.0.1-SNAPSHOT.jar
```

### Using VS Code GUI

1. **Open the Project**: Open the project folder in VS Code
2. **Install Extension**: Install the "Extension Pack for Java" (by Microsoft) if not already installed
3. **Run the Application**:
   - Go to the Explorer view (left sidebar)
   - Navigate to `mvc-app > src > main > java > com > carolina_explorer > Application.java`
   - Right-click on `Application.java`
   - Select **"Run Java"** or click the ▶️ **Run** button that appears above the class definition
4. **View Output**: The terminal will show the Spring Boot startup messages and confirm the application is running

### Using IntelliJ IDEA GUI

1. **Open the Project**: Open the project folder in IntelliJ IDEA (it will recognize it as a Maven project)
2. **Configure JDK**:
   - Go to **File → Project Structure → Project**
   - Set the Project SDK to Java 25
3. **Run the Application**:
   - Navigate to `mvc-app > src > main > java > com > carolina > Application.java` in the Project Explorer
   - Right-click on `Application.java`
   - Select **"Run 'Application.main()'"** or click the ▶️ **Run** button next to the class name
4. **View Output**: The Run window at the bottom will show Spring Boot startup messages and confirm the application is running

**Alternative: Using the Run Menu**:
- Go to **Run → Run...** and select `Application` from the list
- Or use the keyboard shortcut: **Shift+F10** (Windows) or **Ctrl+R** (Mac)

### Stopping the Application

Press `Ctrl+C` in your terminal to stop the running application. If using IDE GUI, click the ⏹️ **Stop** button in the Run/Debug toolbar.

---

## Project Architecture

### Folder Structure

```
mvc-app/src/main/java/com/carolina_explorer/crud_api/
├── Application.java           # Entry point of the application
├── Controller.java            # Web UI controller for HTML views
├── Service.java               # Business logic layer
├── Repository.java            # Database access layer
└── Entity.java                # Entity/Model class

mvc-app/src/main/resources/
├── application.properties             # Configuration file
└── static/images                      # Images folder
└── templates/                         # FreeMarker HTML templates
    ├── signup.ftlh
    ├── login.ftlh
    └── tours.ftlh
    └── ...
```

### Architectural Pattern: **MVC (Model-View-Controller)**

This project follows the MVC architectural pattern with layered architecture:

```
┌─────────────────────────────────────┐
│   HTTP Client (Browser/API Client)  │
└────────────────┬────────────────────┘
                 │
┌────────────────▼────────────────────┐
│    Controller Layer                 │
│                                     │
│  - Handles HTTP requests            │
│  - API: Returns JSON responses      │
│  - UI: Returns view names & models  │
└────────────────┬────────────────────┘
                 │
┌────────────────▼────────────────────┐
│    Service Layer                    │
│                                     │
│  - Contains business logic          │
│  - Processes data from repositories │
└────────────────┬────────────────────┘
                 │
┌────────────────▼────────────────────┐
│    Repository Layer                 │
│                                     │
│  - Communicates with database       │
│  - Performs CRUD operations         │
└────────────────┬────────────────────┘
                 │
┌────────────────▼────────────────────┐
│    Model Layer                      │
│                                     │
│  - Data representation              │
└────────────────┬────────────────────┘
                 │
┌────────────────▼────────────────────┐
│    View Layer                       │
│  (FreeMarker Templates)             │
│                                     │
│  - HTML rendering for web UI        │
└────────────────┬────────────────────┘
                 │
┌────────────────▼────────────────────┐
│    Database                         │
│                                     │
│  (PostgreSQL)                       │
└─────────────────────────────────────┘
```

### Why This Architecture?

- **Separation of Concerns**: Each layer has a specific responsibility
- **Reusability**: Service layer logic can be reused by multiple controllers
- **Testability**: Each layer can be tested independently
- **Maintainability**: Changes in one layer don't require changes in others

---

## Web UI Routes

The application also provides a web interface for user interaction. All web routes use the base URL: `http://localhost:8080/students`

### 1. View All tours

```http
GET /tours/
```

**Description**: Display a list of all tours in a web page.

**Response**: HTML page showing the tour list.

### 2. View tour Details

```http
GET /tours/{id}
```

**Description**: Display detailed information for a specific tour.

**Path Parameters**:

- `id` (Long, required): The unique identifier of the tour

**Response**: HTML page with tour details or error page if not found.

### 3. Add New tour

```http
GET /tours/create
```

**Description**: Display a form to add a new tour given looged in as a tour guide.

**Response**: HTML form for creating a new tour.

### 4. Create tour

```http
POST /tours/create
```

**Description**: Process the form submission to create a new tour.

**Response**: Redirect to the new tours's home page.

### 5. Update Tourist Profile Picture

```http
POST /profile
```

**Description**: Upload an image URL to update the profile.

**Form Data**: Image URL.

**Response**: Redirect to the updated student's details page.

### 6. Accept / Reject Booking

```http
GET /guides/dashboard
```

**Description**: Accept/reject a booking and redirect to the guide dashboard.


**Response**: Redirect to the guide dashboard.

### 7. Search tours

```http
GET /tours?city={city}
```

**Description**: Search for tours by city and display results.

**Query Parameters**:

- `date` (String, optional): The date users wants to book a tour
- `guests` (String, optional): The number of guests

  
**Response**: HTML page with search results.

### 8. Filter by Category

```http
GET /tours?category={category}
```

**Description**: Display students filtered by category.

**Query Parameters**:

- `minPrice` (String, optional): The min amount for the tour price
- `maxPrice` (String, optional): The max amount for the tour price

**Response**: HTML page with filtered tour list.

---

## Key Spring Boot Concepts

### What is Spring Boot?

Spring Boot is a framework that simplifies building production-ready Spring applications. It provides:

- Auto-configuration of Spring application based on jar dependencies
- Embedded web server (Tomcat) - no need to deploy WAR files
- Convention over configuration - sensible defaults
- Easy integration with databases and other services

### MVC (Model-View-Controller) Pattern

Spring MVC is a web framework that follows the MVC architectural pattern:

- **Model**: Represents the data (Student entity, service responses)
- **View**: The presentation layer (FreeMarker templates that render HTML)
- **Controller**: Handles user requests, processes them, and returns appropriate responses


### @Controller vs @RestController

- `@Controller`: Returns view names (for web pages) and can use Model to pass data to views
- `@RestController`: Returns data directly (JSON/XML) - equivalent to `@Controller` + `@ResponseBody`

### FreeMarker Templates

FreeMarker is a server-side template engine for web applications:

```html
<table>
  <#list tourList as tour>
  <tr>
    <td>${tour.title}</td>
    <td>${tour.city}</td>
  </tr>
  </#list>
</table>
```

- `<#list collection as item>`: Iterates over collections
- `${variable}`: Displays variable content
- `<#if condition>`: Conditional rendering

### @Controller and @RequestMapping

```java
@Controller
@RequestMapping("/tours")  // Web UI controller
public class TourController { }

@RestController
@RequestMapping("/api/tours")  // API controller
public class TourApiController { }
```

- `@Controller`: Handles web requests, returns view names for HTML rendering
- `@RestController`: Handles API requests, returns data (JSON) directly
- `@RequestMapping`: Defines the base URL path for all methods in the controller

### HTTP Mapping Annotations

- `@GetMapping`: Handles GET requests (retrieve data)
- `@PostMapping`: Handles POST requests (create data)
- `@PutMapping`: Handles PUT requests (update data)
- `@DeleteMapping`: Handles DELETE requests (delete data)

### @Service and Dependency Injection

```java
@Service
public class TourService {
  private final TourRepository tourRepository;

  public TourService(TourRepository tourRepository) {
    this.tourRepository = tourRepository;
  }
}
```

- `@Service`: Marks a class as a service component (business logic)
- Constructor injection: Dependencies are provided through the constructor (best practice)

### Spring Data JPA Repository

```java
public interface TourRepository extends JpaRepository<Tour, Long> {
  List<Tour> findByCity(String city);
  Tour findByTitle(String title);
}
```

- `JpaRepository<Tour, Long>`: Provides CRUD methods automatically
- Spring automatically generates implementations for custom finder methods
- `findByCity` generates a query like: `SELECT * FROM tours WHERE city = ?`

### @Entity and JPA Annotations

```java
@Entity
@Table(name = "tours")
public class Tours {
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  public Long tourId;
}
```

- `@Entity`: Marks this class as a database table
- `@Table(name = "tours")`: Specifies the table name
- `@Id`: Marks the primary key field
- `@GeneratedValue`: Auto-generates IDs (database handles increment)

### ResponseEntity

```java
public ResponseEntity<Tour> getTourById(@PathVariable Long id) {
  Tour tour = tourService.getTourById(id);
  if (tour != null) {
    return ResponseEntity.ok(tour);  // Status 200
  } else {
    return ResponseEntity.notFound().build();  // Status 404
  }
}
```

`ResponseEntity` provides full control over HTTP responses including:

- Status codes (200, 404, 201, etc.)
- Response headers
- Response body

---

## UML Class Diagram
![UML Class Diagram](../docs/uml-class.png)


**Note**: The schema is automatically created by Hibernate based on the entity class when `spring.jpa.hibernate.ddl-auto=update` is set in `application.properties`.

---

## Testing the Web UI

### Testing the Web Interface

#### Using a Web Browser

1. Open your web browser
2. Navigate to `http://localhost:8080/tours/`
3. Use the web interface to:
   - View all tours
   - Search by city
   - Filter by price


The web interface provides a user-friendly way to interact with the tour data without needing API tools.

---

## Common Issues and Solutions

### Issue: Port 8080 is already in use

**Solution**: Change the port in `application.properties`:

```properties
server.port=8081
```

Then access the API at `http://localhost:8081/api/students/`

### Issue: "Connection refused" when accessing database

**Solution**:
- Ensure you have **internet access** to connect to Neon.tech (the database is cloud-based and always running)
- Verify your connection string is correct in `application.properties`
- Check that your username and password from Neon.tech are correct
- Make sure the host/endpoint is reachable (not blocked by firewall)

### Issue: Getting 404 errors

**Solution**:

- Verify the endpoint URL is correct
- Make sure the application is running (use `mvnw.cmd spring-boot:run` on Windows or `./mvnw spring-boot:run` on Mac/Linux)
- Check the base path is `/api/tours`

### Issue: JSON parsing errors in POST/PUT requests

**Solution**:

- Ensure `Content-Type: application/json` header is set
- Verify JSON syntax is valid (use online JSON validator)
- Check all required fields are included (name and email are required)

---

## Additional Resources

- [Spring Boot Official Documentation](https://spring.io/projects/spring-boot)
- [Spring Data JPA Guide](https://spring.io/projects/spring-data-jpa)
- [REST API Best Practices](https://restfulapi.net/)
- [PostgreSQL Documentation](https://www.postgresql.org/docs/)
