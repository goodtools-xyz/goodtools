<!doctype html>
<?php session_start(); ?>
<?php setcookie("user", "tool321@qq.com", time()+3600);?>
<html lang="zh-cn">

<head>
    <title>Discovery-不错过任何一个好工具 | goodtools </title>
    <!-- meta -->
    <meta charset="utf-8">


    <meta property='og:type' content='webpage' />

    <script type="text/javascript" src="jquery.i18n.properties-1.0.9.js"></script>
    <script type="text/javascript" src="tool.js"></script>
    <script type="text/javascript" src="vote.js"></script>
    <script type="text/javascript" src="/js/baidutongji.js"></script>

</head>

<body>
    <div class="container" id='container'>
        <header class="topbar top_v2">
            <div class="header_inner cf">
                <nav class="navigation text-center">
                    <ul>
                        <li class="notification-menu" id="notification_center">
                            <a data-remote="true" data-type="html" class="main-nav normal-nav trigger"
                                href="/notifications">
                                <i class="icon_alert"></i>
                            </a> <i class="unread hide"></i>
                            <div class="dropdown notification-dropdown">
                                <ul class="cf">
                                    <li>加载中...</li>
                                </ul>
                                <footer class="notification-footer cf">
                                    <a class="left clear-all" data-method="put" data-remote="true"
                                        href="/notifications/clear">清空</a>
                                    <a class="right" href="/notifications">查看全部</a>
                                </footer>
                            </div>
                        </li>

                        <li class="account login-menu">
                            <a class="account-menu main-nav" href="javascript:">
                                <img class="avatar"
                                    src="//rs-assets.b0.upaiyun.com/assets/fallback/user-86922c18c005db5e716b45e6ffd9169b.png"
                                    alt="User" width="30" height="30" />
                                <i class="down_arrow"></i>
                            </a>
                            <ul class="dropdown account-dropdown">
                                <li><a href="/login/user_profile.php">我的主页</a></li>
                                <li><a href="/login/user_profile.php">个人设置</a></li>
                                <li><a rel="nofollow" data-method="delete" href="/login/log_out.php">退出登录</a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </nav>
                <div class="search">
                    <form action="search.php" accept-charset="UTF-8" method="get"><input name="utf8" type="hidden"
                            value="&#x2713;" />
                        <span class="icon">🔎</span>
                        <input type="text" name="query" id="query" autocomplete="off" autocapitalize="off"
                            spellcheck="false" />
                    </form>
                </div>
            </div>
        </header>


        <div class="header_nav">
            <div class="header_inner">
                <div class="left">

                    <ul class='nav' data-toggle='fetch' data-target="#content">
                        <li class="active">
                            <a href="/posts">工具</a>
                        </li>
                        <li>
                            <a href="/users/feeds">发现</a>
                        </li>
                        <li>
                            <a href="/posts/collections">工具集</a>
                        </li>
                    </ul>
                </div>
                <div class="right">
                    <ul class="nav">
                        <li>
                            <a class="next-app" target="_blank"
                                href="http://a.app.qq.com/o/simple.jsp?pkgname=com.android36kr.next.app&amp;g_f=991653">
                                <i class="icon_iphone"></i>
                                <div class="app-tooltip">
                                    <img class="qrcode"
                                        src="//rs-assets.b0.upaiyun.com/assets/apps-qrcode-d674c192c030184d645fe2615c9add01.jpg"
                                        alt="Apps qrcode" width="120" height="120" />
                                    <p class="app-download-text">扫码下载 App</p>
                                </div>
                            </a></li>
                        <li>
                            <a class="create_btn popup new-product" href="add.php">
                                <i class="icon_plus"></i> 分享新工具
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>

        <div class="content row row-wider" id="content">


            <div class="post-sort" id="category_swicher">
                <ul class='post-hot-ul'>
                    <li>
                        <a class="post-mainland right " href="/posts/categories/internal">
                            <i class="tick-circle"></i> 可用
                        </a></li>
                    <li>
                        <a class="post-mainland right" href="/posts?sort=hot">
                            最热 <i class="down_arrow"></i>
                        </a>
                        <ul class="dropdown post-dropdown">
                            <li>
                                <a href="/posts?sort=latest">最新</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a class="post-mainland right " href="/posts/categories/internal">
                            <i class="tick-circle"></i> 国内
                        </a></li>
                </ul>
            </div>

            <?php
        header("Content-type: text/html;charset=utf-8");
        include '../login/mysql.php';
		$result = mysqli_query($con,"SELECT * FROM goodtools_tool ORDER BY tool_add_datetime DESC");
        //$row = mysql_fetch_array($result);
		
		
        //                日期显示循环
		//for($riqi=date("Y-m-d"); $riqi<=10; $riqi--)
		//{ //日期循环开始符
        echo '<section class="post">';
        echo "<div class='date' title=" . date("Y-m-d") . ">";
        echo '<span class="cal">';
        echo '<i class="month">' . date("M") . '</i>';
        echo '<i class="day">' . date("j") . '</i>';
        echo '</span>';
        echo "<small>";
		//按日期进行分节
        echo date("n") . "月" . date("j") ."日";
        echo "</small>";
        echo '</div>';
        //                日期

		echo "<ul class='product-list reorderable'>";

            while($row = mysqli_fetch_array($result)) {

                
                echo '<li class="item product-item ">';
                echo "<div class='posts-group cf'>";
                echo "<div class='upvote' onclick='vote()' data-note-id=" . $row['tool_id'] . ">";
                echo "<a class='upvote-link vote-up' rel='nofollow' data-method='put'  href='vote.php?id=".$row['tool_id']."'>";
                //href='/user/sign_in?ok_url=%2Fposts'
                echo "<i class='upvote-arrow'>";
                echo "</i>";
                echo "<span class='vote-count'>" . $row['tool_voted_count'] . "</span>";
                echo "</a>";
                echo "</div>";
                echo "<div class='product-url'><a class='post-url' target='_blank' title=" . $row['tool_url'] . " ref='nofollow' data-client='null' href=" . $row['tool_url'] . ">" . $row['tool_name'] . "</a>";
				echo "<br>";
                echo "<span class='post-tagline'>" . $row['tool_introduction'] . "</span>";
				echo "</div>";
                echo "<ul class='product-meta right'>";
                echo "<li class='product-collect'>";
                echo "<div class='mark'>";
                echo '<a class="popup" href="/posts/collections/to_add?note_id=40449">';
                echo ' <i class="marks mark-collect mark-collect-hide"></i>';
                echo '</a>';
                echo '</div>';
				//显示整个工具的profile链接,bug，点击无法跳转详情页
                echo '<a class="product-link"  data-toggle="modal-remote" href="profile.php?id='.$row['tool_id'].'"></a>';
                /* echo '<a href="profile.php?id=<?php echo $rs->id?>"></a>'; */
            echo "</li>";

            echo "<li class='product-mark'>";
                echo '<div class="mark" title="的团队成员已经入驻 NewTool，你的评论反馈会被关注和回复">';
                    echo '<i class="marks mark-founder"></i>';
                    echo '</div>';
                echo "</li>";

            echo "<li class='product-mark'>";
                echo '<div class="mark" title="适用于 iOS 平台">';
                    echo '<i class="marks mark-ios"></i>';
                    echo '</div>';
                echo "</li>";

            echo "<li class='product-mark'>";
                echo '<div class="mark" title="适用于 iOS 平台">';
                    echo '<i class="marks mark-android"></i>';
                    echo '</div>';
                echo "</li>";

            echo '<li class="product-avatar">';
                echo '<div class="user-image">';
                    echo '<a class="user-image-link" href="/users/8865">';
                        echo '<img class="avatar "
                            src="https://rs-images.b0.upaiyun.com/uploads/user/avatar/8865/b91ea628-d372-47c8-b37c-eb6972e348aa.png!50x50"
                            alt="B91ea628 d372 47c8 b37c eb6972e348aa" width="60" height="60" />';
                        echo '</a>';
                    echo '</div>';

                echo '<div class="user-tooltip">';
                    echo '<a class="user-image-link" href="/users/8865">';
                        echo '<img class="avatar avatar-big"
                            src="https://rs-images.b0.upaiyun.com/uploads/user/avatar/8865/b91ea628-d372-47c8-b37c-eb6972e348aa.png!50x50"
                            alt="B91ea628 d372 47c8 b37c eb6972e348aa" width="120" height="120" />';
                        echo '</a>';
                    echo '<h3 class="user-nickname">' . $row['tool_creator'] . '</h3>';
                    echo '<h4 class="user-title">Horseback<br></h4>';
                    echo '<p class="user-bio">牛叉 - Designer</p>';
                    echo '<a data-following-text="已关注" data-follow-text="关注" data-user-id="116" data-toggle="follow"
                        class="follow-btn" data-remote="true" rel="nofollow" data-method="post"
                        href="/users/116/follow">关注</a>';
                    echo '</div>';

                echo '<div class="product-comment">';
                    echo '<a target="_blank" class="product-comments" data-toggle="modal-remote"
                        href="/posts/40438?ok_url=%2Fposts#comments">4</a>';
                    echo '</div>';
                echo "</li>";

            echo "</ul>";
            echo "</li>";


            }
            //工具条目循环截止符
            echo "</ul>";
            //}
            //日期循环截止符
            mysql_close($con);

            ?>
            </section>
        </div>
        <script type="text/javascript" src="/js/cnzz.js"></script>

</body>