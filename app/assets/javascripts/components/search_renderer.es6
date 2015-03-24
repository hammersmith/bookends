import $ from 'jquery';
import template from 'templates/search_results';

export function render(container, data) {
  return $(container).html(template(data));
}
