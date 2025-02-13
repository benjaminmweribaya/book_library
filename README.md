# Book Lending Library Application

## Table of Contents
- [Introduction](#introduction)
- [Features](#features)
- [Technology Stack](#technology-stack)
- [Installation and Setup](#installation-and-setup)
- [Running the Application](#running-the-application)
- [Running Tests](#running-tests)
- [Project Structure](#project-structure)
- [Usage Guide](#usage-guide)
- [Contributing](#contributing)
- [License](#license)
- [Author](#author)

---

## Introduction
The Book Lending Library is a simple web application built with **Ruby on Rails 8**. It allows users to register, browse available books, borrow books, return borrowed books, and track their borrowing history. The system enforces rules such as preventing a book from being borrowed if it is already loaned out. The application includes model validations, error handling, and high test coverage.

---

## Features
- User authentication (registration, login, logout) using Rails 8's default authentication system.
- Book listing page displaying all books and their availability status.
- Book details page with a borrow button (if the book is available).
- Borrowing system that creates a borrowing record when a user borrows a book and sets a due date (2 weeks from borrowing date).
- User profile page listing all borrowed books and their due dates.
- Return book functionality to mark a book as returned and update its availability.
- Model validations to ensure data integrity.
- Error handling to prevent issues such as borrowing an already borrowed book.
- Comprehensive tests for models, controllers, and views using Rails' built-in testing framework.

---

## Technology Stack
- **Backend:** Ruby on Rails 8
- **Database:** PostgreSQL (or SQLite for local development)
- **Testing:** Rails' built-in testing framework (Minitest/RSpec)
- **Authentication:** Rails 8 default authentication system
- **Frontend:** Embedded Ruby (ERB) views with Bootstrap for styling

---

## Installation and Setup
### Prerequisites
Ensure you have the following installed:
- Ruby (>= 3.0)
- Rails (>= 8.0)
- PostgreSQL (for production) or SQLite (for development/testing)
- Git
- Bundler

### Clone the Repository
```sh
$ git clone https://github.com/your-username/book-lending-library.git
$ cd book-lending-library
```

### Install Dependencies
```sh
$ bundle install
```

### Configure the Database
Create and migrate the database:
```sh
$ rails db:create
$ rails db:migrate
```

(Optional) Seed the database with sample books:
```sh
$ rails db:seed
```

### Start the Rails Server
```sh
$ rails server
```
Now, visit `http://localhost:3000` in your browser.

---

## Running the Application
1. Start the Rails server:
   ```sh
   $ rails server
   ```
2. Open your browser and navigate to `http://localhost:3000`
3. Register or log in to an account.
4. Browse the book catalog.
5. Click on a book to view details and borrow if available.
6. Go to your profile page to see borrowed books.
7. Return a borrowed book when done.

---

## Running Tests
The application includes unit, controller, and view tests.
To run the test suite:
```sh
$ rails test
```
To run specific tests, use:
```sh
$ rails test test/models
$ rails test test/controllers
$ rails test test/views
```
The tests ensure:
- Models validate data correctly.
- Controllers handle book borrowing and returning properly.
- Views display the correct information to users.

---

## Project Structure
```
book-lending-library/
│-- app/
│   ├── controllers/
│   │   ├── application_controller.rb
│   │   ├── books_controller.rb
│   │   ├── borrowings_controller.rb
│   │   ├── sessions_controller.rb
│   │   ├── users_controller.rb
│   ├── models/
│   │   ├── book.rb
│   │   ├── borrowing.rb
│   │   ├── user.rb
│   ├── views/
│   │   ├── books/
│   │   ├── borrowings/
│   │   ├── users/
│-- config/
│-- db/
│-- test/
│-- Gemfile
│-- README.md
```

---

## Usage Guide
### Borrowing a Book
1. Log in or register an account.
2. Navigate to the Books page.
3. Click on a book and press "Borrow" if it's available.
4. The book will be added to your borrowed books with a due date.

### Returning a Book
1. Visit your profile page.
2. Click the "Return" button next to the borrowed book.
3. The book will be marked as returned and become available for others.

### Error Handling
- A book cannot be borrowed if already loaned out.
- Users must be authenticated to borrow or return books.
- Forms provide feedback for validation errors.

---

## Contributing
Contributions are welcome! To contribute:
1. Fork the repository.
2. Create a new branch for your feature: `git checkout -b feature-name`
3. Commit your changes: `git commit -m "Add new feature"`
4. Push the branch: `git push origin feature-name`
5. Create a pull request.

---

## License
This project is licensed under the MIT License.

---

## Author
**Name:** Benjamin Mweri Baya
**Email:** b3njaminbaya@gmail.com
