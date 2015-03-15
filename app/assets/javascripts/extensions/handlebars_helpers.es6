import Handlebars from 'handlebars';

Handlebars.registerHelper("join", function(array, delim) {
  if(array) {
    return array.join(delim);
  }
});
