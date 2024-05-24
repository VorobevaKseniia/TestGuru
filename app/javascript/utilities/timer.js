document.addEventListener('turbolinks:load', function() {
  const timerElement = document.getElementById('timer');

  if (timerElement) {
    let timeInSecs = parseInt(timerElement.dataset.testTime)
    function updateTime() {
      const timer = setInterval(() => {

        const timerElement = document.getElementById('timer');

        if (timeInSecs > 0) {
          timeInSecs--;
        } else {
          clearInterval(timer);
          document.querySelector('form').submit();
        }

        let mins = Math.floor(timeInSecs / 60);
        let countdown = ((mins < 10) ? "0" : "") + mins + ":" + ((timeInSecs%60 < 10) ? "0" : "") + timeInSecs % 60;

        (timeInSecs > 0) ? timerElement.innerHTML = countdown : timerElement.innerHTML = 'Время вышло!';

      }, 1000);
    }

    updateTime()
  }
})



