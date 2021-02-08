# National Resources Governance Index #

## USAGE ##

Start by checking out the project from github

```
git clone https://github.com/Vizzuality/nrgi-backoffice-api
cd nrgi-backoffice-api
```


### REQUIREMENTS ###

  - **Ruby version:** 2.4.0
  - **PostgreSQL 9.4+** [How to install](http://exponential.io/blog/2015/02/21/install-postgresql-on-mac-os-x-via-brew/)


**Execute the script file in `bin/setup`**



### Set up the database ###

    bundle exec rake db:create
    bundle exec rake db:migrate

### Create admin users: ###

    bundle exec rake db:seed

### Import NRGI's data: ###

    bundle exec rake all:import


### Run application: ###

    bin/rails s


## DEPLOYMENT ##

**To deploy the API to staging environment, just execute: cap staging deploy**

## CONTRIBUTING ##

### BEFORE CREATING A PULL REQUEST ###

Please check all of [these points](https://github.com/Vizzuality/sustainable_cities/blob/master/CONTRIBUTING.md).

1. Fork it!
2. Create your feature branch: `git checkout -b feature/my-new-feature`
3. Commit your changes: `git commit -am 'Add some feature'`
4. Push to the branch: `git push origin feature/my-new-feature`
5. Submit a pull request :D
