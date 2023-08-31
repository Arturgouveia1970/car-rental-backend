# Car Rental Backend

> Car Rental Backend is a rails backend application for booking Cars. This application serves as API endpoints for the frontend users to load, create, and delete Cars, as well as make reservations. Users need to sign up and/or sign in to access the API endpoints. They can sign up or sign in using the API endpoints.

## Schema
![](https://lucid.app/lucidchart/b38c1893-dc6c-4a46-b44e-93d928b28d44/edit?viewport_loc=264%2C90%2C1702%2C1481%2C0_0&invitationId=inv_4871ed1f-cb73-4cc6-85bb-1efb50dd92b5)

### Front-End Repository

[Car Rental Front-end](https://github.com/Arturgouveia1970/car-rental-frontend)

### Kanban Board
[Kanban Board](https://github.com/users/Arturgouveia1970/projects/7)



> ***We are a group of two***
1. Member 1 - [Pedro Marques](https://github.com/ppmarq1)
2. Member 2 - [Artur Gouveia](https://github.com/Arturgouveia1970)


## Built With

- Major languages (Ruby)
- Framworks (Ruby on Rails)
- Testing library (Rspec)
- API docs (Rswag)

## Live version

[Render](https://dreamcars2.onrender.com/api/v1/cars)

## Getting Started

To get a local copy up and running follow these simple example steps.

### Prerequisites
- A text editor(preferably Visual Studio Code)

### Install
- Ruby
- Ruby on Rails
- PostgresSQL

### Using it Locally

- Clone the project
```
git clone https://github.com/Arturgouveia1970/car-rental-backend.git
cd car-rental-backend
```

### Setup

Add your username & password in `database.yml` file:
```
username: <your_username>
password: <your_password>
```
Specify your ruby version if different from mine
```
ruby 'Your_ruby_version'
```

Install gems with:

```
bundle install
```

Setup database with:

```
rails db:create
rails db:migrate
rails db:seed
```
### Usage

Start server with:

```
rails server -p 3000
```

Visit http://localhost:3000/ in your browser.

### Run tests

Install npm with:

```
npm install
```

Install rspec with:

```
bundle install
```

and

```
rails generate rspec:install
```

run the test with:

```
rspec spec
```
### Open API documentation

```
rails rswag:specs:swaggerize
```

Visit http://localhost:3000/api-docs in your browser.

## Visit And Open Files

[Visit Repo](https://github.com/Arturgouveia1970/car-rental-backend.git)


## Authors

👤 **Artur**

- GitHub: [Arturgouveia1970](https://github.com/Arturgouveia1970)
- Twitter: [@Arturgouveia10](https://twitter.com/Arturgouveia10)
- LinkedIn: [Artur Gouveia](https://www.linkedin.com/in/artur-gouveia/)

👤 **Pedro**

- GitHub: [Pedro](https://github.com/ppmarq1)
- Twitter: [@ppmarq1](https://twitter.com/ppmarq1)
- LinkedIn: [@Pedro](https://br.linkedin.com/in/pedroalmeidamarques/)


## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](https://github.com/Arturgouveia1970/car-rental-backend/issues).

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments
-  We acknowledge with appreciation the original design provided by Murat Korkmaz on Behance.
- Inspiration: Microverse.

## 📝 License

This project is [MIT](https://choosealicense.com/licenses/mit/) licensed.
