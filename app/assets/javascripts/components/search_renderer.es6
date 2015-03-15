import $ from 'jquery';
import template from 'templates/search_results';

export function render(form, results) {
  return $(form).on('ajax:success', function (e, data) {
    $(results).html(template(data))
  });
}
