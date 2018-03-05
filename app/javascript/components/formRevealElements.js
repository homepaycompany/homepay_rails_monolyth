function formRevealElements () {
  document.querySelectorAll('.toggle-btn').forEach((b) => {
    b.addEventListener('click', (e) => {
      b.classList.toggle('toggle-btn-active')
      if (b.id === 'js-reveal') {
        const s = document.getElementById(`js-${b.dataset.field}`)
        s.classList.toggle('hidden');
        s.querySelector('.form-control').classList.toggle('hidden')
      }
    })
  })
}

export { formRevealElements }
