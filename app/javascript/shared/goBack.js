function goBack() {
  document.getElementById('js-go-back').addEventListener('click', (e) => {
    document.getElementById('js-move-to-previous-section').click()
  })
}

export { goBack }
