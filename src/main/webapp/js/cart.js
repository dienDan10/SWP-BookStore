// event for update a cart item
const btn_update = document.querySelectorAll('.btn-update');
btn_update.forEach(btn => btn.addEventListener('click', function(event) {
    event.preventDefault();
    // get information
    const cart_id = btn.getAttribute('cart-id');
    const _action = btn.getAttribute('action');

    // check for cart item quantity is 1;
    if (_action === 'minus') {
        const currentQuantity = this.nextElementSibling.value;
        if (currentQuantity <= 1)
            return;
    }

    // get the input field
    let input;
    if (_action === 'minus') {
        input = this.nextElementSibling;
    } else if (_action === 'plus') {
        input = this.previousElementSibling;
    }

    function increase () {
        input.value = (Number(input.value) + 1);
    }

    function decrease() {
        input.value = (Number(input.value) - 1);
    }

    // send request to server
    $.ajax({
        url: '/update-cart',
        type: 'get',
        data: {
            cartId: cart_id,
            action: _action
        },
        success: function (data) {
            if (_action === 'minus') {
                decrease();
            } else {
                increase();
            }
            calcTotal();
            console.log("update success");
        },
        error: function (dd) {

        }
    });
}));

// function to update the price of each item and total price
function calcTotal() {
    const itemPrices = document.querySelectorAll('.item-price');
    const itemQuantities = document.querySelectorAll('.item-quantity');
    const itemTotalPrices = document.querySelectorAll('.item-total-price');
    const totalPrice = document.querySelector('.total-price');
    let total = 0;
    for (let i = 0; i < itemPrices.length; i++) {
        const itemPrice = sliceLastCharacterAndConvertToNumber(itemPrices[i].textContent.trim());
        const itemQuantity = Number(itemQuantities[i].value);
        itemTotalPrices[i].textContent = (itemPrice * itemQuantity).toFixed(3) + 'đ';
        total += itemPrice * itemQuantity;
    }

    totalPrice.textContent = total.toFixed(3) + 'đ';
    //totalPrice.textContent = formatVND(total).toFixed(3) + 'đ';
}

// convert a string of price into a number of price
function sliceLastCharacterAndConvertToNumber(inputString) {
    // Remove the last character from the string
    let stringWithoutLastChar = inputString.slice(0, -1);

    // Convert the remaining string to a number
    let number = parseFloat(stringWithoutLastChar);

    // Return the resulting number
    return number;
}

// call the function right after the page render to update the price
calcTotal();

// event for delete a cart item.

const btn_deletes = document.querySelectorAll('.btn-delete');
btn_deletes.forEach(btn => btn.addEventListener('click', function(event) {
    event.preventDefault();
    if (!confirm("Do you want to delete?")) {   // abort mission
        return false;
    }

    const cartId = Number(this.getAttribute('cart-id'));
    const row = this.closest('tr');
    // send request to server
    $.ajax({
        url: '/delete-cart',
        type: 'get',
        data: {
            cartId: cartId,
        },
        success: function (data) {
            row.remove();
            handleNoCartLeft();
            calcTotal();
            console.log("Delete success");
        },
        error: function (dd) {

        }
    });

}));


function handleNoCartLeft() {
    const tableBody = document.querySelector('.table-body');
    const rows = tableBody.childElementCount;
    if (rows >= 2) {    // do nothing if there is still cart
        return;
    }

    const btnRow = document.querySelector('.checkout_btn_inner');
    btnRow.remove();
    document.querySelector('.total-row').remove();
    const table = document.querySelector('.table');
    table.insertAdjacentHTML("afterend", '<h5>Bạn chưa có sản phẩm nào trong giỏ hàng<h5>');
}
