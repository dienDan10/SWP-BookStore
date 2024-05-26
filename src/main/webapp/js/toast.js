const toastBox = document.querySelector('#toastBox');
const successIcon = '<i class="fa-solid fa-circle-check"></i>';
const errIcon = '<i class="fa-solid fa-circle-xmark"></i>';
const invalidIcon = '<i class="fa-solid fa-circle-exclamation"></i>';
const msg = document.querySelector('#msg');


function showToast() {
    const toast = document.createElement('div');
    toast.classList.add('toastItem');
    let content = 'Hello';
    const type = msg.getAttribute('type');

    if (type === 'error') {
        toast.classList.add('error');
        content = errIcon + msg.textContent ;
    } else if (type === 'success') {
        content = successIcon +  msg.textContent;
    } else if (type === 'invalid') {
        toast.classList.add('invalid');
        content = invalidIcon + msg.textContent;
    }
    console.log(content);
    toast.innerHTML = content;
    toastBox.appendChild(toast);

    setTimeout(() => {
        toast.remove();
    }, 3000);
}

showToast();