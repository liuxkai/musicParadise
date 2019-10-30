<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <title>音乐天堂后台页面</title>
  <link rel="icon" href="static/images/280558b50ba60daaf75986fecfef32fd.png">
  <link rel="stylesheet" href="layui/css/layui.css">
  <script src="frame/static/js/echarts.min.js"></script>
  <style>
		.demo-carousel{height: 200px; line-height: 200px; text-align: center;}
		.formdiv{
			display: inline-block;
			margin-top: 12px;
			margin-bottom: 0px;
		} 
		#startupload1, #startupload2, #startupload3{
		  	margin-left: 90px;
		}
		#datareport-1,#datareport-2{
			margin:20px auto;
			width: 940px;
			height: 350px;
		}
		#main1,#main2,#main3,#main4{
			margin:0px 20px;
			display: inline-block;
		}
	</style>
</head>
<body class="layui-layout-body">

<div class="layui-layout layui-layout-admin">
  <div class="layui-header">
    <div class="layui-logo">音乐天堂</div>
    <!-- 头部区域（可配合layui已有的水平导航） -->
    <ul class="layui-nav layui-layout-left">
      <li class="layui-nav-item"><a href="javascript:;" id="dataform1">控制台</a></li>
      <li class="layui-nav-item"><a href="javascript:;">商品管理</a></li>
      <li class="layui-nav-item"><a href="javascript:;">用户</a></li>
      <li class="layui-nav-item">
        <a href="javascript:;">其它系统</a>
        <dl class="layui-nav-child">
          <dd><a href="">邮件管理</a></dd>
          <dd><a href="">消息管理</a></dd>
          <dd><a href="">授权管理</a></dd>
        </dl>
      </li>
    </ul>
    <ul class="layui-nav layui-layout-right">
      <li class="layui-nav-item">
        <a href="javascript:;">
          <img src="http://t.cn/RCzsdCq" class="layui-nav-img">
          贤心
        </a>
        <dl class="layui-nav-child">
          <dd><a href="">基本资料</a></dd>
          <dd><a href="">安全设置</a></dd>
        </dl>
      </li>
      <li class="layui-nav-item"><a href="UserController?method=logout">退出</a></li>
    </ul>
  </div>
  
  <div class="layui-side layui-bg-black">
    <div class="layui-side-scroll">
      <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
      <ul class="layui-nav layui-nav-tree"  lay-filter="test">
        <li class="layui-nav-item">
          <a class="" href="javascript:;">歌曲管理</a>
          <dl class="layui-nav-child layui-bg-gray" >
            <dd><a href="javascript:;" id="userlist">用户管理</a></dd>
            <dd><a href="javascript:;" id="songlist">歌曲管理</a></dd>
            <dd><a href="javascript:;" id="singerlist">歌手管理</a></dd>
            <dd><a href="javascript:;" id="albumList">专辑管理</a></dd>
          </dl>
        </li>
        <li class="layui-nav-item">
          <a href="javascript:;">资源上传</a>
          <dl class="layui-nav-child">
            <dd><a href="javascript:;" id="uploadsong">上传歌曲</a></dd>
            <dd><a href="javascript:;" id="uploadlrc">上传歌词</a></dd>
            <dd><a href="javascript:;" id="uploadphone">上传歌手写真</a></dd>
            <dd><a href="https://www.baidu.com/">我的小秘</a></dd>
          </dl>
        </li>
        <li class="layui-nav-item"><a href="musicparadise.jsp">听音乐</a></li>
        <li class="layui-nav-item"><a href="https://www.taobao.com/">去购物</a></li>
      </ul>
    </div>
  </div>
  
<div class="layui-body">
	<!-- 上传歌曲 -->
	<div class="layui-tab-item" id="uploadform1">
		<div class="layui-upload-drag" id="uploadsongfile1">
				<i class="layui-icon"></i>
				<p>点击上传歌曲或将歌曲文件拖拽到此处</p>
		</div><br/><br/><br/>
 		<label class="layui-form-label">演唱者:</label>
		<div class="layui-input-inline">
 			<input type="text" name="singername"  class="layui-input"  id="uploadform1singerName" required placeholder="请输入歌手姓名"/><br/>
		</div><br>
  		<label class="layui-form-label">歌曲类型:</label>
	    <div class="layui-input-inline" style="width: 100px;">
            <select class="layui-input" name="typeName" id="uploadform1typeName">
            	<option value="1">经典音乐</option>
                <option value="2">摇滚音乐</option>
                <option value="3">儿歌</option>
                <option value="4">流行音乐</option>
            </select>
	    </div>
	    <br><br><br>
	   
	    <button type="button" class="layui-btn" id="startupload1">开始上传</button>
  	</div>
	<!-- 上传歌词 -->	
	<div class="layui-tab-item" id="uploadform2">
		<div class="layui-upload-drag" id="uploadlrcfile2">
			<i class="layui-icon"></i>
			<p>点击上传歌词或将歌词文件拖拽到此处</p>
		</div><br/><br/><br/>
		<label class="layui-form-label">歌曲名称:</label>
		<div class="layui-input-inline">
			<input type="text" id="uploadform2songName" class="layui-input"  required placeholder="请输入歌曲名称"/><br/>
		</div><br><br>
			
	    <button type="button" class="layui-btn" id="startupload2">开始上传</button>
  	</div>
	<!-- 上传歌手写真 -->  	
 	<div class="layui-tab-item" id="uploadform3">
		<div class="layui-upload-drag" id="uploadphotofile3">
			<i class="layui-icon"></i>
			<p>点击上传歌手图片或将歌手图片文件拖拽到此处</p>
		</div><br/><br/><br/>
		<label class="layui-form-label">歌手名称:</label>
		<div class="layui-input-inline">
			<input type="text" id="uploadform3photo" class="layui-input"   required placeholder="请输入歌手名称"/><br/>
		</div><br><br>
	    <button type="button" class="layui-btn" id="startupload3">开始上传</button>
  	</div>
  	
  	<!-- 数据报表 -->
  	<div id="datareport">
  		<div id="datareport-1">
	  		<div id="main1" style="width: 420px;height:350px;"></div>
		    
		    
		 <div id="main2" style="width: 420px;height:350px;"></div>
	    <script type="text/javascript">
	        var myChart = echarts.init(document.getElementById('main2'));
	        
	        var dataAxis = ['经典', '流行', '摇滚', '童谣', '最新'];
	        var data = [220, 182, 191, 234, 290];
	        var yMax = 500;
	        var dataShadow = [];

	        for (var i = 0; i < data.length; i++) {
	            dataShadow.push(yMax);
	        }

	        option = {
	            title: {
	                text: '类型歌曲点击量',
	            },
	            xAxis: {
	                data: dataAxis,
	                axisLabel: {
	                    inside: true,
	                    textStyle: {
	                        color: '#fff'
	                    }
	                },
	                axisTick: {
	                    show: false
	                },
	                axisLine: {
	                    show: false
	                },
	                z: 10
	            },
	            yAxis: {
	                axisLine: {
	                    show: false
	                },
	                axisTick: {
	                    show: false
	                },
	                axisLabel: {
	                    textStyle: {
	                        color: '#999'
	                    }
	                }
	            },
	            dataZoom: [
	                {
	                    type: 'inside'
	                }
	            ],
	            series: [
	                { // For shadow
	                    type: 'bar',
	                    itemStyle: {
	                        normal: {color: 'rgba(0,0,0,0.05)'}
	                    },
	                    barGap:'-100%',
	                    barCategoryGap:'40%',
	                    data: dataShadow,
	                    animation: false
	                },
	                {
	                    type: 'bar',
	                    itemStyle: {
	                        normal: {
	                            color: new echarts.graphic.LinearGradient(
	                                0, 0, 0, 1,
	                                [
	                                    {offset: 0, color: '#83bff6'},
	                                    {offset: 0.5, color: '#188df0'},
	                                    {offset: 1, color: '#188df0'}
	                                ]
	                            )
	                        },
	                        emphasis: {
	                            color: new echarts.graphic.LinearGradient(
	                                0, 0, 0, 1,
	                                [
	                                    {offset: 0, color: '#2378f7'},
	                                    {offset: 0.7, color: '#2378f7'},
	                                    {offset: 1, color: '#83bff6'}
	                                ]
	                            )
	                        }
	                    },
	                    data: data
	                }
	            ]
	        };

	        // Enable data zoom when user click bar.
	        var zoomSize = 6;
	        myChart.on('click', function (params) {
	            console.log(dataAxis[Math.max(params.dataIndex - zoomSize / 2, 0)]);
	            myChart.dispatchAction({
	                type: 'dataZoom',
	                startValue: dataAxis[Math.max(params.dataIndex - zoomSize / 2, 0)],
	                endValue: dataAxis[Math.min(params.dataIndex + zoomSize / 2, data.length - 1)]
	            });
	        });
       		myChart.setOption(option);
	    </script>
  		</div>
  		<div id="datareport-2">
  		<div id="main3" style="width: 420px;height:350px;"></div>
	    <script type="text/javascript">
	        var myChart = echarts.init(document.getElementById('main3'));
	        var dataArr = [{
		        value: 50,
		        name: '用户激活率'
		    }];
		    var color = new echarts.graphic.LinearGradient(0, 0, 1, 0, [{
		            offset: 0,
		            color: '#5CF9FE' // 0% 处的颜色
		        },
		        {
		            offset: 0.17,
		            color: '#468EFD' // 100% 处的颜色
		        },
		        {
		            offset: 0.9,
		            color: '#468EFD' // 100% 处的颜色
		        },
		        {
		            offset: 1,
		            color: '#5CF9FE' // 100% 处的颜色
		        }
		    ]);
		    var colorSet = [
		        [0.91, color],
		        [1, '#15337C']
		    ];
		    var rich = {
				// 百分号
		        white: {
		            fontSize: 40,
		            color: '#fff',
		            fontWeight: '500',
		            padding: [-90, 0, 0, 0]
		        },
				// 数字
		        bule: {
		            fontSize: 80,
		            fontFamily: 'DINBold',
		            color: '#fff',
		            fontWeight: '700',
		            padding: [-60, 0, 0, 0],
		        },
				// 用户激活率
		        radius: {
		            width: 250,
		            height: 50,
		            // lineHeight:80,
		            borderWidth: 1,
		            borderColor: '#0092F2',
		            fontSize: 30,
		            color: '#fff',
		            backgroundColor: '#1B215B',
		            borderRadius: 20,
		            textAlign: 'center',
		        },
		        size: {
		            height: 200,
		            padding: [70, 0, 0, 0]
		        }
		    }
		    option = {
		        backgroundColor: 'rgb(255,255,255)',
		        tooltip: {
		            formatter: "{a} <br/>{b} : {c}%"
		        },

		        series: [{ //内圆
		                type: 'pie',
		                radius: '85%',
		                center: ['50%', '50%'],
		                z: 0,
		                itemStyle: {
		                    normal: {
		                        color: new echarts.graphic.RadialGradient(.5, .5, 1, [{
		                                offset: 0,
		                                color: 'rgba(17,24,43,0)'
		                            },
		                            {
		                                offset: .5,
		                                // color: '#1E2B57'
		                                color:'rgba(28,42,91,.6)'
		                            },
		                            {
		                                offset: 1,
		                                color: '#141C33',
		                                // color:'rgba(17,24,43,0)'
		                            }
		                        ], false),
		                        label: {
		                            show: false
		                        },
		                        labelLine: {
		                            show: false
		                        }
		                    },
		                },
		                hoverAnimation: false,
		                label: {
		                    show: false,
		                },
		                tooltip: {
		                    show: false
		                },
		                data: [100],
		            },
		            {
		                type: 'gauge',
		                name: '外层辅助',
		                radius: '74%',
		                startAngle: '225',
		                endAngle: '-45',
		                splitNumber: '100',
		                pointer: {
		                    show: false
		                },
		                detail: {
		                    show: false,
		                },
		                data: [{
		                    value: 1
		                }],
		                // data: [{value: 1, name: 90}],
		                title: {
		                    show: true,
		                    offsetCenter: [0, 30],
		                    textStyle: {
		                        color: '#fff',
		                        fontStyle: 'normal',
		                        fontWeight: 'normal',
		                        fontFamily: '微软雅黑',
		                        fontSize: 20,
		                    }
		                },
		                axisLine: {
		                    show: true,
		                    lineStyle: {
		                        color: [
		                            [1, '#00FFFF']
		                        ],
		                        width: 2,
		                        opacity: 1
		                    }
		                },
		                axisTick: {
		                    show: false
		                },
		                splitLine: {
		                    show: true,
		                    length: 20,
		                    lineStyle: {
		                        color: '#051932',
		                        width: 0,
		                        type: 'solid',
		                    },
		                },
		                axisLabel: {
		                    show: false
		                }
		            },
		            {
		                type: 'gauge',
		                radius: '70%',
		                startAngle: '225',
		                endAngle: '-45',
		                pointer: {
		                    show: false
		                },
		                detail: {
		                    formatter: function(value) {
		                        var num = Math.round(value);
		                        return '{bule|' + num + '}{white|%}' + '{size|' + '}\n{radius|用户激活率}';
		                    },
		                    rich: rich,
		                    "offsetCenter": ['0%', "0%"],
		                },
		                data: dataArr,
		                title: {
		                    show: false,
		                },
		                axisLine: {
		                    show: true,
		                    lineStyle: {
		                        color: colorSet,
		                        width: 25,
		                        // shadowBlur: 15,
		                        // shadowColor: '#B0C4DE',
		                        shadowOffsetX: 0,
		                        shadowOffsetY: 0,
		                        opacity: 1
		                    }
		                },
		                axisTick: {
		                    show: false
		                },
		                splitLine: {
		                    show: false,
		                    length: 25,
		                    lineStyle: {
		                        color: '#00377a',
		                        width: 2,
		                        type: 'solid',
		                    },
		                },
		                axisLabel: {
		                    show: false
		                },
		            },
		            {
		                name: '灰色内圈', //刻度背景
		                type: 'gauge',
		                z: 2,
		                radius: '60%',
		                startAngle: '225',
		                endAngle: '-45',
		                //center: ["50%", "75%"], //整体的位置设置
		                axisLine: { // 坐标轴线
		                    lineStyle: { // 属性lineStyle控制线条样式
		                        color: [
		                            [1, '#018DFF']
		                        ],
		                        width: 2,
		                        opacity: 1, //刻度背景宽度
		                    }
		                },
		                splitLine: {
		                    show: false
		                },
		                // data: [{
		                //     show: false,
		                //     value: '80'
		                // }], //作用不清楚
		                axisLabel: {
		                    show: false
		                },
		                pointer: {
		                    show: false
		                },
		                axisTick: {
		                    show: false
		                },
		                detail: {
		                    show: 0
		                }
		            },
		            {
		                name: "白色圈刻度",
		                type: "gauge",
		                radius: "60%",
		                startAngle: 225, //刻度起始
		                endAngle: -45, //刻度结束
		                z: 4,
		                axisTick: {
		                    show: false
		                },
		                splitLine: {
		                    length: 16, //刻度节点线长度
		                    lineStyle: {
		                        width: 2,
		                        color: 'rgba(1,244,255, 0.9)'
		                    } //刻度节点线
		                },
		                axisLabel: {
		                    color: 'rgba(255,255,255,0)',
		                    fontSize: 12,
		                }, //刻度节点文字颜色
		                pointer: {
		                    show: false
		                },
		                axisLine: {
		                    lineStyle: {
		                        opacity: 0
		                    }
		                },
		                detail: {
		                    show: false
		                },
		                data: [{
		                    value: 0,
		                    name: ""
		                }]
		            },
		            { //内圆
		                type: 'pie',
		                radius: '56%',
		                center: ['50%', '50%'],
		                z: 1,
		                itemStyle: {
		                    normal: {
		                        color: new echarts.graphic.RadialGradient(.5, .5, .8, [{
		                                offset: 0,
		                                color: '#4978EC'
		                            },
		                            {
		                                offset: .5,
		                                color: '#1E2B57'
		                            },
		                            {
		                                offset: 1,
		                                color: '#141F3D'
		                            }
		                        ], false),
		                        label: {
		                            show: false
		                        },
		                        labelLine: {
		                            show: false
		                        }
		                    },
		                },
		                hoverAnimation: false,
		                label: {
		                    show: false,
		                },
		                tooltip: {
		                    show: false
		                },
		                data: [100],
		            },
		        ]
		    };
	    
    		myChart.setOption(option);
	    </script>
	    <div id="main4" style="width: 420px;height:350px;"></div>
	    <script type="text/javascript">
	        var myChart = echarts.init(document.getElementById('main4'));
			    
			    
			    option = {
		    backgroundColor:'#fff',
		    series: [
		        {
		            name: '用户总数量',
		            type: 'pie',
		            radius: ['25%', '30%'],
		            center: ['15%', '50%'],
		            startAngle: 225,
		            color: [new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
		                offset: 0,
		                color: '#FDFF5C'
		            }, {
		                offset: 1,
		                color: '#FFDB5C'
		            }]), "transparent"],
		            labelLine: {
		                normal: {
		                    show: false
		                }
		            },
		            label: {
		                    normal: {
		                        position: 'center'
		                    }
		                },
		            data: [{
		                value: 100,
		                 name: '用户总数量',
		                    label: {
		                        normal: {
		                            formatter: '用户总数量',
		                            textStyle: {
		                                color: '#ff4d4d',
		                                fontSize: 16
		
		                            }
		                        }
		                    }
		            }, {
		                value: 25,
		                name: '%',
		                    label: {
		                        normal: {
		                            formatter: '\n\n'+'3',
		                            textStyle: {
		                                color: '#007ac6',
		                                fontSize: 30
		
		                            }
		                        }
		                    }
		            }]
		        },
		        {
		            name: '歌手总数量',
		            type: 'pie',
		            radius: ['25%', '30%'],
		            center: ['50%', '50%'],
		            startAngle: 225,
		            color: [new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
		                offset: 0,
		                color: '#9FE6B8'
		            }, {
		                offset: 1,
		                color: '#32C5E9'
		            }]), "transparent"],
		            labelLine: {
		                normal: {
		                    show: false
		                }
		            },
		            label: {
		                    normal: {
		                        position: 'center'
		                    }
		                },
		            data: [{
		                value: 75,
		                 name: '歌手总数量',
		                    label: {
		                        normal: {
		                            formatter: '歌手总数量',
		                            textStyle: {
		                                color: '#ff4d4d',
		                                fontSize: 16
		
		                            }
		                        }
		                    }
		            }, {
		                value: 25,
		                name: '%',
		                    label: {
		                        normal: {
		                            formatter: '\n\n3534',
		                            textStyle: {
		                                color: '#007ac6',
		                                fontSize: 30
		
		                            }
		                        }
		                    }
		            },
		            {
		                value: 0,
		                name: '%',
		                    label: {
		                        normal: {
		                            formatter: '',
		                            textStyle: {
		                                color: '#fff',
		                                fontSize: 16
		
		                            }
		                        }
		                    }
		            }]
		        },
		        {
		            name: '歌曲总数量',
		            type: 'pie',
		            radius: ['25%', '30%'],
		            center: ['85%', '50%'],
		            startAngle: 225,
		            labelLine: {
		                normal: {
		                    show: false
		                }
		            },
		            label: {
		                    normal: {
		                        position: 'center'
		                    }
		                },
		            data: [{
		                value: 75,
		                "itemStyle": {
		                    "normal": {
		                        "color": new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
		                            "offset": 0,
		                            "color": '#FF9F7F'
		                        }, {
		                            "offset": 1,
		                            "color": '#FB7293'
		                        }]),
		                    }
		                },
		                 name: '歌曲总数量',
		                    label: {
		                        normal: {
		                            formatter: '歌曲总数量',
		                            textStyle: {
		                                color: '#ff4d4d',
		                                fontSize: 16
		
		                            }
		                        }
		                    }
		            }, {
		                value: 25,
		                name: '%',
		                    label: {
		                        normal: {
		                            formatter: '\n\n3534',
		                            textStyle: {
		                                color: '#f125ff',
		                                fontSize: 30
		
		                            }
		                        }
		                    }
		            },
		            {
		                value: 0,
		                name: '%',
		                    label: {
		                        normal: {
		                            formatter: '',
		                            textStyle: {
		                                color: '#fff',
		                                fontSize: 16
		
		                            }
		                        }
		                    }
		            }]
		        }
		    ]
		};
   		myChart.setOption(option);
   	    </script>	    
  		</div>
  	</div>
  	
  	
  	
  	
    <!-- 内容主体区域 -->
    <div id="divContent1">
    <div class="layui-form">
	    <div class="layui-form-item formdiv"  style="width: 200px;">
	        <label class="layui-form-label">性别</label>
	        <div class="layui-input-block">
	            <select class="ttt" name="sex" lay-search="" id="sex1">
	            	 <option value=""></option>
	                <option value="1">男</option>
	                <option value="0">女</option>
	            </select>
	        </div>
	    </div>
	    <div class="layui-form-item formdiv"  style="width: 200px;">
	        <label class="layui-form-label">状态</label>
	        <div class="layui-input-block">
	            <select class="ttt" name="state" lay-search="" id="state1">
	           		 <option value=""></option>
	                <option value="1">激活</option>
	                <option value="0">未激活</option>
	            </select>
	        </div>
	    </div>
	    <input type="submit" class="layui-btn" id="query1" value="查询">
	</div>
    	<table class="layui-hide" id="demo1" lay-filter="test"></table>
    	<div class="layui-tab layui-tab-brief" lay-filter="demo">
    		<ul class="layui-tab-title">
    			<li class="layui-this">演示说明</li>
    			<li>日期</li>
    			<li>分页</li>
    			<li>上传</li>
    			<li>滑块</li>
    		</ul>
    		<div class="layui-tab-content">
    			<div class="layui-tab-item layui-show">
    
    				<div class="layui-carousel" id="test1">
    					<div carousel-item>
    						<div>
    							<p class="layui-bg-green demo-carousel">在这里，你将以最直观的形式体验 layui！</p>
    						</div>
    						<div>
    							<p class="layui-bg-red demo-carousel">在编辑器中可以执行 layui 相关的一切代码</p>
    						</div>
    						<div>
    							<p class="layui-bg-blue demo-carousel">你也可以点击左侧导航针对性地试验我们提供的示例</p>
    						</div>
    						<div>
    							<p class="layui-bg-orange demo-carousel">如果最左侧的导航的高度超出了你的屏幕</p>
    						</div>
    						<div>
    							<p class="layui-bg-cyan demo-carousel">你可以将鼠标移入导航区域，然后滑动鼠标滚轮即可</p>
    						</div>
    					</div>
    				</div>
    			</div>
    			<div class="layui-tab-item">
    				<div id="laydateDemo1"></div>
    			</div>
    			<div class="layui-tab-item">
    				<div id="pageDemo1"></div>
    			</div>
    			<div class="layui-tab-item">
    				<div class="layui-upload-drag" id="uploadDemo1">
    					<i class="layui-icon"></i>
    					<p>点击上传，或将文件拖拽到此处</p>
    				</div>
    			</div>
    			<div class="layui-tab-item">
    				<div id="sliderDemo1" style="margin: 50px 20px;"></div>
    			</div>
    		</div>
    	</div>
    
    	<blockquote class="layui-elem-quote layui-quote-nm layui-hide" id="footer1">layui {{ layui.v }} 提供强力驱动</blockquote>
    </div>
    
    
    <div id="divContent2">
    	<table class="layui-hide" id="demo2" lay-filter="test2"></table>
    	<script type="text/html" id="barDemo2">
			<a class="layui-btn layui-btn-xs layui-btn-normal" lay-event="edit" >添加到指定歌单</a>
		</script>
		
    	<div class="layui-tab layui-tab-brief" lay-filter="demo2">
    		<ul class="layui-tab-title">
    			<li class="layui-this">演示说明</li>
    			<li>日期</li>
    			<li>分页</li>
    			<li>上传</li>
    			<li>滑块</li>
    		</ul>
    		<div class="layui-tab-content">
    			<div class="layui-tab-item layui-show">
    
    				<div class="layui-carousel" id="test2">
    					<div carousel-item>
    						<div>
    							<p class="layui-bg-green demo-carousel">在这里，你将以最直观的形式体验 layui！</p>
    						</div>
    						<div>
    							<p class="layui-bg-red demo-carousel">在编辑器中可以执行 layui 相关的一切代码</p>
    						</div>
    						<div>
    							<p class="layui-bg-blue demo-carousel">你也可以点击左侧导航针对性地试验我们提供的示例</p>
    						</div>
    						<div>
    							<p class="layui-bg-orange demo-carousel">如果最左侧的导航的高度超出了你的屏幕</p>
    						</div>
    						<div>
    							<p class="layui-bg-cyan demo-carousel">你可以将鼠标移入导航区域，然后滑动鼠标滚轮即可</p>
    						</div>
    					</div>
    				</div>
    			</div>
    			<div class="layui-tab-item">
    				<div id="laydateDemo2"></div>
    			</div>
    			<div class="layui-tab-item">
    				<div id="pageDemo2"></div>
    			</div>
    			<div class="layui-tab-item">
    				<div class="layui-upload-drag" id="uploadDemo2">
    					<i class="layui-icon"></i>
    					<p>点击上传，或将文件拖拽到此处</p>
    				</div>
    				演唱者:<input type="text" name="singername" id="singerName2"/>
    				<div class="layui-form-item formdiv"  style="width: 200px;">
    				<label class="layui-form-label">歌曲类型</label>
			        <div class="layui-input-block">
			            <select class="ttt" name="typeName" lay-search="" id="typeName2">
			            	<option value="1">经典音乐</option>
			                <option value="2">摇滚音乐</option>
			                <option value="3">儿歌</option>
			                <option value="4">流行音乐</option>
			            </select>
			        </div>
			        </div>
			        <button type="button" class="layui-btn" id="test9">开始上传</button>
    			</div>
    			<div class="layui-tab-item">
    				<div id="sliderDemo" style="margin: 50px 20px;"></div>
    			</div>
    		</div>
    	</div>
    
    	<blockquote class="layui-elem-quote layui-quote-nm layui-hide" id="footer2">layui {{ layui.v }} 提供强力驱动</blockquote>
    </div>
    
    
    <div id="divContent3">
    	<table class="layui-hide" id="demo3" lay-filter="test3"></table>
    	<script type="text/html" id="barDemo3">
			<a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
			<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
		</script>
    	<div class="layui-tab layui-tab-brief" lay-filter="demo">
    		<ul class="layui-tab-title">
    			<li class="layui-this">演示说明</li>
    			<li>日期</li>
    			<li>分页</li>
    			<li>上传</li>
    			<li>滑块</li>
    		</ul>
    		<div class="layui-tab-content">
    			<div class="layui-tab-item layui-show">
    
    				<div class="layui-carousel" id="test3">
    					<div carousel-item>
    						<div>
    							<p class="layui-bg-green demo-carousel">在这里，你将以最直观的形式体验 layui！</p>
    						</div>
    						<div>
    							<p class="layui-bg-red demo-carousel">在编辑器中可以执行 layui 相关的一切代码</p>
    						</div>
    						<div>
    							<p class="layui-bg-blue demo-carousel">你也可以点击左侧导航针对性地试验我们提供的示例</p>
    						</div>
    						<div>
    							<p class="layui-bg-orange demo-carousel">如果最左侧的导航的高度超出了你的屏幕</p>
    						</div>
    						<div>
    							<p class="layui-bg-cyan demo-carousel">你可以将鼠标移入导航区域，然后滑动鼠标滚轮即可</p>
    						</div>
    					</div>
    				</div>
    			</div>
    			<div class="layui-tab-item">
    				<div id="laydateDemo3"></div>
    			</div>
    			<div class="layui-tab-item">
    				<div id="pageDemo3"></div>
    			</div>
    			<div class="layui-tab-item">
    				<div class="layui-upload-drag" id="uploadDemo3">
    					<i class="layui-icon"></i>
    					<p>点击上传，或将文件拖拽到此处</p>
    				</div>
    			</div>
    			<div class="layui-tab-item">
    				<div id="sliderDemo3" style="margin: 50px 20px;"></div>
    			</div>
    		</div>
    	</div>
    
    	<blockquote class="layui-elem-quote layui-quote-nm layui-hide" id="footer3">layui {{ layui.v }} 提供强力驱动</blockquote>
    </div>
    
    <div id="divContent4">
    	<table class="layui-hide" id="demo4" lay-filter="test4"></table>
    	<script type="text/html" id="barDemo4">
			<a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
			<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
		</script>
    	<div class="layui-tab layui-tab-brief" lay-filter="demo">
    		<ul class="layui-tab-title">
    			<li class="layui-this">演示说明</li>
    			<li>日期</li>
    			<li>分页</li>
    			<li>上传</li>
    			<li>滑块</li>
    		</ul>
    		<div class="layui-tab-content">
    			<div class="layui-tab-item layui-show">
    
    				<div class="layui-carousel" id="test4">
    					<div carousel-item>
    						<div>
    							<p class="layui-bg-green demo-carousel">在这里，你将以最直观的形式体验 layui！</p>
    						</div>
    						<div>
    							<p class="layui-bg-red demo-carousel">在编辑器中可以执行 layui 相关的一切代码</p>
    						</div>
    						<div>
    							<p class="layui-bg-blue demo-carousel">你也可以点击左侧导航针对性地试验我们提供的示例</p>
    						</div>
    						<div>
    							<p class="layui-bg-orange demo-carousel">如果最左侧的导航的高度超出了你的屏幕</p>
    						</div>
    						<div>
    							<p class="layui-bg-cyan demo-carousel">你可以将鼠标移入导航区域，然后滑动鼠标滚轮即可</p>
    						</div>
    					</div>
    				</div>
    			</div>
    			<div class="layui-tab-item">
    				<div id="laydateDemo4"></div>
    			</div>
    			<div class="layui-tab-item">
    				<div id="pageDemo4"></div>
    			</div>
    			<div class="layui-tab-item">
    				<div class="layui-upload-drag" id="uploadDemo4">
    					<i class="layui-icon"></i>
    					<p>点击上传，或将文件拖拽到此处</p>
    				</div>
    			</div>
    			<div class="layui-tab-item">
    				<div id="sliderDemo4" style="margin: 50px 20px;"></div>
    			</div>
    		</div>
    	</div>
	   	<blockquote class="layui-elem-quote layui-quote-nm layui-hide" id="footer4">layui {{ layui.v }} 提供强力驱动</blockquote>
    </div>
  </div>
  
  <div class="layui-footer">
    <!-- 底部固定区域 -->
    © layui.com - 底部固定区域
  </div>
  
</div>
<script src="static/jquery-3.4.1.js" type="text/javascript" charset="utf-8"></script>
<script src="layui/layui.js"></script>
<script>


$(function(){
	$("#datareport").hide();
	$("#divContent2").hide();
	$("#divContent3").hide();
	$("#divContent4").hide();
	$("#divContent1").hide();
	$("#uploadform1").hide();
	$("#uploadform2").hide();
	$("#uploadform3").hide();
	
	$("#userlist").click(function(){
		$("#uploadform1").hide();
		$("#uploadform2").hide();
		$("#uploadform3").hide();
		$("#divContent2").hide();
		$("#divContent3").hide();
		$("#divContent4").hide();
		$("#divContent1").show();
		$("#datareport").hide();
	})
	$("#songlist").click(function(){
		$("#uploadform1").hide();
		$("#uploadform2").hide();
		$("#uploadform3").hide();
		$("#divContent1").hide();
		$("#divContent3").hide();
		$("#divContent4").hide();
		$("#datareport").hide();
		$("#divContent2").show();
	})
	$("#singerlist").click(function(){
		$("#uploadform1").hide();
		$("#uploadform2").hide();
		$("#uploadform3").hide();
		$("#divContent1").hide();
		$("#divContent2").hide();
		$("#divContent4").hide();
		$("#divContent3").show();
		$("#datareport").hide();
	})
	$("#uploadsong").click(function(){
		$("#uploadform1").show();
		$("#uploadform2").hide();
		$("#uploadform3").hide();
		$("#divContent1").hide();
		$("#divContent2").hide();
		$("#divContent3").hide();
		$("#divContent4").hide();
		$("#datareport").hide();
	})
	$("#uploadlrc").click(function(){
		$("#uploadform1").hide();
		$("#uploadform2").show();
		$("#uploadform3").hide();
		$("#divContent1").hide();
		$("#divContent2").hide();
		$("#divContent3").hide();
		$("#divContent4").hide();
		$("#datareport").hide();
	})
	$("#uploadphone").click(function(){
		$("#uploadform1").hide();
		$("#uploadform2").hide();
		$("#uploadform3").show();
		$("#divContent1").hide();
		$("#divContent2").hide();
		$("#divContent3").hide();
		$("#divContent4").hide();
		$("#datareport").hide();
	})
	$("#albumList").click(function(){
		$("#uploadform1").hide();
		$("#uploadform2").hide();
		$("#uploadform3").hide();
		$("#divContent1").hide();
		$("#divContent2").hide();
		$("#divContent3").hide();
		$("#datareport").hide();
		$("#divContent4").show();
	})
	$("#dataform1").click(function(){
		$("#uploadform1").hide();
		$("#uploadform2").hide();
		$("#uploadform3").hide();
		$("#divContent1").hide();
		$("#divContent2").hide();
		$("#divContent3").hide();
		$("#divContent4").hide();
		$("#datareport").show();
	})
})


layui.use('element', function(){
  var element = layui.element;
});

//时间传进来获取时间戳进行处理后返回输出（    用到了layui的templet:function (d) { return dateToStr(d.lastLoginTime);}   ）
function dateToStr(lastLoginTim) {
	if(lastLoginTim == null){
		return 0;
	}
	 var time = new Date(lastLoginTim.time);
	// console.log(lastLoginTim);
	 var y = time.getFullYear();
	 var M = time.getMonth() + 1;
	 M = M < 10 ? ("0" + M) : M;
	 var d = time.getDate();
	 d = d < 10 ? ("0" + d) : d;
	 var h = time.getHours();
	 h = h < 10 ? ("0" + h) : h;
	 var m = time.getMinutes();
	 m = m < 10 ? ("0" + m) : m;
	 var s = time.getSeconds();
	 s = s < 10 ? ("0" + s) : s;
	 var str = y + "-" + M + "-" + d + " " + h + ":" + m + ":" + s;
	 return str;
}

//处理后台传过来的性别，1为男，0为女
function sexToStr(sex) {
//	console.log(sex);
	if(sex === 1){
		return "男";
	}
	return "女";
}

//处理后台传过来的状态，0为未激活，1为已激活
function stateToStr(state) {
	console.log(state);
	if(state == 0){
		return "未激活";
	}
	return "已激活";
}
//处理后台传过来的身份，NONVIP为非会员
function vipToStr(vip) {
	console.log(vip);
	if(vip === 'VIP'){
		return "会员";
	}
	return "非会员";
}
//处理后台传过来的状态，0为未激活，1为已激活
function roleToStr(role) {
	console.log(role);
	if(role === 'ADMIN'){
		return "管理员";
	}
	return "普通用户";
}

</script>

		<script>
			layui.use(['laydate', 'laypage', 'layer', 'table', 'carousel', 'upload', 'element', 'slider'], function() {
				var laydate = layui.laydate //日期
					,
					laypage = layui.laypage //分页
					,
					layer = layui.layer //弹层
					,
					table = layui.table //表格
					,
					carousel = layui.carousel //轮播
					,
					upload = layui.upload //上传
					,
					element = layui.element //元素操作
					,
					slider = layui.slider //滑块

				//向世界问个好
				layer.msg('Hello World');

				//监听Tab切换
				element.on('tab(demo)', function(data) {
					layer.tips('切换了 ' + data.index + '：' + this.innerHTML, this, {
						tips: 1
					});
				});

				//执行一个 table 实例
				var tableIns = table.render({
					elem: '#demo1',
					height: 420,
					//${requestScope.url != null  ? requestScope.url : "querytestReload"}
					url: 'UserController?method=query' //数据接口
						,
					title: '用户表',
					page: true //开启分页
						,
					toolbar: 'default' //开启工具栏，此处显示默认图标，可以自定义模板，详见文档
						,
					cols: [
						[ //表头
							{
								type: 'checkbox',
								fixed: 'left'
							},{
								field: 'name',
								title: '姓名',
								width: 90,
								sort: true,
								fixed: 'left'
							},  {
								field: 'userName',
								title: '用户名',
								width: 80,
								sort: true
							},  {
								field: 'sex',
								title: '性别',
								width: 80,
								sort: true,
								templet:function (d) { return sexToStr(d.sex);}
							}, {
								field: 'age',
								title: '年龄',
								width: 80,
								sort: true,
							}, {
								field: 'passWord',
								title: '密码',
								width: 100,
								sort: true,
								field: 'vip',
								title: '身份',
								width: 100,
								templet:function (d) { return vipToStr(d.vip);}
							}, {
								field: 'role',
								title: '角色',
								width: 100,
								sort: true,
								templet:function (d) { return roleToStr(d.role);}
							},{
								field: 'EMail',
								title: '邮箱',
								width: 200,
								sort: true
							}, {
								field: 'lastLoginTime',
								title: '最后登录时间',
								width: 170,
								sort: true,
								templet:function (d) { return dateToStr(d.lastLoginTime);}
							},{
								field: 'code',
								title: '激活码',
								width: 250,
								sort: true,
							},{
								field: 'state',
								title: '状态',
								width: 80,
								sort: true,
								templet:function (d) { return stateToStr(d.state);}
							}
						]
					]
				});
				 $('#query1').click(function () {
						var sex = $('#sex1').val();
						var state = $('#state1').val();
					   tableIns.reload({
						url: 'UserController',
					  	 where:{
							method : 'querySome',
							sex : sex,
							state : state
						}
					   
					   });
					});

				//监听头工具栏事件
				table.on('toolbar(test)', function(obj) {
					var checkStatus = table.checkStatus(obj.config.id),
						data = checkStatus.data; //获取选中的数据
					switch (obj.event) {
						case 'add':
							layer.msg('添加');
							break;
						case 'update':
							if (data.length === 0) {
								layer.msg('请选择一行');
							} else if (data.length > 1) {
								layer.msg('只能同时编辑一个');
							} else {
								layer.alert('编辑 [id]：' + checkStatus.data[0].id);
							}
							break;
						case 'delete':
							if (data.length === 0) {
								layer.msg('请选择一行');
							} else {
								layer.msg('删除');
							}
							break;
					};
				});

				//监听行工具事件
				table.on('tool(test)', function(obj) { //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
					var data = obj.data //获得当前行数据
						,
						layEvent = obj.event; //获得 lay-event 对应的值
					if (layEvent === 'detail') {
						layer.msg('查看操作');
					} else if (layEvent === 'del') {
						layer.confirm('真的删除行ma', function(index) {
							obj.del(); //删除对应行（tr）的DOM结构
							layer.close(index);
							//向服务端发送删除指令
							});
					} else if (layEvent === 'edit') {
						layer.msg('编辑操作');
					}
				});

				//执行一个轮播实例
				carousel.render({
					elem: '#test1',
					width: '100%' //设置容器宽度
						,
					height: 200,
					arrow: 'none' //不显示箭头
						,
					anim: 'fade' //切换动画方式
				});

				//将日期直接嵌套在指定容器中
				var dateIns = laydate.render({
					elem: '#laydateDemo1',
					position: 'static',
					calendar: true //是否开启公历重要节日
						,
					mark: { //标记重要日子
						'0-10-14': '生日',
						'2018-08-28': '新版',
						'2018-10-08': '神秘'
					},
					done: function(value, date, endDate) {
						if (date.year == 2017 && date.month == 11 && date.date == 30) {
							dateIns.hint('一不小心就月底了呢');
						}
					},
					change: function(value, date, endDate) {
						layer.msg(value)
					}
				});

				//分页
				laypage.render({
					elem: 'pageDemo1' //分页容器的id
						,
					count: 100 //总页数
						,
					skin: '#1E9FFF' //自定义选中色值
						//,skip: true //开启跳页
						,
					jump: function(obj, first) {
						if (!first) {
							layer.msg('第' + obj.curr + '页', {
								offset: 'b'
							});
						}
					}
				});

				//滑块
				var sliderInst = slider.render({
					elem: '#sliderDemo1',
					input: true //输入框
				});

				//底部信息
				var footerTpl = lay('#footer1')[0].innerHTML;
				lay('#footer').html(layui.laytpl(footerTpl).render({}))
					.removeClass('layui-hide');
			});
		</script>
		<script type="text/html" id="barDemo1">
			<a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
			<a class="layui-btn layui-btn-xs" lay-event="edit">编辑s</a>
			<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
		</script>
		
		
	<script>
			layui.use(['laydate', 'laypage', 'layer', 'table', 'carousel', 'upload', 'element', 'slider'], function() {
				var laydate = layui.laydate //日期
					,
					laypage = layui.laypage //分页
					,
					layer = layui.layer //弹层
					,
					table = layui.table //表格
					,
					carousel = layui.carousel //轮播
					,
					upload = layui.upload //上传
					,
					element = layui.element //元素操作
					,
					slider = layui.slider //滑块

				//向世界问个好
				layer.msg('Hello World');

				//监听Tab切换
				element.on('tab(demo)', function(data) {
					layer.tips('切换了 ' + data.index + '：' + this.innerHTML, this, {
						tips: 1
					});
				});

				//执行一个 table 实例
				var tableIns = table.render({
					elem: '#demo2',
					height: 420,
					//${requestScope.url != null  ? requestScope.url : "querytestReload"}
					url: 'SongController?method=query' //数据接口
						,
					title: '用户表',
					page: true //开启分页
						,
					toolbar: 'default' //开启工具栏，此处显示默认图标，可以自定义模板，详见文档
						,
					cols: [
						[ //表头
							{
								type: 'checkbox',
								fixed: 'left'
							},{
								field: 'songName',
								title: '歌曲',
								width: 200,
								sort: true,
								fixed: 'left'
							},  {
								field: 'singerName',
								title: '歌手',
								width: 100,
								sort: true
							},  {
								field: 'typeName',
								title: '类型',
								width: 150,
								sort: true,
							}, {
								field: 'VV',
								title: '播放量',
								width: 70,
								sort: true
							}, {
								field: 'url',
								title: '歌曲保存路径',
								width: 250,
								sort: true
							}, {
								field: 'lrcUrl',
								title: '歌词保存路径',
								width: 150,
								sort: true
							}, {
								field: 'uploadDate',
								title: '上传时间',
								width: 180,
								sort: true,
								templet:function (d) { return dateToStr(d.uploadDate);}
							},{
								fixed: 'right',
								width: 150,
								align:'center',
								toolbar: '#barDemo2'
							}
						]
					]
				});
				 $('#query2').click(function () {
						var sex = $('#sex2').val();
						var state = $('#state2').val();
					    tableIns.reload({
						url: 'UserController',
					  	 where:{
							method : 'querySome',
							sex : sex,
							state : state
						}
					   
					   });
				});
				
				//监听行工具事件
				table.on('tool(test2)', function(obj) { //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
					var data = obj.data //获得当前行数据
						,
						layEvent = obj.event; //获得 lay-event 对应的值
					if (layEvent === 'edit') {
						layer.open({
							//layer提供了5种层类型。可传入的值有：0（信息框，默认）1（页面层）2（iframe层）3（加载层）4（tips层）
							type:2,
							title:"添加到歌单",
							shade: 0.5,//遮罩
							shadeClose:true,
							btn: ['关闭'],
							area: ['70%','70%'],
							end:function(){  //层销毁后触发的回调。数据表格重载
								 tableIns.reload({
									url: 'SongController?method=query',
								 });
							},
							content:'SongController?method=updataPage&songId='+data.songId
						});
					}
				});

				//监听头工具栏事件
				table.on('toolbar(test2)', function(obj) {
					var checkStatus = table.checkStatus(obj.config.id),
						data = checkStatus.data; //获取选中的数据
					switch (obj.event) {
						case 'add':
							layer.msg('添加');
							break;
						case 'update':
							if (data.length === 0) {
								layer.msg('请选择一行');
							} else if (data.length > 1) {
								layer.msg('只能同时编辑一个');
							} else {
								layer.alert('编辑 [id]：' + checkStatus.data[0].id);
							}
							break;
						case 'delete':
							if (data.length === 0) {
								layer.msg('请选择一行');
							} else {
								layer.msg('删除');
							}
							break;
					};
				});


				//执行一个轮播实例
				carousel.render({
					elem: '#test2',
					width: '100%' //设置容器宽度
						,
					height: 200,
					arrow: 'none' //不显示箭头
						,
					anim: 'fade' //切换动画方式
				});

				//将日期直接嵌套在指定容器中
				var dateIns = laydate.render({
					elem: '#laydateDemo2',
					position: 'static',
					calendar: true //是否开启公历重要节日
						,
					mark: { //标记重要日子
						'0-10-14': '生日',
						'2018-08-28': '新版',
						'2018-10-08': '神秘'
					},
					done: function(value, date, endDate) {
						if (date.year == 2017 && date.month == 11 && date.date == 30) {
							dateIns.hint('一不小心就月底了呢');
						}
					},
					change: function(value, date, endDate) {
						layer.msg(value)
					}
				});
				//分页
				laypage.render({
					elem: 'pageDemo2' //分页容器的id
						,
					count: 100 //总页数
						,
					skin: '#1E9FFF' //自定义选中色值
						//,skip: true //开启跳页
						,
					jump: function(obj, first) {
								console.log(obj)
						if (!first) {
							layer.msg('第' + obj.curr + '页', {
								offset: 'b'
							});
						}
					}
				});

				//上传
				upload.render({
					elem: '#uploadDemo2',
					url: 'SongController?method=upload' //上传接口
						,
					accept: 'audio' //音频
						,
					auto: false
						,
					bindAction: '#test9'
						,
					before: function () {    //上传之前的调用
		                this.data={
		                	"singerName": $('#singerName2').val(),
		                	"typeName": $('#typeName2').val()
		                	}
		            },
					done: function(res) {
						//如果上传成功 
			            if(res.code === 520){ 
			                return layer.msg('上传成功'); 
			                } 
			            //上传成功 
		                return layer.msg('上传失败'); 
					}
				});
				
				//实现3个上传功能
				//上传歌曲
				upload.render({
					elem: '#uploadsongfile1',
					url: 'SongController?method=upload' //上传接口
						,
					accept: 'audio' //音频
						,
					auto: false
						,
					bindAction: '#startupload1'   //绑定开始上传按钮
						,
					before: function () {    //上传之前的调用
		                this.data={
		                	"singerName": $('#uploadform1singerName').val(),
		                	"typeName": $('#uploadform1typeName').val()
		                	}
		            },
					done: function(res) {
						//如果上传成功 
						console.log(res);
			            if(res.code === 520){ 
			                return layer.msg('上传成功'); 
			                } 
			            //上传成功 
		                return layer.msg('上传失败'); 
					}
				});
				
				//上传歌词
				upload.render({
					elem: '#uploadlrcfile2',
					url: 'SongController?method=upload' //上传接口
						,
					accept: 'file' //普通文件
						,
					auto: false
						,
					bindAction: '#startupload2'   //绑定开始上传按钮
						,
					before: function () {    //上传之前的调用
		                this.data={
		                	"songName": $('#uploadform2songName').val()
		                	}
		            },
					done: function(res) {
						//如果上传成功 
			            if(res.code === 520){ 
			                return layer.msg('上传成功'); 
			                } 
			            //上传成功 
		                return layer.msg('上传失败'); 
					}
				});
				      
				//上传歌手图片
				upload.render({
					elem: '#uploadphotofile3',
					url: 'SongController?method=upload' //上传接口
						,
					accept: 'file' //普通文件
						,
					auto: false
						,
					bindAction: '#startupload3'   //绑定开始上传按钮
						,
					before: function () {    //上传之前的调用
		                this.data={
		                	"singerPhoto": $('#uploadform3photo').val()
		                	}
		            },
					done: function(res) {
						//如果上传成功 
						console.log(res);
			            if(res.code === 520){ 
			                return layer.msg('上传成功'); 
			                } 
			            //上传成功 
		                return layer.msg('上传失败'); 
					}
				});

				//滑块
				var sliderInst = slider.render({
					elem: '#sliderDemo2',
					input: true //输入框
				});

				//底部信息
				var footerTpl = lay('#footer2')[0].innerHTML;
				lay('#footer2').html(layui.laytpl(footerTpl).render({}))
					.removeClass('layui-hide');
			});
		</script>
		<script>
			layui.use(['laydate', 'laypage', 'layer', 'table', 'carousel', 'upload', 'element', 'slider'], function() {
				var laydate = layui.laydate //日期
					,
					laypage = layui.laypage //分页
					,
					layer = layui.layer //弹层
					,
					table = layui.table //表格
					,
					carousel = layui.carousel //轮播
					,
					upload = layui.upload //上传
					,
					element = layui.element //元素操作
					,
					slider = layui.slider //滑块

				//向世界问个好
				layer.msg('Hello World');

				//监听Tab切换
				element.on('tab(demo)', function(data) {
					layer.tips('切换了 ' + data.index + '：' + this.innerHTML, this, {
						tips: 1
					});
				});

				//执行一个 table 实例
				var tableSinger = table.render({
					elem: '#demo3',
					height: 420,
					//${requestScope.url != null  ? requestScope.url : "querytestReload"}
					url: 'SingerController?method=query' //数据接口
						,
					title: '用户表',
					page: true //开启分页
						,
					toolbar: 'default' //开启工具栏，此处显示默认图标，可以自定义模板，详见文档
						,
					cols: [
						[ //表头
							{
								type: 'checkbox',
								fixed: 'left'
							},{
								field: 'singerName',
								title: '姓名',
								width: 90,
								sort: true,
								fixed: 'left'
							}, {
								field: 'sex',
								title: '性别',
								width: 80,
								sort: true,
								templet:function (d) { return sexToStr(d.sex);}
							},{
								field: 'hobby',
								title: '爱好',
								width: 200,
								sort: true
							}, {
								field: 'birthday',
								title: '出生日期',
								width: 170,
								sort: true,
							},{
								field: 'photoUrl',
								title: '照片路径',
								width: 200,
								sort: true
							},{
								fixed: 'right',
								width: 120,
								align:'center',
								toolbar: '#barDemo3'
							}
						]
					]
				});

				//监听行工具事件
				table.on('tool(test3)', function(obj) { //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
					var data = obj.data //获得当前行数据
						,
						layEvent = obj.event; //获得 lay-event 对应的值
					if (layEvent === 'del') {
						layer.confirm('真的删除行吗', function(index) {
							obj.del(); //删除对应行（tr）的DOM结构
							layer.close(index);
							//console.log(data);
							//向服务端发送删除指令
							});
					} else if (layEvent === 'edit') {
						layer.open({
							//layer提供了5种层类型。可传入的值有：0（信息框，默认）1（页面层）2（iframe层）3（加载层）4（tips层）
							type:2,
							title:"修改歌手信息",
							shade: 0.5,//遮罩
							shadeClose:true,
							btn: ['关闭'],
							area: ['70%','70%'],
							end:function(){  //层销毁后触发的回调。数据表格重载
								 tableSinger.reload({
									url: 'SingerController?method=query',
								 });
							},
							content:'SingerController?method=updataPage&Sid='+data.sid
						});
					}
				});
				
				//监听头工具栏事件
				table.on('toolbar(test)', function(obj) {
					var checkStatus = table.checkStatus(obj.config.id),
						data = checkStatus.data; //获取选中的数据
					switch (obj.event) {
						case 'add':
							layer.msg('添加');
							break;
						case 'update':
							if (data.length === 0) {
								layer.msg('请选择一行');
							} else if (data.length > 1) {
								layer.msg('只能同时编辑一个');
							} else {
								layer.alert('编辑 [id]：' + checkStatus.data[0].id);
							}
							break;
						case 'delete':
							if (data.length === 0) {
								layer.msg('请选择一行');
							} else {
								layer.msg('删除');
							}
							break;
					};
				});


				//执行一个轮播实例
				carousel.render({
					elem: '#test3',
					width: '100%' //设置容器宽度
						,
					height: 200,
					arrow: 'none' //不显示箭头
						,
					anim: 'fade' //切换动画方式
				});

				//将日期直接嵌套在指定容器中
				var dateIns = laydate.render({
					elem: '#laydateDemo3',
					position: 'static',
					calendar: true //是否开启公历重要节日
						,
					mark: { //标记重要日子
						'0-10-14': '生日',
						'2018-08-28': '新版',
						'2018-10-08': '神秘'
					},
					done: function(value, date, endDate) {
						if (date.year == 2017 && date.month == 11 && date.date == 30) {
							dateIns.hint('一不小心就月底了呢');
						}
					},
					change: function(value, date, endDate) {
						layer.msg(value)
					}
				});

				//分页
				laypage.render({
					elem: 'pageDemo3' //分页容器的id
						,
					count: 100 //总页数
						,
					skin: '#1E9FFF' //自定义选中色值
						//,skip: true //开启跳页
						,
					jump: function(obj, first) {
						if (!first) {
							layer.msg('第' + obj.curr + '页', {
								offset: 'b'
							});
						}
					}
				});

				//滑块
				var sliderInst = slider.render({
					elem: '#sliderDemo3',
					input: true //输入框
				});

				//底部信息
				var footerTpl = lay('#footer3')[0].innerHTML;
				lay('#footer3').html(layui.laytpl(footerTpl).render({}))
					.removeClass('layui-hide');
			});
		</script>
		
		<script>
			layui.use(['laydate', 'laypage', 'layer', 'table', 'carousel', 'upload', 'element', 'slider'], function() {
				var laydate = layui.laydate //日期
					,
					laypage = layui.laypage //分页
					,
					layer = layui.layer //弹层
					,
					table = layui.table //表格
					,
					carousel = layui.carousel //轮播
					,
					upload = layui.upload //上传
					,
					element = layui.element //元素操作
					,
					slider = layui.slider //滑块

				//向世界问个好
				layer.msg('Hello World');

				//监听Tab切换
				element.on('tab(demo)', function(data) {
					layer.tips('切换了 ' + data.index + '：' + this.innerHTML, this, {
						tips: 1
					});
				});

				//执行一个 table 实例
				var tableAlbum = table.render({
					elem: '#demo4',
					height: 420,
					//${requestScope.url != null  ? requestScope.url : "querytestReload"}
					url: 'AlbumController?method=query' //数据接口
						,
					title: '专辑表',
					page: true //开启分页
						,
					toolbar: 'default' //开启工具栏，此处显示默认图标，可以自定义模板，详见文档
						,
					cols: [
						[ //表头
							{
								type: 'checkbox',
								fixed: 'left'
							},{
								field: 'singerName',
								title: '歌手',
								width: 80,
								sort: true,
								fixed: 'left'
							},{
								field: 'albumName',
								title: '专辑',
								width: 90,
								sort: true,
							}, {
								field: 'albumIntroduce',
								title: '专辑介绍',
								width: 850,
								sort: true
							},{
								fixed: 'right',
								width: 120,
								align:'center',
								toolbar: '#barDemo4'
							}
						]
					]
				});

				//监听行工具事件
				table.on('tool(test4)', function(obj) { //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
					var data = obj.data //获得当前行数据
						,
						layEvent = obj.event; //获得 lay-event 对应的值
					if (layEvent === 'del') {
						layer.confirm('真的删除行吗', function(index) {
							obj.del(); //删除对应行（tr）的DOM结构
							layer.close(index);
							//console.log(data);
							//向服务端发送删除指令
							});
					} else if (layEvent === 'edit') {
						layer.open({
							//layer提供了5种层类型。可传入的值有：0（信息框，默认）1（页面层）2（iframe层）3（加载层）4（tips层）
							type:2,
							title:"修改专辑信息",
							shade: 0.5,//遮罩
							shadeClose:true,
							btn: ['关闭'],
							area: ['70%','70%'],
							content:'AlbumController?method=updataPage&Aid='+data.aid,
							end:function(){  //层销毁后触发的回调。数据表格重载
								 tableAlbum.reload({
									url: 'AlbumController?method=query',
								 });
							}
						});
					}
				});
				
				//监听头工具栏事件
				table.on('toolbar(test4)', function(obj) {
					var checkStatus = table.checkStatus(obj.config.id),
						data = checkStatus.data; //获取选中的数据
					switch (obj.event) {
						case 'add':
							layer.open({
								//layer提供了5种层类型。可传入的值有：0（信息框，默认）1（页面层）2（iframe层）3（加载层）4（tips层）
								type:2,
								title:"添加专辑",
								shade: 0.5,//遮罩
								shadeClose:true,
								btn: ['关闭'],
								area: ['70%','70%'],
								content:'albumAdd.jsp',
								end:function(){  //层销毁后触发的回调。数据表格重载
									 tableAlbum.reload({
										url: 'AlbumController?method=query',
									 });
								}
							});
							break;
						case 'update':
							if (data.length === 0) {
								layer.msg('请选择一行');
							} else if (data.length > 1) {
								layer.msg('只能同时编辑一个');
							} else {
								layer.alert('编辑 [id]：' + checkStatus.data[0].id);
							}
							break;
						case 'delete':
							if (data.length === 0) {
								layer.msg('请选择一行');
							} else {
								layer.msg('删除');
							}
							break;
					};
				});


				//执行一个轮播实例
				carousel.render({
					elem: '#test4',
					width: '100%' //设置容器宽度
						,
					height: 200,
					arrow: 'none' //不显示箭头
						,
					anim: 'fade' //切换动画方式
				});

				//将日期直接嵌套在指定容器中
				var dateIns = laydate.render({
					elem: '#laydateDemo4',
					position: 'static',
					calendar: true //是否开启公历重要节日
						,
					mark: { //标记重要日子
						'0-10-14': '生日',
						'2018-08-28': '新版',
						'2018-10-08': '神秘'
					},
					done: function(value, date, endDate) {
						if (date.year == 2017 && date.month == 11 && date.date == 30) {
							dateIns.hint('一不小心就月底了呢');
						}
					},
					change: function(value, date, endDate) {
						layer.msg(value)
					}
				});

				//分页
				laypage.render({
					elem: 'pageDemo4' //分页容器的id
						,
					count: 100 //总页数
						,
					skin: '#1E9FFF' //自定义选中色值
						//,skip: true //开启跳页
						,
					jump: function(obj, first) {
						if (!first) {
							layer.msg('第' + obj.curr + '页', {
								offset: 'b'
							});
						}
					}
				});

				//滑块
				var sliderInst = slider.render({
					elem: '#sliderDemo4',
					input: true //输入框
				});

				//底部信息
				var footerTpl = lay('#footer4')[0].innerHTML;
				lay('#footer4').html(layui.laytpl(footerTpl).render({}))
					.removeClass('layui-hide');
			});
		</script>
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		<!-- 数据分析   获取用户及歌手男性人数和总数，计算出男女比例-->
		<script type="text/javascript">
			$(function(){
				var result = $.ajax({
					url : 'JsonDataInterface?method=maleFemaleRatio',
					async : false,   //同步请求
					dataType: 'json',
				});
		        var maleFemaleRatio = result.responseJSON;
		        console.log(maleFemaleRatio);
		        // 基于准备好的dom，初始化echarts实例
		        var myChart = echarts.init(document.getElementById('main1'));
				var symbols = [
				    'path://M18.2629891,11.7131596 L6.8091608,11.7131596 C1.6685112,11.7131596 0,13.032145 0,18.6237673 L0,34.9928467 C0,38.1719847 4.28388932,38.1719847 4.28388932,34.9928467 L4.65591984,20.0216948 L5.74941883,20.0216948 L5.74941883,61.000787 C5.74941883,65.2508314 11.5891201,65.1268798 11.5891201,61.000787 L11.9611506,37.2137775 L13.1110872,37.2137775 L13.4831177,61.000787 C13.4831177,65.1268798 19.3114787,65.2508314 19.3114787,61.000787 L19.3114787,20.0216948 L20.4162301,20.0216948 L20.7882606,34.9928467 C20.7882606,38.1719847 25.0721499,38.1719847 25.0721499,34.9928467 L25.0721499,18.6237673 C25.0721499,13.032145 23.4038145,11.7131596 18.2629891,11.7131596 M12.5361629,1.11022302e-13 C15.4784742,1.11022302e-13 17.8684539,2.38997966 17.8684539,5.33237894 C17.8684539,8.27469031 15.4784742,10.66467 12.5361629,10.66467 C9.59376358,10.66467 7.20378392,8.27469031 7.20378392,5.33237894 C7.20378392,2.38997966 9.59376358,1.11022302e-13 12.5361629,1.11022302e-13',
				    'path://M28.9624207,31.5315864 L24.4142575,16.4793596 C23.5227152,13.8063773 20.8817445,11.7111088 17.0107398,11.7111088 L12.112691,11.7111088 C8.24168636,11.7111088 5.60080331,13.8064652 4.70917331,16.4793596 L0.149791395,31.5315864 C-0.786976655,34.7595013 2.9373074,35.9147532 3.9192135,32.890727 L8.72689855,19.1296485 L9.2799493,19.1296485 C9.2799493,19.1296485 2.95992025,43.7750224 2.70031069,44.6924335 C2.56498417,45.1567684 2.74553639,45.4852068 3.24205501,45.4852068 L8.704461,45.4852068 L8.704461,61.6700801 C8.704461,64.9659872 13.625035,64.9659872 13.625035,61.6700801 L13.625035,45.360657 L15.5097899,45.360657 L15.4984835,61.6700801 C15.4984835,64.9659872 20.4191451,64.9659872 20.4191451,61.6700801 L20.4191451,45.4852068 L25.8814635,45.4852068 C26.3667633,45.4852068 26.5586219,45.1567684 26.4345142,44.6924335 C26.1636859,43.7750224 19.8436568,19.1296485 19.8436568,19.1296485 L20.3966199,19.1296485 L25.2043926,32.890727 C26.1862111,35.9147532 29.9105828,34.7595013 28.9625083,31.5315864 L28.9624207,31.5315864 Z M14.5617154,0 C17.4960397,0 19.8773132,2.3898427 19.8773132,5.33453001 C19.8773132,8.27930527 17.4960397,10.66906 14.5617154,10.66906 C11.6274788,10.66906 9.24611767,8.27930527 9.24611767,5.33453001 C9.24611767,2.3898427 11.6274788,0 14.5617154,0 L14.5617154,0 Z',
				    'path://M512 292.205897c80.855572 0 146.358821-65.503248 146.358821-146.358821C658.358821 65.503248 592.855572 0 512 0 431.144428 0 365.641179 65.503248 365.641179 146.358821 365.641179 227.214393 431.144428 292.205897 512 292.205897zM512 731.282359c-80.855572 0-146.358821 65.503248-146.358821 146.358821 0 80.855572 65.503248 146.358821 146.358821 146.358821 80.855572 0 146.358821-65.503248 146.358821-146.358821C658.358821 796.273863 592.855572 731.282359 512 731.282359z'
				];
				var bodyMax = 100; //指定图形界限的值
				var labelSetting = {
				    normal: {
				        show: true,
				        position: 'bottom',
				        offset: [0, 10],
				        formatter: function(param) {
				            return (param.value / bodyMax * 100).toFixed(0) + '%';
				        },
				        textStyle: {
				            fontSize: 18,
				            fontFamily: 'Arial',
				            color: '#686868'
				        }
				    }
				};
				
				var markLineSetting = { //设置标线
				    symbol: 'none',
				    lineStyle: {
				        normal: {
				            opacity: 0.3
				        }
				    },
				    data: [{
				        type: 'max',
				        label: {
				            normal: {
				                formatter: 'max: {c}'
				            }
				        }
				    }, {
				        type: 'min',
				        label: {
				            normal: {
				                formatter: 'min: {c}'
				            }
				        }
				    }]
				};
				
				var option = {
				    tooltip: {
				        show: false, //鼠标放上去显示悬浮数据
				    },
				    legend: {
				        data: ['歌手男女比例', '用户男女比例'],
				        selectedMode: 'single',
				        itemWidth: 10, //图例的宽度
				        itemHeight: 10, //图例的高度
				        itemGap: 30,
				        orient: 'horizontal',
				        left: 'center',
				        top: '20px',
				        icon: 'rect',
				        // selectedMode: false, //取消图例上的点击事件
				        textStyle: {
				            color: '#808492'
				        },
				    },
				    grid: {
				        // left: '20%',
				        // right: '20%',
				        top: '20%',
				        bottom: '20%',
				        containLabel: true
				    },
				    xAxis: {
				        data: ['a', 'x', 'b'],
				        axisTick: {
				            show: false
				        },
				        axisLine: {
				            show: false
				        },
				        axisLabel: {
				            show: false
				        }
				    },
				    yAxis: {
				        max: bodyMax,
				        splitLine: {
				            show: false
				        },
				        axisTick: {
				            // 刻度线
				            show: false
				        },
				        axisLine: {
				            // 轴线
				            show: false
				        },
				        axisLabel: {
				            // 轴坐标文字
				            show: false
				        }
				    },
				    series: [{
				            name: '歌手男女比例',
				            type: 'pictorialBar',
				            symbolClip: true,
				            symbolBoundingData: bodyMax,
				            label: labelSetting,
				            data: [{
				                    value: maleFemaleRatio.singerMan,
				                    symbol: symbols[0],
				                    itemStyle: {
				                        normal: {
				                            color: 'rgba(105,204,230)' //单独控制颜色
				                        }
				                    },
				                },
				                {
				
				                },
				                {
				                    value: maleFemaleRatio.singerWoman,
				                    symbol: symbols[1],
				                    itemStyle: {
				                        normal: {
				                            color: 'rgba(255,130,130)' //单独控制颜色
				                        }
				                    },
				                }
				            ],
				            // markLine: markLineSetting,
				            z: 10
				        },
				        {
				            name: '用户男女比例',
				            type: 'pictorialBar',
				            symbolClip: true,
				            symbolBoundingData: bodyMax,
				            label: labelSetting,
				            data: [{
				                    value: maleFemaleRatio.userMan,
				                    symbol: symbols[0]
									
				                },
				                {},
				                {
				                    value: maleFemaleRatio.userWoman,
				                    symbol: symbols[1]
				                }
				            ],
				            // markLine: markLineSetting,
				            z: 10
				        },
				        {
				            // 设置背景底色，不同的情况用这个
				            name: 'full',
				            type: 'pictorialBar', //异型柱状图 图片、SVG PathData
				            symbolBoundingData: bodyMax,
				            animationDuration: 0,
				            itemStyle: {
				                normal: {
				                    color: '#ccc' //设置全部颜色，统一设置
				                }
				            },
				            z: 10,
				            data: [{
				                    itemStyle: {
				                        normal: {
				                            color: 'rgba(105,204,230,0.40)' //单独控制颜色
				                        }
				                    },
				                    value: 100,
				                    symbol: symbols[0]
				                },
				                {
				                    // 设置中间冒号
				                    itemStyle: {
				                        normal: {
				                            color: '#1DA1F2' //单独控制颜色
				                        }
				                    },
				                    value: 100,
				                    symbol: symbols[2],
				                    symbolSize: [8, '18%'],
				                    symbolOffset: [0, '-200%']
				                },
				                {
				                    itemStyle: {
				                        normal: {
				                            color: 'rgba(255,130,130,0.40)' //单独控制颜色
				                        }
				                    },
				                    value: 100,
				                    symbol: symbols[1]
				                }
				            ]
				        }
				    ]
				}
		
		        myChart.setOption(option);
			})	
		    </script>
		
</body>
</html>