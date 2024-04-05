document.addEventListener('turbolinks:load', checkCheckBox)

function checkCheckBox() {
  const btn = document.getElementById('check')
  let inputs = document.querySelectorAll('input')
  let i= 0

  function visibleBtn() {
    while (i < inputs.length) {
      if (inputs[i].checked) {
        btn.disabled = false
      }
      i++;
    }
  }

  if (btn) {
    j = 0
    while (j < inputs.length) {
      inputs[j].addEventListener('click',visibleBtn)
      j++;
    }
  }

}