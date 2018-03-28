
SET NAMES UTF8;

DROP DATABASE IF EXISTS lecake;

CREATE DATABASE lecake CHARSET=UTF8;

USE lecake;

CREATE TABLE lc_user(
	uid INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	uname VARCHAR(32),
	upwd VARCHAR(32)
);
#创建产品信息表
CREATE TABLE lc_product(
    pid INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    pname    VARCHAR(32),
    pnameen  VARCHAR(32),
    price    VARCHAR(32),
    details  VARCHAR(1024),
    showpic     VARCHAR(64),
    lg       VARCHAR(64),
    md1      VARCHAR(64),
    md2      VARCHAR(64)
);
INSERT INTO lc_product VALUES(
	"","雪域牛乳芝士蛋糕","Le Cheesecake","198","<h4 class='no_wrap'>雪域牛乳芝士蛋糕</h4>
            <h5>Le Cheesecake</h5>
            <div class='sp' style='width:54px;height:1px;background:#ff4001;margin: 10px auto 20px;' >&nbsp;</div>
            <div class='inner'>
              <p>阿尔卑斯山的雪</p>
              <p>简单但有种永恒的美</p>
              <p>特浓牛乳和新西兰上等芝士用独特的工艺</p>
              <p>令芝士的香气完全散发出来</p>
              <p>蛋糕的口感也更加浓郁香滑、入口即溶</p>
              <p>上等食材的精心配比，让这款蛋糕回味无穷</p>
            </div>",
	    "img/product/show/list_10800.jpg",
	    "img/product/lg/display_10800_50122.jpg",
	    "img/product/md/xueyu 20170410143730.jpg",
	    "img/product/md/pcqiefen(1).jpg"
);
INSERT INTO lc_product VALUES(
	"","名称金桔满堂蛋糕","Orange Mousse Cake","318","<h4 class='no_wrap'>金桔满堂蛋糕</h4>
            <h5>Orange Mousse Cake</h5>
            <div class='sp' style='width:54px;height:1px;background:#ff4001;margin: 10px auto 20px;'>&nbsp;</div>
            <div class='inner'>
              <p>不少人重提应该寻回老传统</p>
              <p>让农历新年过得更有年味儿</p>
              <p>于是，我们重拾金桔寓“吉”的好意艺</p>
              <p>将觅宝讨彩头的仪式感融入其中</p>
              <p>注入桔子果肉的清新酸甜</p>
              <p>玩味出新禧之作：金桔满堂蛋糕</p>
            </div>",
	    "img/product/show/list_15968.jpg",
	    "img/product/lg/display_15968_65244.jpg",
	    "img/product/md/20180118191911.jpg",
	    "img/product/md/20180119151407.jpg"
);
INSERT INTO lc_product VALUES(
	"","柠檬蜜蛋糕组合","Honey Lemon Cakes","218",
	"<h4 class='no_wrap'>柠檬蜜蛋糕组合</h4>
            <h5>Honey Lemon Cakes</h5>
            <div class='sp' style='width:54px;height:1px;background:#ff4001;margin: 10px auto 20px;'>&nbsp;</div>
            <div class='inner'>
              <p>单纯美好、自然默契</p>
              <p>才能在彼此人生中变得无与伦比</p>
              <p>美好的情谊就是一口柠檬蛋糕</p>
              <p>一点清新、一点知心</p>
            </div>",
	    "img/product/show/list_16103.jpg",
	    "img/product/lg/display_16103_70447.jpg",
	    "img/product/md/302.jpg",
	    "img/product/md/301.jpg"
);
INSERT INTO lc_product VALUES(
	"","敲敲话·巧克力流心蛋糕","Knock Knock/Cho","318",
	"<h4 class='no_wrap'>敲敲话•巧克力流心蛋糕</h4>
            <h5>Knock Knock / Chocolate Flow Cake</h5>
            <div class='sp' style='width:54px;height:1px;background:#ff4001;margin: 10px auto 20px;'>&nbsp;</div>
            <div class='inner'>
              <p>爱情来临时</p>
              <p>会传来特别的声响</p>
              <p>悄悄话就藏在浓郁的巧克力中</p>
              <p>流心四溢，纯净迷人</p>
              <p>这芳醇如丝的口感</p>
              <p>镌刻在心，无法复制</p>
	      <p>这份花尽心思的礼物</p>
	      <p>请慢用</p>
            </div>",
	    "img/product/show/list_16049.jpg",
	    "img/product/lg/display_16049_21121.jpg",
	    "img/product/md/401.jpg",
	    "img/product/md/402.jpg"
);
INSERT INTO lc_product VALUES(
	"","柠檬蜜蛋糕(樱花粉)","Honey Lemon Cake","168",
	"<h4 class='no_wrap'>柠檬蜜蛋糕(樱花粉)</h4>
            <h5>Honey Lemon Cake/ Sakura Pink</h5>
            <div class='sp' style='width:54px;height:1px;background:#ff4001;margin: 10px auto 20px;'>&nbsp;</div>
            <div class='inner'>
              <p>单纯美好、自然默契</p>
              <p>才能在彼此人生中变得无与伦比</p>
              <p>美好的情谊就是一口柠檬蛋糕</p>
              <p>一点清新、一点知心</p>
            </div>",
	    "img/product/show/list_16093.png",
	    "img/product/lg/display_16093_53014.jpg",
	    "img/product/md/501.jpg",
	    "img/product/md/502.jpg"
);
INSERT INTO lc_product VALUES(
	"","巧克力流心千层蛋糕","Chocolate Mille Crêp","298",
	"<h4 class='no_wrap'>巧克力流心千层蛋糕</h4>
            <h5>Chocolate Mille Crêpes</h5>
            <div class='sp' style='width:54px;height:1px;background:#ff4001;margin: 10px auto 20px;'>&nbsp;</div>
            <div class='inner'>
              <p>四处弥漫的神秘香气</p>
              <p>源于巧克力森林的艺术追求</p>
              <p>丝滑奶油与弹韧饼皮的相遇</p>
              <p>给予唇齿直率与温婉的平衡</p>
              <p>香浓巧克力流心的极致享受</p>
              <p>触发味蕾蔓延每个细胞的幸福感</p>
            </div>",
	    "img/product/show/list_15878.jpg",
	    "img/product/lg/display_15878_67261.jpg",
	    "img/product/md/601.jpg",
	    "img/product/md/602.jpg"
);
INSERT INTO lc_product VALUES(
	"","原味流心千层蛋糕","Original Taste Mille Cr","298",
	"<h4 class='no_wrap'>原味流心千层蛋糕</h4>
            <h5>Original Taste Mille Crêpes</h5>
            <div class='sp' style='width:54px;height:1px;background:#ff4001;margin: 10px auto 20px;'>&nbsp;</div>
            <div class='inner'>
              <p>轻盈 湿润 弹韧</p>
              <p>每一层都精确到毫厘</p>
              <p>21层之间抹上天使奶油</p>
              <p>不同的质感轻轻相融</p>
              <p>在唇齿间漫过阵阵清新滋味</p>
              <p>焦糖脆脆流心流转而出</p>
	      <p>给予味觉更丰盈的体验</p>
            </div>",
	    "img/product/show/list_15856.jpg",
	    "img/product/lg/display_15856_83151.jpg",
	    "img/product/md/701.jpg",
	    "img/product/md/702.jpg"
);
INSERT INTO lc_product VALUES(
	"","柠檬蜜蛋糕(迷迭紫)","Honey Lemon Cake/ Rosemar","168",
	"<h4 class='no_wrap'>柠檬蜜蛋糕(迷迭紫)</h4>
            <h5>Honey Lemon Cake/ Rosemary Purple</h5>
            <div class='sp' style='width:54px;height:1px;background:#ff4001;margin: 10px auto 20px;'>&nbsp;</div>
            <div class='inner'>
              <p>单纯美好、自然默契</p>
              <p>才能在彼此人生中变得无与伦比</p>
              <p>美好的情谊就是一口柠檬蛋糕</p>
              <p>一点清新、一点知心</p>
            </div>",
	    "img/product/show/list_16100.png",
	    "img/product/lg/display_16100_34682.jpg",
	    "img/product/md/801.jpg",
	    "img/product/md/802.jpg"
);
INSERT INTO lc_product VALUES(
	"","环游世界·秋冬季蛋糕","Around The World","218",
	"<h4 class='no_wrap'>环游世界·秋冬季蛋糕</h4>
            <h5>Around The World Cake</h5>
            <div class='sp' style='width:54px;height:1px;background:#ff4001;margin: 10px auto 20px;'>&nbsp;</div>
            <div class='inner'>
              <p>精选芝士、慕斯、鲜果与巧克力系列</p>
              <p>带来不同地域的应季风景</p>
              <p>环游世界从舌尖开始</p>
              <p>将千般滋味充盈心间</p>
            </div>",
	    "img/product/show/list_12287.jpg",
	    "img/product/lg/display_12287_44024.jpg",
	    "img/product/md/901.jpg",
	    "img/product/md/902.jpg"
);
INSERT INTO lc_product VALUES(
	"","幻想小超鱼蛋糕","Pisces Mousse Cake","258",
	"<h4 class='no_wrap'>幻想小超鱼蛋糕</h4>
            <h5>Pisces Mousse Cake</h5>
            <div class='sp' style='width:54px;height:1px;background:#ff4001;margin: 10px auto 20px;'>&nbsp;</div>
            <div class='inner'>
              <p>天生活在梦境中的幻想家</p>
              <p>时而复杂，时而简单</p>
              <p>追求一切美好味道</p>
              <p>犹如行走的浪漫发射机</p>
              <p>将浪漫甜蜜带给身边的所有人</p>
            </div>",
	    "img/product/show/list_16061.jpg",
	    "img/product/lg/display_16061_65010.jpg",
	    "img/product/md/1001.jpg",
	    "img/product/md/1002.jpg"
);
INSERT INTO lc_product VALUES(
	"","美刀刀蛋糕","Ms. Golden","298",
	"<h4 class='no_wrap'>美刀刀蛋糕</h4>
            <h5>Ms. Golden</h5>
            <div class='sp' style='width:54px;height:1px;background:#ff4001;margin: 10px auto 20px;'>&nbsp;</div>
            <div class='inner'>
              <p>芝士与香草戚风被雪域奶油的浪漫笼罩</p>
              <p>每一口都充满快乐的滋味</p>
              <p>撩拨起无限的食欲/p>
              <p>让味蕾懂得了心跳的感觉</p>
            </div>",
	    "img/product/show/list_15474.jpg",
	    "img/product/lg/display_15474_39428.jpg",
	    "img/product/md/1101.jpg",
	    "img/product/md/1102.jpg"
);
INSERT INTO lc_product VALUES(
	"","玫瑰雪域芝士蛋糕","Rose Cheesecake","218",
	"<h4 class='no_wrap'>玫瑰雪域芝士蛋糕</h4>
            <h5>Rose Cheesecake</h5>
            <div class='sp' style='width:54px;height:1px;background:#ff4001;margin: 10px auto 20px;'>&nbsp;</div>
            <div class='inner'>
              <p>玫瑰是美丽爱情的象征</p>
              <p>而一朵纯白的玫瑰则映衬出少男少女纯净的感情</p>
              <p>花是爱恋，花是祝福，花是立下的爱之誓言</p>
              <p>这款蛋糕延续了雪域牛乳芝士系列的浓郁香醇的口感</p>
              <p>回味绵长恰如爱情的滋味</p>
	      <p>充满法式浪漫和柔情</p>
            </div>",
	    "img/product/show/list_12244.jpg",
	    "img/product/lg/display_12244_57356.jpg",
	    "img/product/md/1201.jpg",
	    "img/product/md/1202.jpg"
);
INSERT INTO lc_product VALUES(
	"","粉色玫瑰森林蛋糕","Rose Garden","218",
	"<h4 class='no_wrap'>粉色玫瑰森林蛋糕</h4>
            <h5>Rose Garden</h5>
            <div class='sp' style='width:54px;height:1px;background:#ff4001;margin: 10px auto 20px;'>&nbsp;</div>
            <div class='inner'>
              <p>山坡上的粉红玫瑰，温柔而坚韧</p>
              <p>不惧骄阳和寒风，依然开出美的花朵</p>
              <p>不为取悦别人，只爱这样美的自己</p>
              <p>我亲手种下的这一片粉色玫瑰森林，不仅有悦人的外表</p>
              <p>比利时巧克力与法国奶油细腻柔滑的口感</p>
	      <p>成就出色的巧克力蛋糕</p>
            </div>",
	    "img/product/show/list_12220.jpg",
	    "img/product/lg/display_12220_5693.jpg",
	    "img/product/md/1301.jpg",
	    "img/product/md/1302.jpg"
);
INSERT INTO lc_product VALUES(
	"","爱•发声蛋糕","Le Loves","258",
	"<h4 class='no_wrap'>爱·发声蛋糕</h4>
            <h5>Le Loves</h5>
            <div class='sp' style='width:54px;height:1px;background:#ff4001;margin: 10px auto 20px;'>&nbsp;</div>
            <div class='inner'>
              <p>巧克力喷砂唯美的质感 多了几分柔和</p>
              <p>也增添了很多爱情朦胧的梦幻</p>
              <p>巧克力的芬芳融合特选的香橙果酱</p>
              <p>橙香四溢 造就了特有的口感</p>
              <p>更加体现出蛋糕的本真原味</p>
	      <p>让爱·发声 眉梢嘴角间的流露的幸福</p>
	      <p>我想 这就是爱情</p>
            </div>",
	    "img/product/show/list_14905.jpg",
	    "img/product/lg/display_14905_12868.jpg",
	    "img/product/md/1401.jpg",
	    "img/product/md/1402.jpg"
);
INSERT INTO lc_product VALUES(
	"","粉粉爱芝士蛋糕","Berries Cheesecake","98",
	"<h4 class='no_wrap'>粉粉爱芝士蛋糕</h4>
            <h5>Berries Cheesecake</h5>
            <div class='sp' style='width:54px;height:1px;background:#ff4001;margin: 10px auto 20px;'>&nbsp;</div>
            <div class='inner'>
              <p>自然而然地靠近</p>
              <p>将心慢慢磨细品味</p>
              <p>草莓慕斯与烤芝士</p>
              <p>以不同的质感传递爱的真谛</p>
              <p>淡淡的腼腆印上粉色的脸颊</p>
	      <p>最初的爱就是如此吧</p>
            </div>",
	    "img/product/show/list_15971.jpg",
	    "img/product/lg/display_15971_21364.jpg",
	    "img/product/md/1501.jpg",
	    "img/product/md/1502.jpg"
);
INSERT INTO lc_product VALUES(
	"","大桔大利芝士蛋糕","Orange Cheesecake","98",
	"<h4 class='no_wrap'>大桔大利芝士蛋糕</h4>
            <h5>Orange Cheesecake</h5>
            <div class='sp' style='width:54px;height:1px;background:#ff4001;margin: 10px auto 20px;'>&nbsp;</div>
            <div class='inner'>
              <p>大吉大利！</p>
              <p>年年岁岁必不可少之祈福</p>
              <p>满怀诚意的祝愿与爱的传递</p>
              <p>送给至亲好友，送给自己</p>
              <p>都是一份贴心美好的礼物</p>
            </div>",
	    "img/product/show/list_15881.jpg",
	    "img/product/lg/display_15881_69617.jpg",
	    "img/product/md/1601.jpg",
	    "img/product/md/1602.jpg"
);
INSERT INTO lc_product VALUES(
	"","诺心花园•春鸣蛋糕","Berries Cheesecake","218",
	"<h4 class='no_wrap'>诺心花园•春鸣蛋糕</h4>
            <h5>Berries Cheesecake</h5>
            <div class='sp' style='width:54px;height:1px;background:#ff4001;margin: 10px auto 20px;'>&nbsp;</div>
            <div class='inner'>
              <p>走过雪域的纯白</p>
              <p>抹茶的嫩绿等待抽芽</p>
              <p>歌剧院中的玫瑰将吐露芬芳</p>
              <p>巧克力松露的香气徐徐而近</p>
            </div>",
	    "img/product/show/list_12120.jpg",
	    "img/product/lg/display_12120_26657.jpg",
	    "img/product/md/1701.jpg",
	    "img/product/md/1702.jpg"
);
INSERT INTO lc_product VALUES(
	"","唯·卢浮宫","Le louvre","198",
	"<h4 class='no_wrap'>唯·卢浮宫蛋糕</h4>
            <h5> Le louvre</h5>
            <div class='sp' style='width:54px;height:1px;background:#ff4001;margin: 10px auto 20px;'>&nbsp;</div>
            <div class='inner'>
              <p>经典红丝绒蛋糕胚与白巧克力慕斯的绝妙搭配，</p>
              <p>让蛋糕口味清新而不甜腻。加上新鲜草莓的点缀</p>
              <p>不仅让蛋糕的口味更佳出众，独具艺术感</p>
              <p>的造型也足够吸引眼球，令人向往。</p>
            </div>",
	    "img/product/show/list_13339.jpg",
	    "img/product/lg/display_13339_64254.jpg",
	    "img/product/md/1801.jpg",
	    "img/product/md/1802.jpg"
);
INSERT INTO lc_product VALUES(
	"","雪精灵蛋糕","Snow Fairy Cake","218",
	"<h4 class='no_wrap'>雪精灵蛋糕</h4>
            <h5>Snow Fairy Cake</h5>
            <div class='sp' style='width:54px;height:1px;background:#ff4001;margin: 10px auto 20px;'>&nbsp;</div>
            <div class='inner'>
              <p>浪漫的时刻</p>
              <p>纯粹的红宛如温馨的烛光</p>
              <p>点亮了优雅洁白的四周</p>
              <p>邀请亲友欢聚在花房</p>
              <p>悉心赏味，将层层暖意相互倾诉</p>
	      <p>人生从此开启全新篇章</p>
	      <p>置身其中聆听春的乐音</p>
            </div>",
	    "img/product/show/list_15815.jpg",
	    "img/product/lg/display_15815_95292.jpg",
	    "img/product/md/1901.jpg",
	    "img/product/md/1902.jpg"
);
INSERT INTO lc_product VALUES(
	"","莓果缤纷蛋糕","Berries Cream Cake","198",
	"<h4 class='no_wrap'>莓果缤纷蛋糕</h4>
            <h5>Berries Cream Cake</h5>
            <div class='sp' style='width:54px;height:1px;background:#ff4001;margin: 10px auto 20px;'>&nbsp;</div>
            <div class='inner'>
              <p>四季的时针拨响</p>
              <p>是时候打开味蕾的封锁了</p>
              <p>草莓、蓝莓尽情在天使奶油中翻滚</p>
              <p>果实的丰盈与奶油的清新</p>
              <p>让人铭记清晨第一缕阳光</p>
            </div>",
	    "img/product/show/list_15965.jpg",
	    "img/product/lg/display_15965_52.jpg",
	    "img/product/md/2001.jpg",
	    "img/product/md/2002.jpg"
);
#创建购物车表
CREATE TABLE lc_cart(
    cid INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    pid INT,
    pname    VARCHAR(32),
    pnameen  VARCHAR(32),
    price    VARCHAR(32),
    showpic  VARCHAR(64),
    pcount   INT NOT NULL DEFAULT 1,
    ischecked BOOLEAN NOT NULL DEFAULT false
);
