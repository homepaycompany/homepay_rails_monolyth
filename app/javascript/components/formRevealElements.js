function formRevealElements () {
  document.querySelectorAll('.toggle-btn').forEach((b) => {
    b.addEventListener('click', (e) => {
      b.classList.toggle('toggle-btn-active')
      if (b.id === 'js-reveal') {
        document.getElementById(`js-${b.dataset.field}`).classList.toggle('hidden');
      }
    })
  })
}

export { formRevealElements }
