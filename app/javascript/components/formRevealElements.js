function setChoiceForm () {
  selectElements ()
  addChoicesToForm ()
}

function selectElements () {
  document.querySelectorAll('.js-form-selection-box').forEach((b) => {
    if (b.dataset.selected === "true") {
      addOneChoiceToForm(b)
    }
  })
}

function addChoicesToForm () {
  document.querySelectorAll('.js-form-selection-box').forEach((b) => {
    b.addEventListener('click', (e) => {
      addOneChoiceToForm(b);
    })
  })
}

function addOneChoiceToForm (b) {
  b.classList.toggle('active');
  const id = `js-hidden-form-${b.dataset.name}`;
  const formInputDiv = document.getElementById(id);
  formRevealElements(b);
  if (document.getElementById(`property_form_${b.dataset.name}`)) {
    document.getElementById(`property_form_${b.dataset.name}`).remove();
  } else {
    const html = `<input name="property_form[${b.dataset.name}]" class = "hidden" id="property_form_${b.dataset.name}" value="1" />`
    formInputDiv.insertAdjacentHTML('beforeEnd', html);
  }
}

function formRevealElements (b) {
  if (b.dataset.reveal) {
    const s = document.getElementById(b.dataset.reveal)
    s.classList.toggle('hidden');
    if (s.querySelector('.form-control')) {
      s.querySelector('.form-control').classList.toggle('hidden')
    }
  }
}

export { setChoiceForm }
