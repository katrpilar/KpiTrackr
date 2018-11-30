# KpiTrackr README

KpiTrackr to make it easy for companies, teams, and individuals to collaborate around their key metrics. Manual metric updates ensure the team is actively engaging with their metrics while charting progress and percentage left to obtain goals provide a sense of ownership.

## Getting Started

[KpiTrackr](https://www.kpitrackr.herokuapp.com) is live on Heroku if you'd like to explore the interface before cloning locally.

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites

* This application uses Postgres.
* Ruby Version 2.5.0
* Create an Amazon S3 bucket
* Create an Authorized Google App for Sign-in Authentication and ensure your callback urls are set properly within devise and the Google Console dashboard.
* Create the database via

```
rake db:migrate
```
I highly recommend looking at the models before getting started to understand the data relationships.

### Installing

* Fork this repository
* Clone it locally
* Populate the database

```
rake db:migrate
```

Create a .env file and ensure you have created the following environment variables.
* GOOGLE_CLIENT_ID (for Omniauth-Google)
* GOOGLE_CLIENT_SECRET (for Omniauth-Google)
* SECRET_KEY (for Devise)
* S3_BUCKET_NAME
* AWS_ACCESS_KEY_ID
* AWS_SECRET_ACCESS_KEY
* AWS_REGION

!IMPORTANT! Hide your .env file by adding it to your .gitignore file to ensure your secret keys aren't made public on your GitHub repo.
```
.env
```

## Built With

* Devise + Omniauth-Google
* Google Charts Api
* Moment.js
* Materialized

Devise + Omniauth-Google
* Used for user account creation and session management.
* Paired with Omniauth for Google sign in and account creation authentication.

Google Charts Api
* Used for charting Kpi metric goal progress

Moment.js
* Used to properly display created_at times within the Kpi cards' charts and metric updates based on the card creator's timezone.

Materialized
* The front-end design framework similar to bootstrap but with material design.
* This is the main framework used for the grid system.


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/katrpilar/teamkpiapp. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the Contributor Covenant code of conduct found in [CONTRIBUTING.md](CONTRIBUTING.md.) Note: We do not plan to push any proposed contributions to the live deploy of [KpiTrackr](https://www.kpitrackr.herokuapp.com) at this time.

## Authors 

** Katrina Brinson**

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details