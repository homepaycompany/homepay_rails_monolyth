function formSectionValidation() {
  const c = document.getElementById('validate-section');
  c.addEventListener('click', (e) => {
    if (validateFields()) {
      document.querySelectorAll('.form-field-submit-button').forEach((b) => {
        b.click();
      })
      setTimeout(function(){document.getElementById('move-to-next-section').click();}, 1000)
    }
  })
}

function validateFields() {
  document.querySelectorAll('.form-wrong-input-format').forEach((f) => {
    f.remove()
  })
  let i = true
  document.querySelectorAll('.form-control').forEach((f) => {
    if (f.type === 'number' && parseInt(f.value, 10)) {
      i = i && true
    } else {
      f.parentElement.parentElement.parentElement.parentElement.insertAdjacentHTML('beforeEnd', "<div class='form-wrong-input-format'>Format incorrect<div>")
      i = i && false
    }
  })
  return i
}

export { formSectionValidation }
