USECASE
-------

You have a Contentful space whose entries represent *mobile apps*.

You want to regularly fetch data (think screenshots, descriptions) from the
iTunes Store and push it to those entries, so that they're always in sync.

Usage
-----

This project uses [dotenv][] to manage its configuration.  Define the following
environment vars in `.env`:

* `CONTENTFUL_APPS_TYPE` in `app_list.rb` is the content type id of your *App* type
* `CONTENTFUL_SPACE_ID`
* `CONTENTFUL_ACCESS_TOKEN`

Then:

* Run redis, sidekiq and the web interface with `foreman start`
* Queue some jobs by hand from the console with `SyncWorker.perform`
* Alternatively, use whenever to set up a cron job that does it for you (hint: look at the `config/schedule.rb` file)
* Or you can also run the only existing test, which is right now being (ab)used as a hacky way of performing a job.

Code Structure
--------------

This project makes heavy use of the [Decorator][deco] and [Presenter][pres]
patterns. Take a look at the relative directories for examples on how to
implement each.

The main action happens in the `AppList` class, so look there if you're
curious how things work.

[dotenv]: https://github.com/bkeepers/dotenv
[deco]: https://en.wikipedia.org/wiki/Decorator_pattern
[pres]: https://eewang.github.io/blog/2013/09/26/presenting-the-rails-presenter-pattern/
