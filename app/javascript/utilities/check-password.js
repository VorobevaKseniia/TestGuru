document.addEventListener('turbolinks:load', checkPassword)

function checkPassword() {
    const pass = document.getElementById('user_password')
    const confirmPass = document.getElementById('user_password_confirmation')
    const check = document.querySelector('.octicon-check')
    const x = document.querySelector('.octicon-x')

    function changeBorder() {

        const passValue = pass.value
        const confirmPassValue = confirmPass.value

        if (passValue === '' || confirmPassValue === '') {
            confirmPass.classList.remove('valid')
            confirmPass.classList.remove('invalid')
            check.classList.add('hide')
            x.classList.add('hide')
            return
        }
        if (passValue === confirmPassValue) {
            pass.classList.add('valid')
            confirmPass.classList.remove('invalid')
            confirmPass.classList.add('valid')
            check.classList.remove('hide')
            x.classList.add('hide')
        } else {
            pass.classList.remove('valid')
            confirmPass.classList.add('invalid')
            x.classList.remove('hide')
            check.classList.add('hide')
        }
    }

    if (pass && confirmPass) {
        pass.addEventListener('input', changeBorder)
        confirmPass.addEventListener('input', changeBorder)
    }
}