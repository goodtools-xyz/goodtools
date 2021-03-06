<!DOCTYPE html>
<html lang="zh">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Goodtools - 区块链·数字货币</title>
    <meta name="description" content="区块链·比特币资讯、投资工具">
    <meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
    <base target="_blank">
    <link rel="stylesheet" href="/css/flex.css">
    <link rel="stylesheet" href="/css/nav.css">

    <script type="text/javascript" src="/js/tab.js"></script>



</head>

<body>
    <?
include '../../cn/nav.html';
?>

        <div class="check-box">

            <span>
                <input type="checkbox" name="check-box" id="check-box" onclick="hiddentip()">隐藏工具提示
        </div>

        <div class="tool-box">

            <br>
            <ul class="nav nav-tabs nav-justified" role="tablist">
                <li class="nav-item active">
                    <a class="nav-link active" href="#tab1" data-toggle="tab">区块链资讯</a>
                </li>
                <li class="nav-item ">
                    <a class="nav-link " href="#tab2" data-toggle="tab">行情</a>
                </li>
                <li class="nav-item ">
                    <a class="nav-link " href="#tab3" data-toggle="tab">指数</a>
                </li>
                <li class="nav-item ">
                    <a class="nav-link" href="#tab4" data-toggle="tab">链圈</a>
                </li>
            </ul>
            <div id="myTabContent" class="tab-content">
                <div id="tab1" class="tab-pane active">
                    <nav class="sub-nav">中文资讯</nav>
                    <ul class="tab">
                        <li>
                            <a href="http://www.tuoniaox.com/">
                                <span class="tool-name">鸵鸟区块链</span>
                            </a>
                            <p class="tool-introduction ">24H不间断，最及时的区块链海内外资讯</p>
                        </li>
                        <li>
                            <a href="http://www.jinse.com">
                                <span class="tool-name">金色财经</span>
                            </a>
                            <p class="tool-introduction ">7*24H区块链比特币资讯</p>
                        </li>
                        <li>
                            <a href="https://new.qq.com/tag/276813">
                                <span class="tool-name">腾讯新闻·区块链</span>
                            </a>
                            <p class="tool-introduction ">腾讯新闻科技频道下专属区块链新闻信息</p>
                        </li>
                        <li>
                            <a href="http://chainb.com/">
                                <span class="tool-name">铅笔</span>
                            </a>
                            <p class="tool-introduction ">ChainB,探讨数字货币和数字金融对于未来经济的重大影响</p>
                        </li>
                        <li>
                            <a href="http://www.8btc.com/">
                                <span class="tool-name">巴比特</span>
                            </a>
                            <p class="tool-introduction ">服务于区块链创新者的综合平台</p>
                        </li>
                        <li>
                            <a href="http://www.ccidnet.com/">赛迪网</a>
                            <p class="tool-introduction ">中国最权威的IT门户网站之一,中国信息产业风向标官网</p>
                        </li>
                        <li>
                            <a href="https://www.bianews.com">Bia News</a>
                            <p tool-introduction>隶属于中国最大的自媒体公司WeMedia旗下的领先区块链资讯平台</p>
                        </li>

                    </ul>
                    <nav class="sub-nav">英文资讯</nav>
                    <ul class="tab">
                        <li>
                            <a href="http://www.coindesk.com">
                                <span class="tool-name">Coindesk</span>
                            </a>
                            <p class="tool-introduction ">国外区块链资讯第一网站</p>
                        </li>
                        <li>
                            <a href="https://thebitcoinnews.com/">
                                <span class="tool-name ">Bitcoin News</span>
                            </a>
                            <p class="tool-introduction "></p>
                        </li>
                    </ul>
                </div>
                <div id="tab2" class="tab-pane" role="tabpanel">
                    <nav class="sub-nav">行情</nav>
                    <ul class="tab ">
                        <li>
                            <a href=" ">
                                <span class="tool-name ">行情</span>
                            </a>
                            <p class="tool-introduction ">待推出</p>
                        </li>
                        <li></li>
                        <li></li>
                        <li></li>
                        <li></li>
                    </ul>
                </div>
                <div id="tab3" class="tab-pane" role="tabpanel">
                    <nav class="sub-nav">指数</nav>

                    <ul class="tab ">

                        <li>
                            <a href="http://special.ccidnet.com/pub-bc-eval/index.shtml">
                                <span>赛迪全球公有链技术评估指数</span>
                            </a>
                            <p></p>
                        </li>
                        <li></li>
                        <li></li>
                        <li></li>
                    </ul>
                </div>
                <div id="tab4" class="tab-pane" role="tabpanel">
                    <nav class="sub-nav">链圈</nav>

                    <ul class="tab ">
                        <li>
                            <a href="http://www.8btc.com/">
                                <span class="tool-name ">巴比特</span>
                            </a>
                            <p class="tool-introduction ">区块链创新者社区</p>
                        </li>
                        <li></li>
                        <li></li>
                        <li></li>
                    </ul>
                </div>
            </div>
            <ul class="nav nav-tabs" role="tablist">
                <li class="nav-item ">
                    <a class="nav-link active" href="#bitcoin" data-toggle="tab">数字货币</a>
                </li>
                <li class="nav-item ">
                    <a class="nav-link active" href="#exchange" data-toggle="tab">交易所</a>
                </li>
                <li class="nav-item ">
                    <a class="nav-link " href="#pocket" data-toggle="tab">钱包</a>
                </li>
                <li class="nav-item ">
                    <a class="nav-link " href="#mine" data-toggle="tab">矿机</a>
                </li>
                <li class="nav-item ">
                    <a class="nav-link " href="#minepool" data-toggle="tab">矿池</a>
                </li>
                <li class="nav-item ">
                    <a class="nav-link disabled " href="#" data-toggle="tab">币圈</a>
                </li>
            </ul>
            <div id="myTabContent" class="tab-content">
                <div id="pocket" class="tab-pane" role="tabpanel">
                    <nav class="sub-nav">数字货币</nav>

                    <ul class="tab ">
                        <li>
                            <a href="https://bitcoin.org">BTC 比特币</a>
                            <p>第一代数字货币代表-比特币官网</p>
                        </li>
                        <li><a href="https://www.ethereum.org">ETH 以太坊分叉币</a>
                        <p>第二代数字货币代表-Ethereum官网</p></li>
                        <li>
                        <a href="https://eos.io">EOS</a>
                        <p>第三代数字货币代表-EOS官网</p></li>
                        <li><a href="https://tether.to">USDT 泰达币</a><p>Tether公司推出的基于稳定价值货币美元（USD）的代币，1USDT=1美元</p></li>
                        
                    </ul>
                </div>
                <div id="bitcoin" class="tab-pane active">
                    <nav class="sub-nav">交易所</nav>

                    <ul class="tab">
                        <li>
                            <a href="http://www.bitfinex.com">
                                <span class="tool-name">Bitfinex</span>
                            </a>
                            <p class="tool-introduction ">全世界最大的数字货币交易平台</p>
                        </li>
                        <li>
                            <a href="https://www.hbg.com/">
                                <span class="tool-name">火币网</span>
                            </a>
                            <p class="tool-introduction ">中国最大的比特币(BTC)、莱特币(LTC)、以太坊(ETH)、以太坊经典(ETC)交易平台</p>
                        </li>
                        <li>
                            <a class="tool-name" href="https://www.binance.com">币安网</a>
                            <p class="tool-introduction">目前币币交易量是世界排名第一的网站</p>
                        </li>
                        <li>
                            <a href="https://www.btctrade.com/">
                                <span class="tool-name">比特币交易网</span>
                            </a>
                            <p class="tool-introduction "></p>
                        </li>
                        <li>
                            <a href="http://thegenesisblock.com"></a>
                            <p></p>
                        </li>
                        <li><a href="https://gocoin.com">GoCoin</a></li>
                    </ul>
                </div>
                <div id="pocket" class="tab-pane" role="tabpanel">
                    <nav class="sub-nav">钱包</nav>

                    <ul class="tab ">
                        <li>
                            <a href="https://www.mytokenpocket.vip">
                                <span class="tool-name ">TokenpPocket</span>
                            </a>
                            <p class="tool-introduction "></p>
                        </li>
                        <li>
                            <a href="https://etherscan.io">什么值得挖</a>
                        </li>
                        <li></li>
                        <li></li>
                        <li></li>
                    </ul>
                </div>
                <div id="mine" class="tab-pane" role="tabpanel">
                    <nav class="sub-nav">矿机</nav>

                    <ul class="tab">
                        <li>
                            <a href="https://shop.bitmain.com.cn">
                                <span class="tool-name ">比特大陆</span>
                            </a>
                            <p class="tool-introduction">三大矿机厂商之一</p>
                        </li>
                        <li>
                            <a href="http://www.canaan-creative.com">嘉楠耘智</a>
                            <p class="tool-introduction">三大矿机厂商之一</p>
                        </li>
                        <li>
                            <a href="http://mall.ebang.com.cn">亿邦国际</a>
                            <p class="tool-introduction">三大矿机厂商之一</p>
                        </li>

                        <li>
                            <a href="https://www.cybtc.com">彩云比特</a>
                            <p class="tool-introduction">比特币矿机中文资讯第一门户网站</p>
                        </li>
                        <li></li>
                    </ul>
                </div>

            </div>
            <div id="minepool" class="tab-pane" role="tabpanel">
                <nav class="sub-nav">矿池</nav>

                <ul class="tab">
                    <li>
                        <a href="http://huobipool.com">
                            <span class="tool-name ">火币矿池</span>
                        </a>
                        <p class="tool-introduction">EOS节点投票，超级社区，POW矿池,Dapp</p>
                    </li>
                </ul>
            </div>
            <ul class="nav nav-tabs" role="tablist">
                <li class="nav-item ">
                    <a class="nav-link active" href="#application" data-toggle="tab">应用</a>
                </li>
                <li class="nav-item ">
                    <a class="nav-link " href="#" data-toggle="tab">以太坊</a>
                </li>
            </ul>



            <div id="knowledge" class="tab-pane active" role="tabpanel">
                <nav class="sub-nav">应用</nav>

                <ul class="tab">
                    <li>
                        <a href="https://www.stateofthedapps.com">
                            <span class="tool-name ">State of the Dapps</span>
                        </a>
                        <p class="tool-introduction ">去中心化的以太坊应用列表</p>
                    </li>
                    <li>
                        <a href="https://star.8.163.com/">
                            <span class="tool-name ">网易星球</span>
                        </a>
                        <p class="tool-introduction ">网易严选出品，品质保证</p>
                    </li>
                    <li></li>
                    <li></li>
                    <li></li>
                </ul>
            </div>
        </div>

        <ul class="nav nav-tabs" role="tablist">
            <div class="tab-content">

                <li class="nav-item ">
                    <a class="nav-link active" href="#knowledge" data-toggle="tab">知识库</a>
                </li>
                <li class="nav-item ">
                    <a class="nav-link " href="#friendlink" data-toggle="tab">友情链接</a>
                </li>

        </ul>
        <div class="tab-content">

            <div id="knowledge" class="tab-pane active" role="tabpanel">
                <nav class="sub-nav"></nav>

                <ul class="tab">
                    <li>
                        <a href=" ">
                            <span class="tool-name ">比特币视频</span>
                        </a>
                        <p class="tool-introduction ">一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十一二三四五六</p>
                    </li>
                    <li>
                        <a href="https://bitcoin.org/zh_CN/">
                            <span class="tool-name ">比特币入门指南</span>
                        </a>
                        <p class="tool-introduction ">比特币官网的中文入门指南</p>
                    </li>
                    <li></li>
                    <li></li>
                    <li></li>
                </ul>
            </div>

            <div id="friendlink" class="tab-pane" role="tabpanel">
                <nav class="sub-nav"></nav>

                <ul class="tab ">

                    <li>
                        <a href="https://www.block123.com">
                            <span class="tool-name">Block123 区块链导航</span>
                        </a>
                        <p class="tool-introduction ">区块链上网门户导航, 以太坊比特币数字货币资产网址大全</p>
                    </li>
                    <li>
                        <a href="https://www.btc123.com">
                            <span class="tool-name">BTC123 比特币导航</span>
                        </a>
                        <p class="tool-introduction ">专业的比特币(bitcoin)网址导航,全面汇集比特币相关网站,提供最新比特币资讯以及实时价格行情、K线图</p>
                    </li>
                    <li>
                        <a href="http://www.5bite.com/category-17.html">
                            <span class="tool-name">区块链之家</span>
                        </a>
                        <p class="tool-introduction ">区块链产业链内容分发、应用分享及点评平台</p>
                    </li>
                    <li>
                        <a href="https://www.cybtc.net">
                            <span>彩云导航</span>
                        </a>
                    </li>
                    <li></li>
                </ul>
            </div>

        </div>
        </div>




        <script type="text/javascript">
            gettoolico();
        </script>
        <?
include '../../cn/footer.html';
?>
</body>

</html>