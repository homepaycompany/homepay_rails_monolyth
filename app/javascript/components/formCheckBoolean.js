function addBooleanToForm () {
  selectState()
  document.querySelectorAll('#js-form-toggle-btn').forEach((b) => {
    b.addEventListener('click', (e) => {
      addOneChoiceToForm(b);
    })
  })
}

function addOneChoiceToForm (b) {
  b.classList.toggle('active');
  const id = `js-hidden-form-${b.dataset.name}`;
  const formInputDiv = document.getElementById(id);
  if (document.getElementById(`property_form_${b.dataset.name}`)) {
    document.getElementById(`property_form_${b.dataset.name}`).remove();
  } else {
    const html = `<input name="property_form[${b.dataset.name}]" class = "hidden" id="property_form_${b.dataset.name}" value="1" />`
    formInputDiv.insertAdjacentHTML('beforeEnd', html);
  }
}

function selectState () {
  document.querySelectorAll('#js-form-toggle-btn').forEach((b) => {
    if (b.dataset.selected === "true") {
      addOneChoiceToForm(b);
    }
  })
}

export { addBooleanToForm }
