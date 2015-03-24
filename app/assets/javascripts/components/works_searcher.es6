import $ from 'jquery';

export class WorksSearcher {
  constructor(options) {
    this.$form = $(options.form);
  }

  static performSearch(url, data) {
    return $.getJSON(url, data);
  }

  searchLocalDatabase(data) {
    return this.constructor.performSearch(this.$form.attr('action'), data);
  }

  searchGoogleBooks(data) {
    return this.constructor.performSearch('search_google', data);
  }

  query() {
    var self = this
      , data = this.$form.serialize()
      , deferred = $.Deferred();

    self.searchLocalDatabase(data).done(function(results) {
      if (results.works.length === 0) {
        deferred.notify('Searching Google Books');
        self.searchGoogleBooks(data).done(function(googleResults) {
          deferred.resolve(googleResults);
        });
      } else {
        deferred.resolve(results);
      }
    });

    return deferred.promise();
  }
}
