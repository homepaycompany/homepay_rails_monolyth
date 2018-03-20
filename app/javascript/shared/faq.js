function toggleClass() {
  const childrens = event.currentTarget.childNodes;
  const answerId = event.currentTarget.dataset.question;
  for (var i=0; i<childrens.length; i++) {
    if ((typeof childrens[i].classList !== 'undefined') && (childrens[i].classList.contains("fas"))) {
      childrens[i].classList.toggle("fa-chevron-up");
      childrens[i].classList.toggle("fa-chevron-down");
    }
  }
  const answer = document.querySelector(`#js-faq-answer[data-answer="${answerId}"]`);
  answer.classList.toggle("hidden");
}

function toggleFaq() {
  const faqs = document.querySelectorAll("#js-faq-question");
  faqs.forEach(faq => faq.addEventListener('click', toggleClass));
}

export { toggleFaq };
