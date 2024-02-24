document.addEventListener('turbolinks:load', addProgress)

function addProgress() {
  const progress = document.getElementById('myProgress')
  const bar = document.querySelector('.bar')
  if (bar) {
    if (bar.dataset.questionNumber > 1) {
      let step = (bar.dataset.questionNumber - 1) * 100 / bar.dataset.numberOfQuestions
      progress.style.width = step + "%"
      progress.textContent = step  + "%"
    } else {
      progress.style.width = "1%"
    }
  }
}
