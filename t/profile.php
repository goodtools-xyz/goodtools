<!DOCTYPE html>
<html lang="zh-cn">

<head>
  <title>NewTool | Tool321 </title>
  <link rel="stylesheet" media="all" href="//rs-assets.b0.upaiyun.com/assets/application-42c32762eecd4d5bbe1bf9fbe93ec812.css"
    data-turbolinks-track="true">
  <!-- meta -->
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="renderer" content="webkit">
  <link rel="shortcut icon" href="/favicon.ico">
  <!-- info -->
  <meta name="author" content="Tool321">
  <meta name="description" content="NewTool">
  <meta name="keywords" content="NewTool">
  <link rel="author" href="/humans.txt">

  <!--iOS -->
  <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
  <meta name="apple-mobile-web-app-title" content="Title">
  <meta name="apple-mobile-web-app-capable" content="yes">
  <meta name="apple-mobile-web-app-status-bar-style" content="black">
  <meta name="HandheldFriendly" content="True">
  <meta name="MobileOptimized" content="320">

  <!-- iOS Icons -->
  <link rel="apple-touch-icon-precomposed" href="//rs-assets.b0.upaiyun.com/assets/apple-touch-icon-57x57-precomposed-1da8545c70471b56426fa2cc67f530fb.png">
  <link rel="apple-touch-icon-precomposed" sizes="72x72" href="//rs-assets.b0.upaiyun.com/assets/apple-touch-icon-72x72-precomposed-49a257378535625c2714f61feb063a67.png">
  <link rel="apple-touch-icon-precomposed" sizes="114x114" href="//rs-assets.b0.upaiyun.com/assets/apple-touch-icon-114x114-precomposed-7990816b04e8690b7b7b004bcbd822a2.png">
  <link rel="apple-touch-icon-precomposed" sizes="144x144" href="//rs-assets.b0.upaiyun.com/assets/apple-touch-icon-144x144-precomposed-2571dd51f7ccb3a6a533e9aa812f29d2.png">
  <link rel="apple-touch-icon-precomposed" sizes="180x180" href="//rs-assets.b0.upaiyun.com/assets/apple-touch-icon-180x180-precomposed-8170abf429725528622d216ae0843bdd.png">
  <link rel="dns-prefetch" href="//fonts.googleapis.com">
  <link rel="dns-prefetch" href="//google-analytics.com">
  <link rel="dns-prefetch" href="//www.google-analytics.com">
  <link rel="dns-prefetch" href="//platform.twitter.com">

  <meta property='og:type' content='webpage' />

  <script type="text/javascript" src="jquery.i18n.properties-1.0.9.js"></script>
  <script type="text/javascript" src="tool.js"></script>
  <script src="//rs-assets.b0.upaiyun.com/assets/application-d63b5399e1ba247d4f5e0a676a5a6d41.js" data-turbolinks-track="true"></script>
  <script type="text/javascript" src="/js/baidutongji.js"></script>
  <script type="text/javascript" src="/js/cnzz.js"></script>

</head>

<script>
  document.title = "鲸鱼圈 - 有趣有料的互联网资讯平台，内容主要为科技资讯、干货知识、精品书单 - NEXT";
</script>

<script>
</script>
<header class="topbar top_v2">
  <h1 class="brand">
    <a id="logo" class="logo" href="/">
      NEXT
    </a>
    <span class="slogan">不错过任何一个新产品</span>
  </h1>

  <div class="header_inner cf">
    <a class="back_btn" data-toggle="modal-close" href="javascript:">
      <i class="back_arrow"></i> 返回
    </a>
  </div>
</header>

<div class="content row row-wider">
  <?php
        header("Content-type: text/html;charset=utf-8");

        $con = mysql_connect("qdm208731188.my3w.com", "qdm208731188", "funnsy716057");
        mysql_select_db('qdm208731188_db');
		if (!$con) {
			die('Could not connect: ' . mysql_error());
		}
		mysql_select_db("my_db", $con);
		mysql_query("set names utf8;");
    $result = mysql_query("SELECT * FROM tool321_tool WHERE tool_id='$_GET[id]'");
    $row = mysql_fetch_array($result);
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
                echo '<li class="item product-item ">';
                echo "<div class='posts-group cf'>";
                echo "<div class='upvote' data-note-id=" . $row['tool_id'] . ">";
                echo "<a class='upvote-link vote-up' rel='nofollow' data-method='put'  href='vote.php'>";
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
                echo '<img class="avatar " src="https://rs-images.b0.upaiyun.com/uploads/user/avatar/8865/b91ea628-d372-47c8-b37c-eb6972e348aa.png!50x50" alt="B91ea628 d372 47c8 b37c eb6972e348aa" width="60" height="60"/>';
                echo '</a>';
                echo '</div>';

                echo '<div class="user-tooltip">';
                echo '<a class="user-image-link" href="/users/8865">';
                echo '<img class="avatar avatar-big"
                                             src="https://rs-images.b0.upaiyun.com/uploads/user/avatar/8865/b91ea628-d372-47c8-b37c-eb6972e348aa.png!50x50"
                                             alt="B91ea628 d372 47c8 b37c eb6972e348aa" width="120" height="120"/>';
                echo '</a>';
                echo '<h3 class="user-nickname">' . $row['tool_creator'] . '</h3>';
                echo '<h4 class="user-title">Horseback<br></h4>';
                echo '<p class="user-bio">牛叉 - Designer</p>';
                echo '<a data-following-text="已关注" data-follow-text="关注" data-user-id="116"
                                       data-toggle="follow" class="follow-btn" data-remote="true" rel="nofollow"
                                       data-method="post" href="/users/116/follow">关注</a>';
                echo '</div>';

                echo '<div class="product-comment">';
                echo '<a target="_blank" class="product-comments" data-toggle="modal-remote" href="/posts/40438?ok_url=%2Fposts#comments">4</a>';
                echo '</div>';
                echo "</li>";

                echo "</ul>";
                echo "</li>";
                

            
			//工具条目循环截止符
				echo "</ul>";
		//}
 mysql_close($con);
 ?>
 <div class="tool-information">
        <ul class="tool-information-item">
          <li class="tool-id">
            <b>ID:</b>
          </li>
          <li class="tool-name">
            <b>工具名称：</b>
          </li>
          <li class="tool-url">
            <b>官网：</b>
          </li>
          <li class="tool-introduction">
            <b>简介：</b>
          </li>
          <li class="tool-creator">
            <b>创建人：</b>
          </li>
          <li class="tool-add-datetime">
            <b>收录日期：</b>
          </li>
          <li class="tool-voted-count">
            <b>欢迎指数：</b>
          </li>
          <li class="tool-system-support">
            <b>支持系统：</b>
          </li>
          <li class="tool-country">
            <b>国家/地区：</b>
            <form>
              选择一个国家或地区:
              <select name="users" onchange="showcountry(this.value)">
                <option value="1">中国</option>
                <option value="2">美国</option>
                <option value="3">印度</option>
                <option value="4">其它</option>
              </select>
            </form>
          </li>
          <li class="tool-category">
            <b>类别：</b>
            <form>
              选择一个类别:
              <select name="users" onchange="showcategory(this.value)">
                <option value="1">Word</option>
                <option value="2">Excel</option>
                <option value="3">Powerpoint</option>
                <option value="4">Access</option>
              </select>
            </form>
          </li>
          <li class="tool-description">
            <b>描述：</b>
          </li>
          <li class="tool-other">
            <b>其它：</b>
          </li>
          <li class="tool-comment">
            <b>评论：</b>
          </li>

        </ul>
      </div>

    <div class="product-sidebar">
      <div class="date" title="2018年2月03日">
        <span class="cal">
          <i class="month">Feb</i>
          <i class="day">3</i>
        </span>
        <small>2月03日</small>
      </div>
      <a class="product-sidebar-up btn hidden" href="javascript:">
        <i class="up_arrow"></i>
      </a>
      <div class="product-lists">

        <ul style='top: -0px' data-notes-per-page='6' data-current-page='1'>
          <li>
            <a class="product-sidebar-url" data-toggle="modal-remote" href="/posts/40923?ok_url=%2Fposts">豆包酷讯</a>
          </li>
          <li>
            <a class="product-sidebar-url" data-toggle="modal-remote" href="/posts/40919?ok_url=%2Fposts">喵喵折</a>
          </li>
          <li class="active">
            <a class="product-sidebar-url" data-toggle="modal-remote" href="/posts/40924?ok_url=%2Fposts">鲸鱼圈</a>
          </li>
        </ul>
      </div>

      <a class="product-sidebar-down btn hidden" href="javascript:">
        <i class="down_arrow"></i>
      </a>
    </div>

    <section class="product cf">
      <ul class="product-list">
        <li class="product-item">
          <div class="posts-group cf row">
            <div class="upvote  " data-note-id="40924">
              <a class="upvote-link vote-up" data-remote="true" data-type="html" rel="nofollow" data-method="put" href="/posts/40924/vote">
                <i class="upvote-arrow"></i>
                <span class="vote-count">1</span>
              </a>
            </div>

            <div class="product-url">
              <a class="post-url" target="_blank" title="jingyu.in" ref="nofollow" href="/posts/40924/hit">鲸鱼圈</a>
              <br>
              <span class="post-tagline">有趣有料的互联网资讯平台，内容主要为科技资讯、干货知识、精品书单</span>
            </div>
            <ul class="product-meta right">

              <li class="product-collect">
                <div class="mark">
                  <a class="popup" href="/posts/collections/to_add?note_id=40924">
                    <i class="marks mark-collect "></i>
                  </a>
                </div>
              </li>




              <li class="product-avatar">
                <div class="user-image">
                  <a class="user-image-link" href="/users/212195">
                    <img class="avatar " src="//rs-assets.b0.upaiyun.com/assets/fallback/user-86922c18c005db5e716b45e6ffd9169b.png" alt="User"
                      width="60" height="60" />
                  </a>
                </div>

                <div class="user-tooltip">
                  <a class="user-image-link" href="/users/212195">
                    <img class="avatar avatar-big" src="//rs-assets.b0.upaiyun.com/assets/fallback/user-86922c18c005db5e716b45e6ffd9169b.png"
                      alt="User" width="120" height="120" />
                  </a>
                  <h3 class="user-nickname">
                    新用户921474
                  </h3>
                  <h4 class='user-title'>
                    鲸鱼圈 - 打杂
                    <br>
                  </h4>
                  <p class="user-bio">
                    Http://www.jingyu.in
                  </p>

                </div>

              </li>

            </ul>
          </div>
        </li>
      </ul>

      <div class="tool-information">
        <ul class="tool-information-item">
          <li class="tool-id">
            <b>ID:</b>
          </li>
          <li class="tool-name">
            <b>工具名称：</b>
          </li>
          <li class="tool-url">
            <b>官网：</b>
          </li>
          <li class="tool-introduction">
            <b>简介：</b>
          </li>
          <li class="tool-creator">
            <b>创建人：</b>
          </li>
          <li class="tool-add-datetime">
            <b>收录日期：</b>
          </li>
          <li class="tool-voted-count">
            <b>欢迎指数：</b>
          </li>
          <li class="tool-system-support">
            <b>支持系统：</b>
          </li>
          <li class="tool-country">
            <b>国家/地区：</b>
            <form>
              选择一个国家或地区:
              <select name="users" onchange="showcountry(this.value)">
                <option value="1">中国</option>
                <option value="2">美国</option>
                <option value="3">印度</option>
                <option value="4">其它</option>
              </select>
            </form>
          </li>
          <li class="tool-category">
            <b>类别：</b>
            <form>
              选择一个类别:
              <select name="users" onchange="showcategory(this.value)">
                <option value="1">Word</option>
                <option value="2">Excel</option>
                <option value="3">Powerpoint</option>
                <option value="4">Access</option>
              </select>
            </form>
          </li>
          <li class="tool-description">
            <b>描述：</b>
          </li>
          <li class="tool-other">
            <b>其它：</b>
          </li>
          <li class="tool-comment">
            <b>评论：</b>
          </li>

        </ul>
      </div>

      <div class="product-make cf">
        <ul class='left cf'>
          <li class="product-icon product-chuang"></li>
          <a class="product-icon product-chuang-add popup" id="claim_maker" href="/posts/40924/makers/new"></a>
        </ul>

        <div class="share">
          <div>分享到:</div>

          <div class="share-wechat">
            <a title="微信扫码后分享" href="javascript:void(0)">
              <i class="svg-wechat share-wechat-colored"></i>
              <span>微信</span>
            </a>
            <div class="dropdown share-dropdown">
              <img src="http://api.qrserver.com/v1/create-qr-code/?data=http%3A%2F%2Fnext.36kr.com%2Fposts%2F40924%3Fshow_wechat_share_tip%3Dtrue&amp;size=156x156"
                alt="?data=http%3a%2f%2fnext.36kr" width="156" height="156" />
              <span>微信扫一扫：分享</span>
            </div>
          </div>
          <div class="share-weibo">
            <a title="点击分享到微博" target="_blank" href="http://service.weibo.com/share/share.php?searchPic=false&amp;title=%E9%B2%B8%E9%B1%BC%E5%9C%88+-+%E6%9C%89%E8%B6%A3%E6%9C%89%E6%96%99%E7%9A%84%E4%BA%92%E8%81%94%E7%BD%91%E8%B5%84%E8%AE%AF%E5%B9%B3%E5%8F%B0%EF%BC%8C%E5%86%85%E5%AE%B9%E4%B8%BB%E8%A6%81%E4%B8%BA%E7%A7%91%E6%8A%80%E8%B5%84%E8%AE%AF%E3%80%81%E5%B9%B2%E8%B4%A7%E7%9F%A5%E8%AF%86%E3%80%81%E7%B2%BE%E5%93%81%E4%B9%A6%E5%8D%95+-+NEXT&amp;url=http%3A%2F%2Fnext.36kr.com%2Fposts%2F40924%3Ft%3D2018-02-03T14%253A32%253A11%252B08%253A00%26uid%3D155176%26utm_campaign%3Dpost_show%26utm_content%3Dshare_button%26utm_medium%3Dnext%26utm_source%3Dweibo">
              <i class="svg-weibo share-weibo-colored"></i>
              <span>微博</span>
            </a>
          </div>


        </div>
      </div>



      <div class="upvotes">
        <h2>1人觉得很赞：</h2>
        <ul class="upvote-users cf">
          <li class="product-avatar">
            <div class="user-image">
              <a class="user-image-link" href="/users/212195">
                <img class="avatar " src="//rs-assets.b0.upaiyun.com/assets/fallback/user-86922c18c005db5e716b45e6ffd9169b.png" alt="User"
                  width="60" height="60" />
              </a>
            </div>

            <div class="user-tooltip">
              <a class="user-image-link" href="/users/212195">
                <img class="avatar avatar-big" src="//rs-assets.b0.upaiyun.com/assets/fallback/user-86922c18c005db5e716b45e6ffd9169b.png"
                  alt="User" width="120" height="120" />
              </a>
              <h3 class="user-nickname">
                新用户921474
              </h3>
              <h4 class='user-title'>
                鲸鱼圈 - 打杂
                <br>
              </h4>
              <p class="user-bio">
                Http://www.jingyu.in
              </p>

            </div>

          </li>
        </ul>
      </div>

    </section>


    <section class="comments comments-right" id="comments" data-search-users-url="/posts/40924/search_users.json">
      <!-- Search: <input type="text" id="mention_user_selector" class="input-small"> -->
      <h4>评论 (
        <span class="comments-count">0</span>)</h4>

      <form class="simple_form comment" data-remote="true" data-toggle="fetch" data-type="html" action="/posts/40924/comments"
        accept-charset="UTF-8" method="post">
        <input name="utf8" type="hidden" value="&#x2713;" />
        <input type="hidden" name="authenticity_token" value="ilFvdPUYwQB70yZkqJ57Qzta1/mcthQSDy5PSZNKnToOECvwzZ14xqDdrUjT6E8Ds1K7Bj5I2ranRwhmNruQ1w=="
        />
        <input type="hidden" name="ok_url" id="ok_url" value="/posts/40924?ok_url=%2Fposts" />
        <div class="form-group hidden comment_content">
          <input class="hidden form-control input-big" type="hidden" name="comment[content]" id="comment_content" />
        </div>
        <div contenteditable="true" class="input-big mention editable-comment form-control" data-for="comment[content]" required="required"
          mentionable="true">

        </div>
        <input type="submit" name="commit" value="发表评论" class="btn submit" />
        <a class="btn btn-info add-image comment-image-uploader" href="javascript:">
          <img src="//rs-assets.b0.upaiyun.com/assets/add-image-0a337f8539ac98f00e1f4ffe047dd19a.svg" alt="Add image" width="20" height="20"
          />
        </a>
        <span class="help-inline right">
          <i class="icon-markdown"></i> 支持Markdown语法
        </span>

      </form>
      <div id="comments_wrapper_edac278dd1091054c15ba70b1b625dca" data-url='/posts/40924/comments.html?ok_url=%2Fposts%2F40924%3Fok_url%3D%252Fposts'>
        <div class="pagination cf">
          评论加载中..
        </div>
        <script>
          //<![CDATA[

          $('#comments_wrapper_edac278dd1091054c15ba70b1b625dca').trigger('next:load-comments');

          //]]>
        </script>
      </div>
    </section>

    <div id="mention_wrapper"></div>

</div>