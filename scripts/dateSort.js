// dateSort.js
function dateSort(columnIndex) {
    var table, rows, switching, i, x, y, shouldSwitch, dir, switchcount = 0;
    table = document.getElementById("myTable");
    switching = true;
    dir = "asc";

    while (switching) {
        switching = false;
        rows = table.rows;

        for (i = 1; i < (rows.length - 1); i++) {
            shouldSwitch = false;
            x = rows[i].getElementsByTagName("TD")[columnIndex];
            y = rows[i + 1].getElementsByTagName("TD")[columnIndex];

            var dateX = parseDate(x.innerHTML);
            var dateY = parseDate(y.innerHTML);

            if (dir == "asc") {
                if (dateX > dateY) {
                    shouldSwitch = true;
                    break;
                }
            } else if (dir == "desc") {
                if (dateX < dateY) {
                    shouldSwitch = true;
                    break;
                }
            }
        }

        if (shouldSwitch) {
            rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
            switching = true;
            switchcount++;
        } else {
            if (switchcount == 0 && dir == "asc") {
                dir = "desc";
                switching = true;
            }
        }
    }
}

function parseDate(dateString) {
    // Assuming the date format is "YYYY-MM-DD"
    var parts = dateString.split("-");
    return new Date(parts[0], parts[1] - 1, parts[2]);
}