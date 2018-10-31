var rows, columns;
$( document ).ready(function() {
    $("#kek").click(function(event){
        event.preventDefault();
        $.ajax({
            url : '/get/dimension',
            data : {
                rows : $('#rows').val(),
                columns : $('#columns').val()
            },
            success : function(responseText) {
              var result = responseText.split(" ");
              rows = result[0];
              columns = result[1];
              drawMatrix(rows,columns);
              drawCriteriaArray(columns)
            }

        });
    });

    $("#send").click(function(){
       sendArraysInfo()
    });
});

function sendArraysInfo() {
    var matrix = getMatrix().toString()
    var criteriaArray = getCriteriaArray().toString();
    $.ajax({
        url : '/get/arrays',
        data : {
            matrix : matrix,
            criteriaArray : criteriaArray,
            rows : rows,
            columns : columns,
            optDir : $('#optDir').val()
        },
        success : function() {
           alert("OK")
        }

    });
}
function drawCriteriaArray(columns){
    var criteriaForm = document.getElementById("criteriaFrm");

    for(var j = 0; j < columns; j++)
    {
        var input = $('<input>')
            .attr({
                class: 'matrix_cell',
                type: 'checkbox',
                name: 'crtItem'
            });
        criteriaForm.appendChild(input[0]);
    }
}

function drawMatrix(rows, columns){
    var form = document.getElementById("frm");
    for(var i = 0; i < rows; i++)
    {
        for(var j = 0; j < columns; j++)
        {
            var input = $('<input>')
                .attr({
                    class: 'matrix_cell',
                    value: getRandomInt(-5,5)});
            form.appendChild(input[0]);
        }
        var br = $('<br>')[0];
        form.appendChild(br);
    }
}

function getMatrix(){
    var matrix_row = [];

    var ind = 0;

    $("#frm").contents().each(function(i,e){
        if (this.nodeName == "INPUT")
        {
            if (!matrix_row[ind]){
                matrix_row.push([]);
            }
            matrix_row[ind].push($(this).val());
        }
        else{
            ind++;
        }
    });

    return matrix_row;
}


function getCriteriaArray(){
    var arr =[];
    $("input:checkbox[name=crtItem]").each(function() {
        if($(this).is(":checked")) {
            arr.push(1);
        } else {
            arr.push(0);
        }

    });

    return arr;
}

function getRandomInt(min, max) {
    min = Math.ceil(min);
    max = Math.floor(max);
    return Math.floor(Math.random() * (max - min)) + min;
} 

