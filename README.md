USECASE
-------

You have a Contentful space whose entries represent *mobile apps*.

You want to regularly fetch data (think screenshots, descriptions) from the
iTunes Store and push it to those entries, so that they're always in sync.

Usage
-----

Define the following variables:

* `APPS_TYPE` in `app_list.rb` is the content type id of your *App* type
* `SETTINGS` in `sidekiq_worker.rb` with your Contentful credentials

Then:

* Run sidekiq and the web interface with `foreman start`
* Queue some jobs by hand from the console with `SyncWorker.perform`
* Alternatively, use whenever to set up a cron job that does it for you (hint: look at the `config/schedule.rb` file)
