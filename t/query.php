<?php
    include '../login/mysql.php'; 
   $keyword = $_GET['query'];
    $result = mysql_query("SELECT * FROM tool321_tool WHERE tool_name like'%".$keyword."%' ORDER BY tool_add_datetime DESC"  );
    echo "<ul class='product-list reorderable'>";
            while($row = mysql_fetch_array($result)) {
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
                echo '<i class="marks mark-collect mark-collect-hide"></i>';
                echo '</a>';
                echo '</div>';
				//显示整个工具的profile链接
				echo '<a class="product-link" data-toggle="modal-remote" href="profile.php"></a>';
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

            } 
			//工具条目循环截止符
				echo "</ul>";
		//}
		//日期循环截止符
            mysql_close($con);
                ?>