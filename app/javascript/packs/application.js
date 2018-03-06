import "bootstrap";

// Javascript for autocomplete
import { autocomplete } from '../components/autocomplete'
if (document.getElementById('real_estate_property_address')) {
  autocomplete();
}

// Javascript for landing page
import { waypoint } from '../shared/landing_page.js'
if (document.getElementById('js-value-prop-sale')) {
  waypoint();
}
