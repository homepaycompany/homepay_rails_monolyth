import "bootstrap";
import { autocomplete } from '../components/autocomplete'
import { goBack } from '../components/goBack'
import { formSectionValidation } from '../components/formSectionValidation'
import { formRevealElements } from '../components/formRevealElements'

if (document.getElementById('real_estate_property_address')) {
  autocomplete();
}

if (document.getElementById('go-back')) {
  goBack();
}

if (document.getElementById('validate-section')) {
  formSectionValidation()
}

if (document.querySelector('.toggle-btn')) {
  formRevealElements();
}
