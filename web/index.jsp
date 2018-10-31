<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <script language="JavaScript" type="text/javascript" src="jquery-3.3.1.min.js"></script>
    <script language="JavaScript" type="text/javascript" src="script.js"></script>
  </head>
  <body>

  <form action="/get/info">

    Enter amount of rows: <input type="text" id="rows" name="rows" required><br>
    Enter amount of columns: <input type="text" id="columns" name="colvkumns" required><br>
    <button id="kek">Submit</button>
  </form>


   <div id="showMe">
     Optimisation Direction:
   <input type="checkbox" id="optDir">
   </div>
  <form id="mainCriteriaFrm"></form>
  <form id="criteriaFrm"></form>
  <form id="frm"></form>
  <button id="send">Send</button>


  </body>
</html>