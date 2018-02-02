<script type="text/javascript">
    $(function () {
        document.getElementById("ifm").src ="$tool_url";//Url地址
        $("#ifm").load(function () {
            var h = document.body.clientHeight;
            var w = document.body.clientWidth;
            document.getElementById("ifm").height = h + "px";
            document.getElementById("ifm").width = w + "px";
            $tool_description = document.getElementsByTagName('meta["description"]').getAttribute("content");
        });
    })
    </script>
