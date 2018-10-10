<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TestChart.aspx.cs" Inherits="CrisisInterfere.FunctionModular.GroupReport.TestChart" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <script src="../../JS/jquery-2.0.3.min.js"></script>
    <script>
        $(function () {
            Highcharts.chart('container', {
                chart: {
                    type: 'area'
                },
                title: {
                    text: 'US and USSR nuclear stockpiles'
                },
                subtitle: {
                    text: 'Source: <a href="http://thebulletin.metapress.com/content/c4120650912x74k7/fulltext.pdf">' +
                        'thebulletin.metapress.com</a>'
                },
                xAxis: {
                    allowDecimals: false,
                    labels: {
                        formatter: function () {
                            return this.value; // clean, unformatted number for year
                        }
                    }
                },
                yAxis: {
                    title: {
                        text: 'Nuclear weapon states'
                    },
                    labels: {
                        formatter: function () {
                            return this.value / 1000 + 'k';
                        }
                    }
                },
                tooltip: {
                    pointFormat: '{series.name} produced <b>{point.y:,.0f}</b><br/>warheads in {point.x}'
                },
                plotOptions: {
                    area: {
                        pointStart: 1940,
                        marker: {
                            enabled: false,
                            symbol: 'circle',
                            radius: 2,
                            states: {
                                hover: {
                                    enabled: true
                                }
                            }
                        }
                    }
                },
                series: [{
                    name: 'USA',
                    data: [null, null, null, null, null, 6, 11, 32, 110, 235, 369, 640,
                        1005, 1436, 2063, 3057, 4618, 6444, 9822, 15468, 20434, 24126,
                        27387, 29459, 31056, 31982, 32040, 31233, 29224, 27342, 26662,
                        26956, 27912, 28999, 28965, 27826, 25579, 25722, 24826, 24605,
                        24304, 23464, 23708, 24099, 24357, 24237, 24401, 24344, 23586,
                        22380, 21004, 17287, 14747, 13076, 12555, 12144, 11009, 10950,
                        10871, 10824, 10577, 10527, 10475, 10421, 10358, 10295, 10104]
                }, {
                    name: 'USSR/Russia',
                    data: [null, null, null, null, null, null, null, null, null, null,
                        5, 25, 50, 120, 150, 200, 426, 660, 869, 1060, 1605, 2471, 3322,
                        4238, 5221, 6129, 7089, 8339, 9399, 10538, 11643, 13092, 14478,
                        15915, 17385, 19055, 21205, 23044, 25393, 27935, 30062, 32049,
                        33952, 35804, 37431, 39197, 45000, 43000, 41000, 39000, 37000,
                        35000, 33000, 31000, 29000, 27000, 25000, 24000, 23000, 22000,
                        21000, 20000, 19000, 18000, 18000, 17000, 16000]
                }]
            });
        });
    </script>
</head>
<body>


    
    <li class=""><a href="#" onclick="return OnSetCollapseIn(this);"><i class="fa fa-heartbeat"></i>心理测验<span class="fa arrow"></span></a><ul class="nav nav-second-level collapse" style="height: 0px;">
        <li style="background-color: RGB(56,100,153)"><a data-id="14" href="/functionmodular/heartevaluation/heartevaluation.aspx" onclick="return OnSetCollapseIn(this);">量表管理</a></li>
        <li><a data-id="15" href="/FunctionModular/HeartEvaluation_DistributionRecord/DistributionRecord.aspx" onclick="return OnSetCollapseIn(this);">分配记录</a></li>
        <li><a data-id="16" href="/FunctionModular/PersonalReport/PersonalReport.aspx" onclick="return OnSetCollapseIn(this);">个体报告</a></li>
        <li><a data-id="17" href="/FunctionModular/GroupReport/GroupReport.aspx" onclick="return OnSetCollapseIn(this);">团体报告</a></li>
        <li><a data-id="18" href="/FunctionModular/StatisticalAnalysis/Statistical.aspx" onclick="return OnSetCollapseIn(this);">统计分析</a></li>
        <li><a data-id="19" href="/FunctionModular/HeartEvaluation/MyTest.aspx" onclick="return OnSetCollapseIn(this);">我的测验</a></li>
        <li><a data-id="20" href="/FunctionModular/HeartEvaluation/ViewResult.aspx" onclick="return OnSetCollapseIn(this);">查看结果</a></li>
    </ul>
    </li>
    <li class="active"><a href="#" onclick="return OnSetCollapseIn(this);"><i class="fa fa-heartbeat"></i>心理测验<span class="fa arrow"></span></a><ul class="nav nav-second-level collapse in" style="height: auto;">
        <li style="background-color: RGB(56,100,153)"><a data-id="14" href="/functionmodular/heartevaluation/heartevaluation.aspx" onclick="return OnSetCollapseIn(this);">量表管理</a></li>
        <li><a data-id="15" href="/FunctionModular/HeartEvaluation_DistributionRecord/DistributionRecord.aspx" onclick="return OnSetCollapseIn(this);">分配记录</a></li>
        <li><a data-id="16" href="/FunctionModular/PersonalReport/PersonalReport.aspx" onclick="return OnSetCollapseIn(this);">个体报告</a></li>
        <li><a data-id="17" href="/FunctionModular/GroupReport/GroupReport.aspx" onclick="return OnSetCollapseIn(this);">团体报告</a></li>
        <li><a data-id="18" href="/FunctionModular/StatisticalAnalysis/Statistical.aspx" onclick="return OnSetCollapseIn(this);">统计分析</a></li>
        <li><a data-id="19" href="/FunctionModular/HeartEvaluation/MyTest.aspx" onclick="return OnSetCollapseIn(this);">我的测验</a></li>
        <li><a data-id="20" href="/FunctionModular/HeartEvaluation/ViewResult.aspx" onclick="return OnSetCollapseIn(this);">查看结果</a></li>
    </ul>
    </li>
</body>
</html>

