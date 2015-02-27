# BookEnds

[![Build Status](https://travis-ci.org/hammersmith/bookends.svg?branch=master)](https://travis-ci.org/hammersmith/bookends)
[![Code Climate](https://codeclimate.com/github/hammersmith/bookends/badges/gpa.svg)](https://codeclimate.com/github/hammersmith/bookends)
[![Test Coverage](https://codeclimate.com/github/hammersmith/bookends/badges/coverage.svg)](https://codeclimate.com/github/hammersmith/bookends)

An online book catalog and ordering system.

## Development Environment

1. **Get the source:**
   Clone the repository to your favorite spot, and cd into the directory.

   ```shell
   git clone https://github.com/hammersmith/bookends.git
   cd bookends
   ```

2. **Install Gems:**

    ```shell
    bundle install
    ```

3. **Setup databases:**
   We're using MySQL as our database.

   ```shell
   rake db:create
   rake db:migrate; RAILS_ENV=test rake db:migrate
   rake db:seed
   ```

4. **Setup Processes:**
   There's a handy gem called [foreman](https://github.com/ddollar/foreman) that we use to start the necessary processes (Rails server and SOLR server).

   ```shell
   gem install foreman
   foreman start
   ```

5. **Reindex Solr (if there's existing data):**
   On another terminal tab you'll need to reindex SOLR for search capability.

   ```shell
   bundle exec rake sunspot:solr:reindex
   ```

6. Go to localhost:3000 and you're done!

## Testing

To run all tests, simply run ```rake``` from the project root.
