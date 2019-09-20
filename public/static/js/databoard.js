/**

 @Name：layuiAdmin 主页示例
 @Author：star1029
 @Site：http://www.layui.com/admin/
 @License：GPL-2

 */


layui.define(function(exports) {

    // 招聘信息统计
    layui.use(['index', 'echarts'], function() {
        let $ = layui.$;
        let echarts = layui.echarts;

        let echartsApp = [];
        let options = {
            tooltip: {
                trigger: 'item',
                formatter: "{a} <br/>{b}: {c} ({d}%)"
            },
            legend: {
                orient: 'vertical',
                x: 'right',
                data: ['在招职位数','候选人数','面试邀约人数','确认入职人数','经纪人数','简历总数']
            },
            series: [{
                name: '招聘信息',
                type: 'pie',
                radius: ['30%', '50%'],
                center: ['40%', '40%'],
                avoidLabelOverlap: false,
                label: {
                    normal: {
                        show: false,
                        position: 'center'
                    },
                    emphasis: {
                        show: true,
                        textStyle: {
                            fontSize: '30',
                            fontWeight: 'bold'
                        }
                    }
                },
                labelLine: {
                    normal: {
                        show: false
                    }
                },
                data: [{
                    value: 335,
                    name: '在招职位数'
                }, {
                    value: 310,
                    name: '候选人数'
                }, {
                    value: 234,
                    name: '面试邀约人数'
                }, {
                    value: 135,
                    name: '确认入职人数'
                }, {
                    value: 1548,
                    name: '经纪人数'
                }, {
                    value: 1548,
                    name: '简历总数'
                }]
            }]
        };
        let elemDataView = $('#data-board-pie1').children('div');
        let renderDataView = function(index) {
            echartsApp[index] = echarts.init(elemDataView[index], layui.echartsTheme);
            echartsApp[index].setOption(options);
            window.onresize = echartsApp[index].resize;
        };

        //没找到DOM，终止执行
        if (!elemDataView[0]) return;

        renderDataView(0);
    });

    // 人员变动趋势
    layui.use(['index', 'echarts'], function() {
        let $ = layui.$;
        let echarts = layui.echarts;

        let echartsApp = [];
        let options = [
            {
                tooltip: {
                    trigger: 'axis'
                },
                calculable: true,
                legend: {
                    data: ['在招职位数','候选人数','面试邀约人数','确认入职人数','经纪人数','简历总数']
                },

                xAxis: [
                    {
                        type: 'category',
                        data: ['第1季度', '第2季度', '第3季度', '第4季度']
                    }
                ],
                yAxis: [
                    {
                        type: 'value',
                        name: '人数',
                        axisLabel: {
                            formatter: '{value}'
                        }
                    },
                ],
                series: [
                    {
                        name: '在招职位数',
                        type: 'line',
                        data: [335, 235, 435, 635]
                    },
                    {
                        name: '候选人数',
                        type: 'line',
                        data: [310, 110, 360, 610]
                    },
                    {
                        name: '面试邀约人数',
                        type: 'line',
                        data: [234, 160, 434, 634]
                    },
                    {
                        name: '确认入职人数',
                        type: 'line',
                        data: [135, 80, 206, 300]
                    },
                    {
                        name: '经纪人数',
                        type: 'line',
                        data: [648, 248, 508, 348]
                    },
                    {
                        name: '简历总数',
                        type: 'line',
                        data: [548, 448, 748, 948]
                    }
                ]
            }
        ]
            , elemDataView = $('#data-board-line1').children('div')
            , renderDataView = function (index) {
            echartsApp[index] = echarts.init(elemDataView[index], layui.echartsTheme);
            echartsApp[index].setOption(options[index]);
            window.onresize = echartsApp[index].resize;
        };
        //没找到DOM，终止执行
        if (!elemDataView[0]) return;
        renderDataView(0);
    });

    // 雇员信息统计
    layui.use(['index', 'echarts'], function() {
        let $ = layui.$;
        let echarts = layui.echarts;

        let echartsApp = [];
        let options = {
            tooltip: {
                trigger: 'item',
                formatter: "{a} <br/>{b}: {c} ({d}%)"
            },
            legend: {
                orient: 'vertical',
                x: 'right',
                data: ['待入职人数','在职人数','离职人数']
            },
            series: [{
                name: '招聘信息',
                type: 'pie',
                radius: ['30%', '50%'],
                center: ['40%', '40%'],
                avoidLabelOverlap: false,
                label: {
                    normal: {
                        show: false,
                        position: 'center'
                    },
                    emphasis: {
                        show: true,
                        textStyle: {
                            fontSize: '30',
                            fontWeight: 'bold'
                        }
                    }
                },
                labelLine: {
                    normal: {
                        show: false
                    }
                },
                data: [{
                    value: 335,
                    name: '待入职人数'
                }, {
                    value: 310,
                    name: '在职人数'
                }, {
                    value: 234,
                    name: '离职人数'
                }]
            }]
        };
        let elemDataView = $('#data-board-pie2').children('div');
        let renderDataView = function(index) {
            echartsApp[index] = echarts.init(elemDataView[index], layui.echartsTheme);
            echartsApp[index].setOption(options);
            window.onresize = echartsApp[index].resize;
        };

        //没找到DOM，终止执行
        if (!elemDataView[0]) return;

        renderDataView(0);
    });

    // 人员变动趋势
    layui.use(['index', 'echarts'], function() {
        let $ = layui.$;
        let echarts = layui.echarts;

        let echartsApp = [];
        let options = [
            {
                tooltip: {
                    trigger: 'axis'
                },
                calculable: true,
                legend: {
                    data: ['待入职人数','在职人数','离职人数']
                },

                xAxis: [
                    {
                        type: 'category',
                        data: ['第1季度', '第2季度', '第3季度', '第4季度']
                    }
                ],
                yAxis: [
                    {
                        type: 'value',
                        name: '人数',
                        axisLabel: {
                            formatter: '{value}'
                        }
                    },
                ],
                series: [
                    {
                        name: '待入职人数',
                        type: 'line',
                        data: [335, 235, 435, 635]
                    },
                    {
                        name: '在职人数',
                        type: 'line',
                        data: [310, 110, 360, 610]
                    },
                    {
                        name: '离职人数',
                        type: 'line',
                        data: [234, 160, 434, 634]
                    },
                ]
            }
        ]
            , elemDataView = $('#data-board-line2').children('div')
            , renderDataView = function (index) {
            echartsApp[index] = echarts.init(elemDataView[index], layui.echartsTheme);
            echartsApp[index].setOption(options[index]);
            window.onresize = echartsApp[index].resize;
        };
        //没找到DOM，终止执行
        if (!elemDataView[0]) return;
        renderDataView(0);
    });

    // 薪酬信息统计
    layui.use(['index', 'echarts'], function() {
        let $ = layui.$;
        let echarts = layui.echarts;

        let echartsApp = [];
        let options = {
            tooltip: {
                trigger: 'item',
                formatter: "{a} <br/>{b}: {c} ({d}%)"
            },
            legend: {
                orient: 'vertical',
                x: 'right',
                data: ['发薪人员','发薪金额']
            },
            series: [{
                name: '招聘信息',
                type: 'pie',
                radius: ['30%', '50%'],
                center: ['40%', '40%'],
                avoidLabelOverlap: false,
                label: {
                    normal: {
                        show: false,
                        position: 'center'
                    },
                    emphasis: {
                        show: true,
                        textStyle: {
                            fontSize: '30',
                            fontWeight: 'bold'
                        }
                    }
                },
                labelLine: {
                    normal: {
                        show: false
                    }
                },
                data: [{
                    value: 335,
                    name: '发薪人员'
                }, {
                    value: 310,
                    name: '发薪金额'
                }]
            }]
        };
        let elemDataView = $('#data-board-pie3').children('div');
        let renderDataView = function(index) {
            echartsApp[index] = echarts.init(elemDataView[index], layui.echartsTheme);
            echartsApp[index].setOption(options);
            window.onresize = echartsApp[index].resize;
        };

        //没找到DOM，终止执行
        if (!elemDataView[0]) return;

        renderDataView(0);
    });

    // 人员变动趋势
    layui.use(['index', 'echarts'], function() {
        let $ = layui.$;
        let echarts = layui.echarts;

        let echartsApp = [];
        let options = [
            {
                tooltip: {
                    trigger: 'axis'
                },
                calculable: true,
                legend: {
                    data: ['发薪人员','发薪金额']
                },

                xAxis: [
                    {
                        type: 'category',
                        data: ['第1季度', '第2季度', '第3季度', '第4季度']
                    }
                ],
                yAxis: [
                    {
                        type: 'value',
                        name: '人数',
                        axisLabel: {
                            formatter: '{value}'
                        }
                    },
                ],
                series: [
                    {
                        name: '发薪人员',
                        type: 'line',
                        data: [335, 235, 435, 635]
                    },
                    {
                        name: '发薪金额',
                        type: 'line',
                        data: [310, 110, 360, 610]
                    },
                ]
            }
        ]
            , elemDataView = $('#data-board-line3').children('div')
            , renderDataView = function (index) {
            echartsApp[index] = echarts.init(elemDataView[index], layui.echartsTheme);
            echartsApp[index].setOption(options[index]);
            window.onresize = echartsApp[index].resize;
        };
        //没找到DOM，终止执行
        if (!elemDataView[0]) return;
        renderDataView(0);
    });

    // 社保信息统计
    layui.use(['index', 'echarts'], function() {
        let $ = layui.$;
        let echarts = layui.echarts;

        let echartsApp = [];
        let options = {
            tooltip: {
                trigger: 'item',
                formatter: "{a} <br/>{b}: {c} ({d}%)"
            },
            legend: {
                orient: 'vertical',
                x: 'right',
                data: ['参保人员','增员接单人数','增员成功人数','减员接单人数','减员成功人数','补缴接单人数','补缴成功人数']
            },
            series: [{
                name: '招聘信息',
                type: 'pie',
                radius: ['30%', '50%'],
                center: ['40%', '40%'],
                avoidLabelOverlap: false,
                label: {
                    normal: {
                        show: false,
                        position: 'center'
                    },
                    emphasis: {
                        show: true,
                        textStyle: {
                            fontSize: '30',
                            fontWeight: 'bold'
                        }
                    }
                },
                labelLine: {
                    normal: {
                        show: false
                    }
                },
                data: [{
                    value: 335,
                    name: '参保人员'
                }, {
                    value: 310,
                    name: '增员接单人数'
                }, {
                    value: 234,
                    name: '增员成功人数'
                }, {
                    value: 135,
                    name: '减员接单人数'
                }, {
                    value: 1548,
                    name: '减员成功人数'
                }, {
                    value: 1548,
                    name: '补缴接单人数'
                }, {
                    value: 1548,
                    name: '补缴成功人数'
                }]
            }]
        };
        let elemDataView = $('#data-board-pie4').children('div');
        let renderDataView = function(index) {
            echartsApp[index] = echarts.init(elemDataView[index], layui.echartsTheme);
            echartsApp[index].setOption(options);
            window.onresize = echartsApp[index].resize;
        };

        //没找到DOM，终止执行
        if (!elemDataView[0]) return;

        renderDataView(0);
    });

    // 人员变动趋势
    layui.use(['index', 'echarts'], function() {
        let $ = layui.$;
        let echarts = layui.echarts;

        let echartsApp = [];
        let options = [
            {
                tooltip: {
                    trigger: 'axis'
                },
                calculable: true,
                legend: {
                    data: ['参保人员','增员接单人数','增员成功人数','减员接单人数','减员成功人数','补缴接单人数','补缴成功人数']
                },

                xAxis: [
                    {
                        type: 'category',
                        data: ['第1季度', '第2季度', '第3季度', '第4季度']
                    }
                ],
                yAxis: [
                    {
                        type: 'value',
                        name: '人数',
                        axisLabel: {
                            formatter: '{value}'
                        }
                    },
                ],
                series: [
                    {
                        name: '参保人员',
                        type: 'line',
                        data: [335, 235, 435, 635]
                    },
                    {
                        name: '增员接单人数',
                        type: 'line',
                        data: [310, 110, 360, 610]
                    },
                    {
                        name: '增员成功人数',
                        type: 'line',
                        data: [234, 160, 434, 634]
                    },
                    {
                        name: '减员接单人数',
                        type: 'line',
                        data: [135, 80, 206, 300]
                    },
                    {
                        name: '减员成功人数',
                        type: 'line',
                        data: [648, 248, 508, 348]
                    },
                    {
                        name: '补缴接单人数',
                        type: 'line',
                        data: [548, 448, 748, 948]
                    },
                    {
                        name: '补缴成功人数',
                        type: 'line',
                        data: [548, 448, 748, 948]
                    }
                ]
            }
        ]
            , elemDataView = $('#data-board-line4').children('div')
            , renderDataView = function (index) {
            echartsApp[index] = echarts.init(elemDataView[index], layui.echartsTheme);
            echartsApp[index].setOption(options[index]);
            window.onresize = echartsApp[index].resize;
        };
        //没找到DOM，终止执行
        if (!elemDataView[0]) return;
        renderDataView(0);
    });

    // 劳动合同信息统计
    layui.use(['index', 'echarts'], function() {
        let $ = layui.$;
        let echarts = layui.echarts;

        let echartsApp = [];
        let options = {
            tooltip: {
                trigger: 'item',
                formatter: "{a} <br/>{b}: {c} ({d}%)"
            },
            legend: {
                orient: 'vertical',
                x: 'right',
                data: ['在招职位数','候选人数','面试邀约人数','确认入职人数','经纪人数','简历总数']
            },
            series: [{
                name: '招聘信息',
                type: 'pie',
                radius: ['30%', '50%'],
                center: ['40%', '40%'],
                avoidLabelOverlap: false,
                label: {
                    normal: {
                        show: false,
                        position: 'center'
                    },
                    emphasis: {
                        show: true,
                        textStyle: {
                            fontSize: '30',
                            fontWeight: 'bold'
                        }
                    }
                },
                labelLine: {
                    normal: {
                        show: false
                    }
                },
                data: [{
                    value: 335,
                    name: '在招职位数'
                }, {
                    value: 310,
                    name: '候选人数'
                }, {
                    value: 234,
                    name: '面试邀约人数'
                }, {
                    value: 135,
                    name: '确认入职人数'
                }, {
                    value: 1548,
                    name: '经纪人数'
                }, {
                    value: 1548,
                    name: '简历总数'
                }]
            }]
        };
        let elemDataView = $('#data-board-pie5').children('div');
        let renderDataView = function(index) {
            echartsApp[index] = echarts.init(elemDataView[index], layui.echartsTheme);
            echartsApp[index].setOption(options);
            window.onresize = echartsApp[index].resize;
        };

        //没找到DOM，终止执行
        if (!elemDataView[0]) return;

        renderDataView(0);
    });

    // 人员变动趋势
    layui.use(['index', 'echarts'], function() {
        let $ = layui.$;
        let echarts = layui.echarts;

        let echartsApp = [];
        let options = [
            {
                tooltip: {
                    trigger: 'axis'
                },
                calculable: true,
                legend: {
                    data: ['在招职位数','候选人数','面试邀约人数','确认入职人数','经纪人数','简历总数']
                },

                xAxis: [
                    {
                        type: 'category',
                        data: ['第1季度', '第2季度', '第3季度', '第4季度']
                    }
                ],
                yAxis: [
                    {
                        type: 'value',
                        name: '人数',
                        axisLabel: {
                            formatter: '{value}'
                        }
                    },
                ],
                series: [
                    {
                        name: '在招职位数',
                        type: 'line',
                        data: [335, 235, 435, 635]
                    },
                    {
                        name: '候选人数',
                        type: 'line',
                        data: [310, 110, 360, 610]
                    },
                    {
                        name: '面试邀约人数',
                        type: 'line',
                        data: [234, 160, 434, 634]
                    },
                    {
                        name: '确认入职人数',
                        type: 'line',
                        data: [135, 80, 206, 300]
                    },
                    {
                        name: '经纪人数',
                        type: 'line',
                        data: [648, 248, 508, 348]
                    },
                    {
                        name: '简历总数',
                        type: 'line',
                        data: [548, 448, 748, 948]
                    }
                ]
            }
        ]
            , elemDataView = $('#data-board-line5').children('div')
            , renderDataView = function (index) {
            echartsApp[index] = echarts.init(elemDataView[index], layui.echartsTheme);
            echartsApp[index].setOption(options[index]);
            window.onresize = echartsApp[index].resize;
        };
        //没找到DOM，终止执行
        if (!elemDataView[0]) return;
        renderDataView(0);
    });

    // 经纪人统计分析
    layui.use(['index', 'echarts'], function() {
        let $ = layui.$;
        let echarts = layui.echarts;

        let echartsApp = [];
        let options = {
            tooltip: {
                trigger: 'item',
                formatter: "{a} <br/>{b}: {c} ({d}%)"
            },
            legend: {
                orient: 'vertical',
                x: 'right',
                data: ['待审核经纪人','已通过经纪人','已失效经纪人']
            },
            series: [{
                name: '招聘信息',
                type: 'pie',
                radius: ['30%', '50%'],
                center: ['40%', '40%'],
                avoidLabelOverlap: false,
                label: {
                    normal: {
                        show: false,
                        position: 'center'
                    },
                    emphasis: {
                        show: true,
                        textStyle: {
                            fontSize: '30',
                            fontWeight: 'bold'
                        }
                    }
                },
                labelLine: {
                    normal: {
                        show: false
                    }
                },
                data: [{
                    value: 335,
                    name: '待审核经纪人'
                }, {
                    value: 310,
                    name: '已通过经纪人'
                }, {
                    value: 234,
                    name: '已失效经纪人'
                }]
            }]
        };
        let elemDataView = $('#data-board-pie6').children('div');
        let renderDataView = function(index) {
            echartsApp[index] = echarts.init(elemDataView[index], layui.echartsTheme);
            echartsApp[index].setOption(options);
            window.onresize = echartsApp[index].resize;
        };

        //没找到DOM，终止执行
        if (!elemDataView[0]) return;

        renderDataView(0);
    });

    exports('data_board', {})
});