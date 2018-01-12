<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>
<body>
<div class="popup_cont" style="opacity: 1; top: -97px; left: 424.5px;">
    <div class="popup flip-wrapper">
        <div class="popup_content">
            <div class="note-form-wrapper">
                <div class="note-form">
                    <div class="popup_title">
                        分享新产品
                    </div>


                    <form class="simple_form form-margin-top" id="new_note" data-remote="true" data-type="html"
                          data-toggle="fetch" data-target=".popup_content" action="/posts" accept-charset="UTF-8"
                          method="post"><input name="utf8" value="✓" type="hidden"><input name="authenticity_token"
                                                                                          value="2eVamDcu89lYN0EKEGIOSltvb8RwsPfcByEXpCIQxniUCfx6Svnet38dpgguXhvb0kOqa1VtmpBOBZjwmEeb4Q=="
                                                                                          type="hidden">

                        <input name="force" id="force" type="hidden">

                        <div class="hide hidden note_source"><input value="direct" class="hidden form-control"
                                                                    name="note[source]" id="note_source" type="hidden">
                        </div>
                        <div class="form-group string required note_title"><label class="string required"
                                                                                  for="note_title">产品名称</label><input
                                    class="string required form-control input-small" required="required"
                                    aria-required="true" placeholder="如：Startup Base" name="note[title]" id="note_title"
                                    type="text"></div>
                        <div class="form-group url required note_url"><label class="url required"
                                                                             for="note_url">产品官网</label><input
                                    class="string url required form-control input-small" required="required"
                                    aria-required="true" placeholder="以 http:// 开头的有效网址" name="note[url]" id="note_url"
                                    type="url"></div>
                        <div class="form-group text required note_summary"><label class="text required"
                                                                                  for="note_summary">一句话描述这个产品</label><textarea
                                    class="text required form-control input-small" required="required"
                                    aria-required="true" name="note[summary]" id="note_summary"></textarea>
                            <p class="help-block">请精简描述, 36字以内</p></div>

                        <button name="button" type="submit" class="btn submit product-btn">提交</button>
                    </form>
                </div>
                <div class="note-similars">
                </div>
            </div>
        </div>
    </div>
    <div class="popup_close">×</div>
</div>
</body>
</html>