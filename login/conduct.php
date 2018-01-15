<!doctype html>
<html lang="zh">

<head>
    <meta charset="UTF-8">
    <title>Tool321 登录/注册</title>
    <meta name="keywords" content="Tool321,login,enroll">
    <meta name="description" content="Tool321 login">
    <base target="_blank">
    <link rel="stylesheet" type="text/css" href="/css/style_css.css">
    <link href="//cdn.bootcss.com/font-awesome/4.6.3/css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.2/css/bootstrap.min.css"
          integrity="sha384-y3tfxAZXuh4HwSYylfB+J125MxIs6mR5FOHamPBG064zB+AFeWH94NdvaCBm8qnd" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/4.0.0/normalize.css">
    <!--Growing I/O-->
    <script type='text/javascript'>
        var _vds = _vds || [];
        window._vds = _vds;
        (function () {
            _vds.push(['setAccountId', 'b60421688f19e848']);
            (function () {
                var vds = document.createElement('script');
                vds.type = 'text/javascript';
                vds.async = true;
                vds.src = ('https:' == document.location.protocol ? 'https://' : 'http://') + 'dn-growing.qbox.me/vds.js';
                var s = document.getElementsByTagName('script')[0];
                s.parentNode.insertBefore(vds, s);
            })();
        })();

    </script>
</head>


<body>
<nav class="navbar sticky-top  navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="/index.html">Tool<span style="color:red">3</span><span
                style="color:#FFEB63">2</span><span style="color:blue">1</span>.com&nbsp;&nbsp;<span class="small">Beta V0.89</span></a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo02"
            aria-controls="navbarTogglerDemo02" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarTogglerDemo02">
        <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
            <li class="nav-item active"><a class="nav-link" href="/en/index.html"><span class="tag tag-lg tag-danger">English</span><span
                            class="sr-only">(current)</span></a></li>
            <li class="nav-item">
                <a class="nav-link" href="/cn/i/statisticsdata.html"> <i class="fa fa-line-chart fa-lg"
                                                                         aria-hidden="true"></i>&nbsp;趋势·统计数据</a>
            </li>
            <li class="nav-item"><a class="nav-link" href="/login/login.html">登陆</a></li>
            <li class="nav-item"><a class="nav-link" href="/about.html">About</a></li>
        </ul>

        <form class="form-inline my-2 my-lg-0 float-xs-right" role="search" action="/cms/e/sch/index.php" method="GET"
              name="search_news" id="search_news" target="_blank">
            <input class="form-control mr-sm-2" type="text" placeholder="站内工具搜索" value="" onfocus="checkHttps"
                   name="keyboard" id="keyboard" size="20" aria-label="Search">


            <!--                <input type="submit" name="Submit22" value="搜索" />-->
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit" name="Submit22" value="搜索">搜工具</button>
        </form>

    </div>
</nav>
<ol class="breadcrumb" style="margin-bottom: 5px;">
    <li><a href="/">首页</a></li>
    <li><a href="#">登录/注册</a></li>
    <li class="active">登录</li>
</ol>


<?php
$name = $_POST['user_email'];
$password = $_POST['password'];

$con = mysql_connect("qdm208731188.my3w.com", "qdm208731188", "funnsy716057");
mysql_select_db('qdm208731188_db');
if (!$con) {
    die('Could not connect: ' . mysql_error());
}
mysql_select_db("my_db", $con);
mysql_query("INSERT INTO tool321_user (user_email, user_password) VALUES ('$name','$password')");
mysql_close($con);
echo "$name,感谢您注册使用Tool321！";
?>

<a href="/login/user.html">
    <?php
    echo "$name,个人设置"
    ?>
</a>
<footer>
    <!--QUALIFICAITON INFORMATION-->
    <div id="footer">
        <ul>
            <li>&copy;Copyright Reserved MIT Licence tool321.com</li>
            <li>Author:Horseback</li>
            <li>Twitter</li>
            <li><a target="_blank" href="http://mail.qq.com/cgi-bin/qm_share?t=qm_mailme&email=qNzHx8Sbmpno2dmGy8fF"
                   style="text-decoration:none;">Feedback</a></li>
            <li><a target="_blank" href="http://mail.qq.com/cgi-bin/qm_share?t=qm_mailme&email=qNzHx8Sbmpno2dmGy8fF"
                   style="text-decoration:none;">summit additional</a></li>
            <li>
                <!-- #BeginDate format:IS1m -->2016-04-1 15:25
                <!-- #EndDate -->
            </li>
            <li>
                <!--CNZZ统计-->
                <script type="text/javascript">
                    var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://");
                    document.write(unescape("%3Cspan id='cnzz_stat_icon_1257102666'%3E%3C/span%3E%3Cscript src='" + cnzz_protocol + "s4.cnzz.com/z_stat.php%3Fid%3D1257102666%26show%3Dpic1' type='text/javascript'%3E%3C/script%3E"));

                </script>
            </li>
        </ul>
    </div>
</footer>

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"
        integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh"
        crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"
        integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ"
        crossorigin="anonymous"></script>

</body>

</html>
