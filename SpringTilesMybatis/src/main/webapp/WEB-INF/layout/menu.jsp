<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<link href='http://fonts.googleapis.com/css?family=Ubuntu+Condensed' rel='stylesheet' type='text/css'/>
<style type="text/css">
#cl-dashboard {
	display: none;
}
.lavazi_nav {
	position: relative;
}
.lavazi_lamp {
	display: block;
	width: 0;
	position: absolute;
	left: 0;
	bottom: 0;
	opacity:0;
}
.lavazi_lamp.arrow .arrow_inner{
	bottom: 100%;
	left: 50%;
	border: solid transparent;
	height: 0;
	width: 0;
	position: absolute;
	pointer-events: none;
	border-color: rgba(34, 34, 34, 0);
	border-width: 4px;
	margin-left: -4px;
}
body {
	margin: 0;
	background: #eee;
}
a {
	text-decoration: none;
}
h1 {
	font: 400 40px 'ubuntu condensed', sans-serif;
	color: #34495e;
	text-align: center;
	margin: 0;
	padding: 40px;
}
nav {
	background: #34495e;
	float: center;
}
nav ul {
	padding: 0;
	margin: 0;
	list-style: none;
	text-align: center;

}
nav>ul>li {
	position: relative;
	float: left;
	text-align: center;
}
nav>ul>li>a {
	display: block;
	padding: 15px 20px;
	color: #fff;
	font: 400 15px 'ubuntu condensed', sans-serif;
	transition: all .3s ease-in-out;
	-moz-transition: all .3s ease-in-out;
	-webkit-transition: all .3s ease-in-out;
}
nav>ul ul {
	position: absolute;
	left: 0;
	top: 80%;
	opacity: 0;
	visibility: hidden;
	width: 170px;
	transition: all .3s ease-in-out;
	-moz-transition: all .3s ease-in-out;
	-webkit-transition: all .3s ease-in-out;
}
nav>ul>li:hover ul {
	opacity: 1;
	visibility: visible;
	top: 100%;
	padding-top: 20px;
}
nav>ul ul a {
	display: block;
	border-bottom: 1px solid #bbb;
	color: #222;
	background: #ddd;
	padding: 15px 5px;
	font: 400 15px 'ubuntu condensed', sans-serif;
}
nav>ul ul li:last-child a {
	border: none;
}
nav>ul ul li:first-child a{
	position:relative;
}
nav>ul ul li:first-child a:after {
	bottom: 100%;
	left: 10%;
	border: solid transparent;
	content: " ";
	height: 0;
	width: 0;
	position: absolute;
	pointer-events: none;
	border-color: rgba(136, 183, 213, 0);
	border-bottom-color: #ddd;
	border-width: 7px;
	margin-left: -7px;
}
</style>
<script type="text/javascript">
(function($) {
    $.fn.lavazi = function(options) {
        var defaults = {
            // These are the defaults.
            theme: "simple",
            activeClass: "selected",
            background: "#222",
            transitionTime: 300,
            height: 4,
            mode: 'barBottom',
            easings: 'easeInOutBack'
        }
		// Extend Defaults
        var settings = $.extend({}, defaults, options);
		// Add class on the basis of theme
		// Append lamp
        this.addClass('lavazi_nav ' + settings.theme).append('<span class="lavazi_lamp ' + settings.theme + '"></span>');
		// Ease setup
		// Uses CSS transitions only
        var easeToApply;
        switch (settings.easings) {
            case 'easeInOutBack':
                easeToApply = 'cubic-bezier(0.68, -0.55, 0.265, 1.55)';
                break;
            case 'easeIn':
                easeToApply = 'ease-in';
                break;
            case 'easeOut':
                easeToApply = 'ease-out';
                break;
            case 'easeInOut':
                easeToApply = 'ease-in-out';
                break;
            case 'easeInCubic':
                easeToApply = 'cubic-bezier(0.55, 0.055, 0.675, 0.19)';
                break;
            case 'easeOutCubic':
                easeToApply = 'cubic-bezier(0.215, 0.61, 0.355, 1)';
                break;
            case 'easeInOutCubic':
                easeToApply = 'cubic-bezier(0.645, 0.045, 0.355, 1)';
                break;
        }
		// Setting the lmp
        this.find('.lavazi_lamp').height(settings.height).css({
            "-moz-transition": "all " + settings.transitionTime + "ms " + easeToApply,
			"-ms-transition": "all " + settings.transitionTime + "ms " + easeToApply,
			"-o-transition": "all " + settings.transitionTime + "ms " + easeToApply,
            "-webkit-transition": "all " + settings.transitionTime + "ms " + easeToApply,
            "transition": "all " + settings.transitionTime + "ms " + easeToApply,
            "background": settings.background,
            "height": settings.height + "px"
        });
		// If theme is rounded then rounding the corners
        if (settings.theme == "rounded") {
            var cheight = settings.height,
                nheight = cheight / 2;
            this.find('.lavazi_lamp').css({
                "border-radius": nheight + "px",
                "-moz-border-radius": nheight + "px",
                "-webkit-border-radius": nheight + "px"
            })
        }
		// Append arrow if theme is arrow
        if (settings.theme == "arrow") {
            this.find('.lavazi_lamp').append('<span class="arrow_inner"></span>');
            $('.arrow_inner', this).css({
                "border-bottom-color": settings.background
            });
        }
		// Working starts here
        var t = this,
		// Select the children li items of the navigation
		// Look for active one
            m = t.children('li.' + settings.activeClass);
        $.findLavaziSelected = function() {
			// If no active class then...
            if (t.children('li').hasClass(settings.activeClass)) {
                var u = t.children('li.' + settings.activeClass);
            } else {
				// Add the active class on first one
                var u = t.children('li').first();
            }
			// Get absicca of active link
            var v = u.position().left,
			// Get outer width of active link
			// Includes Padding
                w = u.outerWidth(),
				// Top Or Bottom
				// Top Bottom Length
                TOB, TBL,
                x = t.find('.lavazi_lamp');
				// Setting the modes
            switch (settings.mode) {
                case "barBottom":
                    TOB = 'bottom', TBL = 0;
                    break;
                case "barTop":
                    TOB = 'top', TBL = 0;
                    break;
                case "belowBar":
                    TOB = 'top', TBL = '100%';
                    break;
                case "aboveBar":
                    TOB = 'below', TBL = '100%';
                    break;
            }
			// Putting the required CSS
            x.css({
                'left': v,
                TOB: TBL,
                'width': w,
                'opacity': 1
            });
        };
		// Reposition lamp on resource load
        $(window).load(function() {
            $.findLavaziSelected();
        });
		// Reposition on hover
        t.children('li').hover(function() {
            m.addClass('temporary_remove').removeClass(settings.activeClass);
            $(this).addClass(settings.activeClass);
            $.findLavaziSelected();
        }, function() {
            m.addClass(settings.activeClass).removeClass('temporary_remove');
            $(this).removeClass(settings.activeClass);
            $.findLavaziSelected();
        });
        $.findLavaziSelected();
    };
}(jQuery));
</script>
</head>
<body>
<c:set var="root" value="<%=request.getContextPath() %>"></c:set>
<%-- <c:set var="root" value="<%=request.getContextPath() %>"></c:set>
<a href="${root }/main.do">Home</a>
<a href="${root }/board/writeform.do">게시판</a>
&nbsp;&nbsp;
<a href="${root }/board/list.do">게시판목록</a> --%>
<h1>Spring_Mybatis</h1>
<nav>
  <ul>
    <li><a href='${root }/main.do'>Home</a></li>
    <li><a href='${root }/login/loginmain.do'>로그인</a>
      <ul>
        <li><a href='${root }/member/memberform.do'>회원가입</a></li>
        <li><a href='#'>Sublink</a></li>
        <li><a href='#'>Sublink</a></li>
        <li><a href='#'>Sublink</a></li>
      </ul>
    </li>
    <li><a href='${root }/board/list.do'>게시판</a></li>
    <li><a href='#'>About</a></li>
    <li><a href='#'>Profile</a></li>
    <div style='clear:both'></div>
  </ul>
</nav>
<script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-36251023-1']);
  _gaq.push(['_setDomainName', 'jqueryscript.net']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>

</body>
</html>