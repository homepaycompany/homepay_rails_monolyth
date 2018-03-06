import "bootstrap";
import { autocomplete } from '../components/autocomplete'
import { goBack } from '../components/goBack'
import { formSectionValidation } from '../components/formSectionValidation'
import { setChoiceForm } from '../components/formRevealElements'
import { addBooleanToForm } from '../components/formCheckBoolean'
import { addStateToForm } from '../components/formCheckStateBox'
import { waypoint } from '../shared/landing_page.js'

// Javascript for autocomplete
if (document.getElementById('real_estate_property_address')) {
  autocomplete();
}

if (document.getElementById('go-back')) {
  goBack();
}

if (document.getElementById('validate-section')) {
  formSectionValidation()
}

if (document.getElementById('js-form-toggle-section')) {
  setChoiceForm();
}

if (document.getElementById('js-form-toggle-btn')) {
  addBooleanToForm();
}

if (document.getElementById('js-form-state-box')) {
  addStateToForm();
}

// Javascript for landing page
if (document.getElementById('js-value-prop-sale')) {
  waypoint();
}
