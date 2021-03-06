<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>

<head>
<meta charset="utf-8">
<title>基于Echarts的HTML5 Canvas中国地图DEMO演示</title>
<script src="js/jquery-1.11.1.min.js"></script>
<script src="js/echarts.min.js"></script>
<script src="js/china.js"></script>
</head>

<body>

<div id="container" style="height: 800px;width:1200px;background:white;margin:20px 0 0;"></div>

<script type="text/javascript">
    // 全国省份列表
    var dataMap = [{ name: '北京' }, { name: '天津' }, { name: '上海' }, { name: '重庆' }, { name: '河北' }, { name: '河南' }, { name: '云南' }, { name: '辽宁' }, { name: '黑龙江' }, { name: '湖南' }, { name: '安徽' }, { name: '山东' },
    { name: '新疆' }, { name: '江苏' }, { name: '浙江' }, { name: '江西' }, { name: '湖北' }, { name: '广西' }, { name: '甘肃' }, { name: '山西' }, { name: '内蒙古' }, { name: '陕西' }, { name: '吉林' }, { name: '福建' }, { name: '贵州' },
    { name: '广东' }, { name: '青海' }, { name: '西藏' }, { name: '四川' }, { name: '宁夏' }, { name: '海南' }, { name: '台湾' }, { name: '香港' }, { name: '澳门' }]
    // 需要在页面上直接标记出来的城市
    var specialMap = ['浙江', '云南', '陕西'];
    // 对dataMap进行处理，使其可以直接在页面上展示
    for (var i = 0; i < specialMap.length; i++) {
        for (var j = 0; j < dataMap.length; j++) {
            if (specialMap[i] == dataMap[j].name) {
                dataMap[j].selected = true;
                break;
            }

        }
    }
    // 绘制图表，准备数据
   /*  function drawChart() {
	require([ 'echarts', 'echarts/chart/force' // 使用柱状图就加载bar模块，按需加载
	], function(ec) {
		//添加点击事件
		var ecConfig = require('echarts/config');
		myChart.on(ecConfig.EVENT.CLICK, eConsole);  
	});  */
		
    var option = {
        tooltip: {
            formatter: function (params) {
                var info = '<p style="font-size:18px">' + params.name + '</p><p style="font-size:14px">这里可以写一些，想展示在页面上的别的信息</p>'
                return info;
            },
            backgroundColor: "#ff7f50",//提示标签背景颜色
            textStyle: { color: "#fff" } //提示标签字体颜色
        },
        series: [
            {
                name: '中国',
                type: 'map',
                mapType: 'china',
                clickable : true,
                selectedMode: 'multiple',
                label: {
                    normal: {
                        show: true,//显示省份标签
                        // textStyle:{color:"#c71585"}//省份标签字体颜色
                    },
                    emphasis: {
                        show: true,//对应的鼠标悬浮效果
                        
                        // textStyle:{color:"#800080"}
                    }
                },
                itemStyle: {
                    normal: {
                        borderWidth: .5,//区域边框宽度
                        // borderColor: '#009fe8',//区域边框颜色
                        // areaColor:"#ffefd5",//区域颜色
                    },
                    emphasis: {
                        borderWidth: .5,
                        borderColor: '#4b0082',
                        areaColor: "#ffdead",
                    }
                },
                data: dataMap
            }
        ]
    };
    //初始化echarts实例
    var myChart = echarts.init(document.getElementById('container'));
    //使用制定的配置项和数据显示图表
    myChart.setOption(option);
    myChart.on('click', function (params) {
    	switch (params.name) {
		case '上海':
			 window.open('https://720yun.com/t/af7z0fre0ik?scene_id=142448');
			break;
		case '广东':
			window.location.href='localhost:8080/Travel/s';
			break;
		default:
			break;
		}
    	
    	
    	/*  if(params.name=='上海'){
    		 window.open('https://720yun.com/t/af7z0fre0ik?scene_id=142448');
    		}
    	 if(params.name='广东'){
    		 window.open('https://720yun.com/t/0f5jO5tOzn6?scene_id=2350007');
    		} */
       
    });
   /*  function eConsole(param) {


    	　　//alert(option.series[0].data.length);
    	　　//alert(option.series[0].data[i]);
    	　　//param.dataIndex 获取当前点击索引，
    	　　//alert(param.dataIndex);
    	　　clickFunc(param.dataIndex);//执行点击效果
    	}


    	myChart.on("click", eConsole); */
</script>

<div style="text-align:center;clear:both;">
<!-- <script src="/gg_bd_ad_720x90.js" type="text/javascript"></script>
<script src="/follow.js" type="text/javascript"></script> -->
</div>

</body>
</html>