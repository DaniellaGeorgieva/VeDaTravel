var priceSortOrder = 1; // 1 for ascending, -1 for descending

function priceSort(columnIndex) {
    var table, rows, switching, i, x, y, shouldSwitch;
    table = document.getElementById("myTable");
    switching = true;

    while (switching) {
        switching = false;
        rows = table.getElementsByTagName("tr");

        for (i = 1; i < rows.length - 1; i++) {
            shouldSwitch = false;
            x = rows[i].getElementsByTagName("td")[columnIndex];
            y = rows[i + 1].getElementsByTagName("td")[columnIndex];

            // Convert the values to numbers for proper numeric comparison
            var xValue = parseFloat(x.innerHTML.replace(/[^\d.-]/g, '')) || 0;
            var yValue = parseFloat(y.innerHTML.replace(/[^\d.-]/g, '')) || 0;

            if (priceSortOrder === 1 ? xValue > yValue : xValue < yValue) {
                shouldSwitch = true;
                break;
            }
        }

        if (shouldSwitch) {
            rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
            switching = true;
        }
    }

    // Toggle the sort order for the next click
    priceSortOrder = -priceSortOrder;
}
