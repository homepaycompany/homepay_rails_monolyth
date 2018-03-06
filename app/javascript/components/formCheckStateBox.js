function addStateToForm () {
  selectState();
  document.querySelectorAll('#js-form-state-box').forEach((b) => {
    b.addEventListener('click', (e) => {
      toggleActiveState(b);
    })
  })
}

function toggleActiveState (b) {
  if (!b.classList.contains('active')) {
    document.querySelectorAll(`[data-name='${b.dataset.name}']`).forEach((b) => {
      b.classList.remove('active')
    })
    b.classList.add('active')
    addOneChoiceToForm(b)
  }
}

function addOneChoiceToForm (b) {
  const id = `js-hidden-form-${b.dataset.name}`;
  const formInputDiv = document.getElementById(id);
  if (document.getElementById(`property_form_${b.dataset.name}`)) {
    document.getElementById(`property_form_${b.dataset.name}`).remove();
  }
  const html = `<input name="property_form[${b.dataset.name}]" class = "hidden" id="property_form_${b.dataset.name}" value="${b.dataset.value}" />`
  formInputDiv.insertAdjacentHTML('beforeEnd', html);
}

function selectState () {
  document.querySelectorAll('#js-form-state-values-box').forEach((d) => {
    let i = false
    d.querySelectorAll('#js-form-state-box').forEach((b) => {
      if (b.dataset.selected === "true") {
        toggleActiveState(b);
        i = true
      }
    })
    if (!i) {
      toggleActiveState(d.firstElementChild);
    }
  })
}

export { addStateToForm }
