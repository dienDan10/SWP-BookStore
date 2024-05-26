const p1 = document.querySelector('.password-1');
const p2 = document.querySelector('.password-2');
const msg = document.querySelector('.msg');
const btn = document.querySelector('.btn');
p2.addEventListener('input', () => {
    const val1 = p1.value;
    const val2 = p2.value;
    console.log(val1);
    console.log(val2);
    if (val1 !== val2) {
        msg.textContent = "Your password doesn't match!";
        btn.disabled = true;
    } else {
        msg.textContent = "";
        btn.disabled = false;
    }
});