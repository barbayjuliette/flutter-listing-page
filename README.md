# Sample e-commerce product listing page

E-commerce product listing page using Flutter for the frontend and Rails for the backend.

## Setting up the project

Clone the project.

```bash
git clone git@github.com:barbayjuliette/juliette_barbay-mlionTechTeam.git
```

Make sure you have the latest Rails and Flutter versions installed.

### Rails (from the backend folder)

Run this command to install all the dependencies for Rails.

```bash
bundle install
```

Run this command to create the database and seed it with test data.

```bash
rails db:create db:migrate db:seed
```

### Flutter (from the frontend folder)

Run this command to install all the dependencies for Flutter.

```bash
flutter pub get
```

## Running the application

Launch the Rails API from the backend folder.

```bash
rails s
```

Launch the Flutter web app from the frontend folder.

```bash
 flutter run --web-port=8000
```
Note that you should use the port 8000, as that is the one that is accepted by CORS on Rails as per configuration.

**You are all set, enjoy!**
