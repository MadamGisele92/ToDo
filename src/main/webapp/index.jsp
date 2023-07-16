<%--
  Created by IntelliJ IDEA.
  User: gbrown62
  Date: 6/25/2023
  Time: 1:17 PM
  To change this template use File | Settings | File Templates.
--%>

<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>
        body {
            margin: 0;
            min-width: 250px;
        }

        /* The design of the list items */
        ul li {
            cursor: pointer;
            position: relative;
            padding: 12px 8px 12px 40px;
            list-style-type: none;
            background: #eee;
            font-size: 18px;
            transition: 0.2s;

            /* make the list items unselectable */
            -webkit-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            user-select: none;
        }

        /* Set all odd list items to a different color (zebra-stripes) */
        ul li:nth-child(odd) {
            background: #f9f9f9;
        }

        /* Adds a background color and strike-out text once selected*/
        ul li.checked {
            background: #fd88c3;
            color: #fff;
            text-decoration: line-through;
        }

        /* Removes floats after the header */
        .header:after {
            content: "";
            display: table;
            clear: both;
        }

        /* Adds a "checked" mark when clicked on */
        ul li.checked::before {
            content: '';
            position: absolute;
            border-color: #fff;
            border-style: solid;
            border-width: 0 2px 2px 0;
            top: 10px;
            left: 16px;
            transform: rotate(45deg);
            height: 15px;
            width: 7px;
        }

        /* Style the close button */
        .close {
            position: absolute;
            right: 0;
            top: 0;
            padding: 12px 16px 12px 16px;
        }

        /* The "Add" button's Design*/
        .addBtn {
            padding: 10px;
            width: 25%;
            background: #5d5a5a;
            color: #f1ecec;
            float: left;
            text-align: center;
            font-size: 16px;
            cursor: pointer;
            transition: 0.3s;
            border-radius: 0;
        }

        /* Style the header */
        .header {
            background-color: #110223;
            padding: 30px 40px;
            color: white;
            text-align: center;
        }

        /* Adds the padding and border */
        * {
            box-sizing: border-box;
        }

        /* The input's Design */
        input {
            margin: 0;
            border: none;
            border-radius: 0;
            width: 75%;
            padding: 10px;
            float: left;
            font-size: 16px;
        }

        /* Removes margins and padding from the list */
        ul {
            margin: 0;
            padding: 0;
        }

        .addBtn:hover {
            background-color: #43335b;
            color: white;
        }

        /* Darkens the background-color when you hover */
        ul li:hover {
            background: #ddd;
        }

        .close:hover {
            background-color: #110223;
            color: white;
        }
    </style>
</head>
<body>

<div id="myDIV" class="header">
    <h2 style="margin:5px">Brielle's To Do List</h2>
    <input type="text" id="myInput" placeholder="Title...">
    <span onclick="newElement()" class="addBtn">Add</span>
</div>

<ul id="myUL">
    <li>Housework</li>
    <li class="checked">Homework</li>
    <li>Doctor's Appointment</li>
    <li>Grocery Shop</li>
    <li>Cook Dinner</li>
    <li>Sleep</li>
</ul>

<script>
    // Assign an "x" or delete button to each list item
    var myNodelist = document.getElementsByTagName("LI");
    var i;
    for (i = 0; i < myNodelist.length; i++) {
        var span = document.createElement("SPAN");
        var txt = document.createTextNode("\u00D7");
        span.className = "close";
        span.appendChild(txt);
        myNodelist[i].appendChild(span);
    }

    // Select the "x" to hide the list item
    var close = document.getElementsByClassName("close");
    var i;
    for (i = 0; i < close.length; i++) {
        close[i].onclick = function() {
            var div = this.parentElement;
            div.style.display = "none";
        }
    }

    // An item is "checked" when selected
    var list = document.querySelector('ul');
    list.addEventListener('click', function(ev) {
        if (ev.target.tagName === 'LI') {
            ev.target.classList.toggle('checked');
        }
    }, false);

    // Add to the List by clicking the "Add" button
    function newElement() {
        var li = document.createElement("li");
        var inputValue = document.getElementById("myInput").value;
        var t = document.createTextNode(inputValue);
        li.appendChild(t);
        if (inputValue === '') {
            alert("You must write something!");
        } else {
            document.getElementById("myUL").appendChild(li);
        }
        document.getElementById("myInput").value = "";

        var span = document.createElement("SPAN");
        var txt = document.createTextNode("\u00D7");
        span.className = "close";
        span.appendChild(txt);
        li.appendChild(span);

        for (i = 0; i < close.length; i++) {
            close[i].onclick = function() {
                var div = this.parentElement;
                div.style.display = "none";
            }
        }
    }
</script>

</body>
</html>

