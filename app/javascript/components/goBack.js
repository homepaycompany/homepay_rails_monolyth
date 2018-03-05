function goBack() {
  document.getElementById('go-back').addEventListener('click', (e) => {
    window.history.back();
  })
}

export { goBack }
