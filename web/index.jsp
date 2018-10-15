<%-- Created by IntelliJ IDEA. --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
      <style>
          ul {
              margin-left: 0;
              padding-left: 0;
              width: 200px;
          }
          ul li {
              list-style: none;
              padding-bottom: 1em;
          }
          input[type=number] {
              width: 70px;
              float: right;
          }
          table, td {
              border: 1px solid #000;
              padding: 5px;
              border-spacing: 0;
              border-collapse: collapse;
              caption-side: bottom;
          }
      </style>

      <script>
          (function (window, document, undefined) {
              "use strict";

              var wrap = document.getElementById("wrap"),
                  setColumn = document.getElementById("column"),
                  setRow = document.getElementById("row"),
                  btnGen = document.getElementById("btnGen"),
                  btnCopy = document.getElementById("btnCopy");

              btnGen.addEventListener("click", generateTable);

              function generateTable(e) {
                  var newTable = document.createElement("table"),
                      tBody = newTable.createTBody(),
                      nOfColumns = parseInt(setColumn.value, 10),
                      nOfRows = parseInt(setRow.value, 10),
                      row = generateRow(nOfColumns);

                  newTable.createCaption().appendChild(document.createTextNode("Generated Table"));

                  for (var i = 0; i < nOfRows; i++) {
                      tBody.appendChild(row.cloneNode(true));
                  }

                  (wrap.hasChildNodes() ? wrap.replaceChild : wrap.appendChild).call(wrap, newTable, wrap.children[0]);
              }

              function generateRow(n) {
                  var row = document.createElement("tr"),
                      text = document.createTextNode("cell");

                  for (var i = 0; i < n; i++) {
                      row.insertCell().appendChild(text.cloneNode(true));
                  }

                  return row.cloneNode(true);
              }


          }(window, window.document));
      </script>

  </head>
  <body>

  <form action="/get/info">

    Enter amount of rows: <input type="text" name="rows"><br>
    Enter amount of columns: <input type="text" name="columns"><br>
    <input type="submit" value="Submit">
  </form>



  <ul>
      <li>
          <label for="column">Add a Column</label>
          <input type="number" id="column" validate />
      </li>
      <li>
          <label for="row">Add a Row</label>
          <input type="number" id="row" />
      </li>
      <li>
          <input type="button" value="Generate" id="btnGen" />
      </li>
  </ul>
  <div id="wrap"></div>
  </body>
</html>