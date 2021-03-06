<%@ page import="database.DB" %>
<%@ page import="entity.queue" %>
<%@ page import="java.util.List" %>
<%--
  Created by IntelliJ IDEA.
  User: 152595y
  Date: 1/23/2017
  Time: 2:10 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Queue Main</title>

<link href="css/bootstrap.min.css" rel="stylesheet">
<script type ="text/javascript">
    // forEach helper for nodelists
    var forEach = Array.prototype.forEach;
    /**
     * Add leading zeros to a number
     * from http://stackoverflow.com/a/2998822
     * @param {number|string} num the number to pad
     * @param {number} the minimum number of digits in the number
     */
    /*function pad(num, size) {
        var s = num + "";
        while (s.length < size) s = "0" + s;
        return s;
    }
*/
    /**
     * Change the numbers and run transition animation
     * @param {number|string} the number to fill the counter with
     */
   /* function flipDigits(num) {
        var digits = document.querySelectorAll('.digit');
        setNewDigits(digits, num);
        animateDigits(digits);
    }
*/
    /**
     * Set the counter with new digits.
     * will set the actual content to the new content and will also
     * add data attributes digit-from and digit-to with the nuber so they can be used
     * by javascript and css.
     * @param {array<HTMLElement>|NodeList} digits an array of elements containing the digits
     * @paran {number|string} num the number to fill with.
     */
  /*  function setNewDigits(digits, num) {
        var chars = pad(num, digits.length);
        forEach.call(digits, function(digit, index) {
            var current = digit.querySelector('span');
            digit.setAttribute('data-digit-from', current.textContent);
            current.setAttribute('data-digit-from', current.textContent);
            digit.setAttribute('data-digit-to', chars[index]);
            current.setAttribute('data-digit-to', chars[index]);

            current.textContent = chars[index];
        });
    }
*/
    /**
     * Set the animation className on a digit if needed
     * @param {array<HTMLElement>|NodeList} digits an array of elements containing the digits
     */
   /* function animateDigits(digits) {
        forEach.call(digits, function(digit) {
            var current = digit.querySelector('span');
            if (digit.getAttribute('data-digit-from') !== current.textContent) {
                digit.classList.add('flip');
            }
        });
    }
*/
    /**
     * Initiate the counter:
     * 1. get the counter type from the menu
     * 2. Add animationEnd events to reset the animation state after it ends (this REQUIRES setting some animation on the inner span of the digit to work)
     * 3. Get value from input field.
     */
  /*  function init() {
        var menuItems = document.querySelectorAll('.counter-type');
        var nav = document.querySelector('nav');
        nav.addEventListener('change', function(event) {
            var counter = document.querySelector('.counter');
            counter.setAttribute('data-type', event.target.value);
        }, false);

        var digits = document.querySelectorAll('.digit');
        forEach.call(digits, function(digit) {
            var current = digit.querySelector('span');
            current.addEventListener('animationend', function(event) {
                event.target.parentNode.classList.remove('flip');
            }, false);
        });
        //For old Safari and old Android
        forEach.call(digits, function(digit) {
            var current = digit.querySelector('span');
            current.addEventListener('webkitAnimationEnd', function(event) {
                event.target.parentNode.classList.remove('flip');
            }, false);
        });

        var submit = document.querySelector('#submit');
        submit.addEventListener('click', function(event) {
            flipDigits(document.querySelector('#digits-input').value || 0);
            return false;
        }, false);
    }

    init();*/
</script>
<style>

    body {
        padding-top: 70px;
        /* Required padding for .navbar-fixed-top. Remove if using .navbar-static-top. Change if height of navigation changes. */
    }
    .center{
        margin:auto;
        width: 60%;
        border: 3px solid #000000;
        padding: 10px;
        text-align:center;
    }

    .collect{
        background-color: #af0e13;
        border: none;
        color: white;
        padding: 15px 32px;
        text-align: center;
        text-decoration: none;
        display: inline-block;
        font-size: 16px;
        margin: 4px 2px;
        cursor: pointer;
    }

    .counter {
        padding:15px 15px;
        display: -webkit-box;
        display: -ms-flexbox;
        display: flex;
        -ms-flex-wrap: nowrap;
        flex-wrap: nowrap;
        -webkit-box-pack: center;
        -ms-flex-pack: center;
        justify-content: center;
        text-align: center;
    }
    .counter .digit {
        height: 160px;
        width: 110px;
        line-height: 160px;
        font-size: 90px;
    }
    .counter[data-type="simple-digits"] .digit {
        border: 1px solid #000;
        border-right-width: 0;
        overflow: hidden;
        position: relative;
    }
    .counter[data-type="simple-digits"] .digit:last-child {
        border-right-width: 1px;
    }
    .counter[data-type="simple-digits"] .digit::before, .counter[data-type="simple-digits"] .digit span {
        width: 100%;
        display: block;
        position: absolute;
    }
    .counter[data-type="simple-digits"] .digit::before {
        content: attr(data-digit-from);
        top: -100%;
    }
    .counter[data-type="simple-digits"] .digit.flip::before, .counter[data-type="simple-digits"] .digit.flip span {
        -webkit-animation: slideUp 0.5s;
        animation: slideUp 0.5s;
    }
    .counter[data-type="3d-digits"] .digit {
        border-right: 1px solid #fff;
        -webkit-transform-style: preserve-3d;
        transform-style: preserve-3d;
        -webkit-transform: translateZ(0);
        transform: translateZ(0);
        background: -webkit-linear-gradient(#222 50%, #333 50%);
        background: linear-gradient(#222 50%, #333 50%);
        color: #fff;
        position: relative;
        -webkit-perspective: 500px;
        perspective: 500px;
    }
    .counter[data-type="3d-digits"] .digit:last-child {
        border-right-width: 0;
    }
    .counter[data-type="3d-digits"] .digit .current {
        width: 100%;
        display: block;
        -webkit-transform-style: preserve-3d;
        transform-style: preserve-3d;
    }
    .counter[data-type="3d-digits"] .digit .current::before {
        content: '';
        border-top: 1px solid #000;
        top: 50%;
        margin-top: -1px;
        left: 0;
        width: 100%;
        position: absolute;
    }
    .counter[data-type="3d-digits"] .digit::before, .counter[data-type="3d-digits"] .digit::after, .counter[data-type="3d-digits"] .digit .current::after {
        display: block;
        overflow: hidden;
        width: 100%;
        height: 50%;
        position: absolute;
        top: 0;
        visibility: hidden;
        box-sizing: border-box;
    }
    .counter[data-type="3d-digits"] .digit::before {
        background: #222;
        border-bottom: 1px solid #000;
        content: attr(data-digit-from);
        z-index: 1;
    }
    .counter[data-type="3d-digits"] .digit::after, .counter[data-type="3d-digits"] .digit .current::after {
        background: #333;
        top: 50%;
        line-height: 0;
    }
    .counter[data-type="3d-digits"] .digit.flip .current::after {
        visibility: visible;
        content: attr(data-digit-from);
    }
    .counter[data-type="3d-digits"] .digit.flip::before {
        content: attr(data-digit-from);
        -webkit-transform-origin: 50% 100%;
        transform-origin: 50% 100%;
        visibility: visible;
        -webkit-animation: flip3dTop ease-in 0.3s both;
        animation: flip3dTop ease-in 0.3s both;
    }
    .counter[data-type="3d-digits"] .digit.flip::after {
        content: attr(data-digit-to);
        visibility: visible;
        background: #111;
        border-bottom-color: #222;
        -webkit-transform-origin: 50% 0;
        transform-origin: 50% 0;
        -webkit-transform: rotateX(90deg);
        transform: rotateX(90deg);
        -webkit-animation: flip3dBottom 0.3s ease-out 0.3s;
        animation: flip3dBottom 0.3s ease-out 0.3s;
    }
    .counter[data-type="3d-digits"] .digit.flip .current {
        -webkit-animation: emptyForCallback 0.6s;
        animation: emptyForCallback 0.6s;
    }

    @-webkit-keyframes slideUp {
        from {
            -webkit-transform: translateY(100%);
            transform: translateY(100%);
        }
    }

    @keyframes slideUp {
        from {
            -webkit-transform: translateY(100%);
            transform: translateY(100%);
        }
    }
    @-webkit-keyframes emptyForCallback {
        to {
            top: auto;
        }
    }
    @keyframes emptyForCallback {
        to {
            top: auto;
        }
    }
    @-webkit-keyframes flip3dTop {
        from {
            -webkit-transform: rotateX(0deg);
            transform: rotateX(0deg);
        }
        to {
            -webkit-transform: rotateX(-90deg);
            transform: rotateX(-90deg);
            background: #111;
        }
    }
    @keyframes flip3dTop {
        from {
            -webkit-transform: rotateX(0deg);
            transform: rotateX(0deg);
        }
        to {
            -webkit-transform: rotateX(-90deg);
            transform: rotateX(-90deg);
            background: #111;
        }
    }
    @-webkit-keyframes flip3dBottom {
        to {
            background: #333;
            border-bottom-color: #333;
            -webkit-transform: rotateX(0deg);
            transform: rotateX(0deg);
        }
    }
    @keyframes flip3dBottom {
        to {
            background: #333;
            border-bottom-color: #333;
            -webkit-transform: rotateX(0deg);
            transform: rotateX(0deg);
        }
    }

</style>


<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
<script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->


</head>

<%
    int queueNo = 0;
    DB db = new DB();
    List<queue> list = db.getQueueNumbers();
    if(list.size()>0){
        queueNo = list.get(list.size()-1).getQueueNo();
    }
%>
<body>

<!-- Navigation -->
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <div class="container">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">Home</a>
        </div>
        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li>
                    <a href="#">Make/Change Appointment</a>
                </li>
                <li>
                    <a href="#">About</a>
                </li>
                <li>
                    <a href="#">Support</a>
                </li>
            </ul>
        </div>
        <!-- /.navbar-collapse -->
    </div>
    <!-- /.container -->
</nav>
<!-- jQuery Version 1.11.1 -->
<script src="js/jquery.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="js/bootstrap.min.js"></script>
<!-- Page Content -->

<!-- /.container -->

<div class="counter" data-type="simple-digits">
    <div class="digit" data-digit-from="" data-digit-to=""><span class="current">0</span></div>



</div>
<div class="center">
    <form action=""method="post"><input type="submit" name="Collect Queue Number" value="Collect Queue Number" class="collect"></form>
    <h2>Your Queue Position:<span style="color:red;font-weight:bold"> placeholder</span></h2>
    <h2>Estimated Waiting Time:<span style="color:green;font-weight:bold"> placeholder</span></h2>
    <h2>Appointed Doctor:<span style="color:blue;font-weight:bold"> placeholder</span></h2>
</div>
</body>
</html>