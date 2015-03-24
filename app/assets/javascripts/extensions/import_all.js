System.importAll = function() {
  var sources = Array.prototype.slice.call(arguments);
  var promise = Promise.all(
    sources.map(function(source) { return System.import(source) })
  );

  return {
    then: function(callback) {
      return promise.then(function(modules) {
        callback.apply(this, modules);
      });
    }
  }
};
