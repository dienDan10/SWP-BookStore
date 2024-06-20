document.querySelectorAll('.order-date').forEach(date => {
    date.textContent = formatDateTime(date.textContent.trim());
})

function formatDateTime(input) {
    // Split the input string into date and time parts
    const [datePart, timePart] = input.split('T');

    // Further split the date and time parts into individual components
    const [year, month, day] = datePart.split('-');
    const [hours, minutes, seconds] = timePart.split(':');

    // Construct the formatted date-time string
    const formattedDateTime = day + '/' + month + '/' + year + ' ' + hours + ':' + minutes + ':' + seconds;
    return formattedDateTime;
}