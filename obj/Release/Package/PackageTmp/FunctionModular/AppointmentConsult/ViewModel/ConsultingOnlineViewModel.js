var CanSend = true;
var viewModel;
var navName = '/FunctionModular/AppointmentConsult/ConsultingOnline.aspx';

$(document).ready(function () {
    viewModel = new ConsultingOnlineViewModel();
    $("#myModal ul.dropdown-menu li a").on("click", function () {
        var temp = $(this).attr("data-val");
        var res = new Array();
        res.push({
            type: "DelayConsulting",
            mine: [{
                avatar: viewModel.info.Avatar == undefined ? "" : viewModel.info.Avatar
                , content: ""
                , id: viewModel.info.ID  //我的id
                , mine: true //是否我发送的消息
                , username: viewModel.info.UserName  //我的昵称
            }],
            to: [{
                avatar: ""
                , id: viewModel.info.RoomID//自己的房间号    排班ID
                , sign: ""
                , type: "friend" //聊天类型
                , username: ""
                , name: ""
            }]
        });
        var str = JSON.stringify(res);

        viewModel.webSocket.send(str);
        viewModel.Delay(temp);     
    });
    $('#myModal').on('show.bs.modal', function () {
        var $this = $(this);
        var $modal_dialog = $this.find('.modal-dialog');
        // 关键代码，如没将modal设置为 block，则$modala_dialog.height() 为零
        $this.css('display', 'block');
        $modal_dialog.css({ 'margin-top': Math.max(0, ($(window).height() - $modal_dialog.height()) / 2) });
    });

    //$("[data-href='" + navName + "']").css("color", "white");
    //$("[data-href='" + navName + "']").parent().css("background-color", "RGB(56,100,153)");
    //$("[data-href='" + navName + "']").parent().parent().attr("class", "nav nav-second-level collapse in");
    //$("[data-href='" + navName + "']").parent().parent().parent().attr("class", "active");
    //$("[data-href='" + navName + "']").parent().parent().css("height", "auto");

});
function AddLayerTip(ele) {
    $(ele).each(function () {
        $(this).attr("data-href", $(this).attr("href")).css("cursor", "pointer").removeAttr("href").on("click", function () {
            var href = $(this).attr("data-href");
            layer.open({
                title: '提示'
                , content: '退出后记录将清空，是否退出当前窗口？'
                , zIndex: 100000001
                , btn: ['确定', '取消']
                , yes: function (index, layero) {
                    window.location = href;
                }
                , btn2: function (index, layero) {
                    $(".layui-layer-ico.layui-layer-close.layui-layer-close1").click();
                }
            });
        })
    });
}
function ConsultingOnlineViewModel() {
    var self = this;
    self.layims;
    self.info;//获取参数，个人相关信息
    self.introduce;//简介部分
    self.appDate;//预约时间字符串
    self.interval;//定时器，用于清除定时
    self.endChatTimeOut;//判断是否延时的定时器
    self.closeChat;//关闭窗口的定时器
    self.hasApp;//是否有预约
    self.appTime = "";
    self.startTime;
    self.endTime;
    self.serverTimespan;
    self.webSocket;

    self.GetServerTime = function () {
        return new Date((new Date().getTime() + self.serverTimespan));
    }
    //字符串判空方法，若为空返回""
    self.StringRemoveNull = function (string) {
        return string ? string : "";
    }
    self.GetParams = function () {
        NewAJAX({
            url: "Ajax/ConsultingOnline.ashx",
            dataType: "text",
            data: { operationType: 'GetParams' },
            callBack: function (result) {
                //获取个人的基本信息
                var model = JSON.parse(result);
                self.hasApp = (model.HasApp === "true");
                self.info = model;
                if (self.info.Avatar == "")
                    self.info.Avatar = "/assets/images/gallery/userimg.jpg";
                //判断是否有预约
                if (self.hasApp) {
                    var startTime = new Date(model.StartDate);//预约开始时间
                    var endTime = new Date(model.EndDate);//预约结束时间
                    self.serverTimespan = new Date(model.Time).getTime() - new Date().getTime();
                    self.startTime = startTime;
                    self.endTime = endTime;
                    self.appDate = startTime.getFullYear() + '-' + (Array(2).join('0') + (startTime.getMonth() + 1)).slice(-2) + '-' + (Array(2).join('0') + startTime.getDate()).slice(-2);
                    self.appTime = (Array(2).join('0') + startTime.getHours()).slice(-2) + ':' + (Array(2).join('0') + startTime.getMinutes()).slice(-2) + '~' +
                        (Array(2).join('0') + endTime.getHours()).slice(-2) + ':' + (Array(2).join('0') + endTime.getMinutes()).slice(-2);
                    var type;
                    var isfriend = -1;
                    if (self.info.RoleID == '3') {
                        if (self.info.Type == "friend")
                            isfriend = 1;
                        else
                            isfriend = 0;
                        type = 'GetConsultantAbout';
                    }
                    else {
                        if (self.info.Type == "friend") {
                            type = 'GetVisitorAbout';
                        }
                        else
                            type = 'GetGroupAbout'
                    }

                    NewAJAX({
                        url: "Ajax/ConsultingOnline.ashx",
                        dataType: "text",
                        data: { operationType: type, roomID: self.info.RoomID, isFriend: isfriend },
                        callBack: function (result) {
                            if (result) {
                                //获取右侧面板的信息
                                self.introduce = JSON.parse(result);
                                self.LoadRight();
                            }
                        }
                    });
                }
                else {
                    self.info.RoomID = "0";
                    self.LoadRight();
                }

            }
        });
    }

    //加载右侧咨询师简介和群成员
    self.LoadRight = function () {
        self.interval = setInterval(function () {
            var ele = $('.layui-layer.layui-layer-page.layui-box.layui-layim-chat.layer-anim')
            if (ele.length > 0) {
                //添加兼容手机的div wrap
                $('.layui-layer.layui-layer-page.layui-box.layui-layim-chat.layer-anim').wrap("<div class='row' style='position:fixed;overflow-x:scroll'></div>")                        
                $('.layui-layer.layui-layer-page.layui-box.layui-layim-chat.layer-anim').css({
                    "min-width": "300px",
                    "width": "360px",
                 
                    //"left": "300px",
                    "text-align:": "center",
                    "overflow":"auto"
                });
                
               // 添加右侧咨询师/来访者简介框
                //添加成员列表框
                $('.layui-layer.layui-layer-page.layui-box.layui-layim-chat.layer-anim').append("<div id='Counselor' style='float: left;width: 298px;height: 363px;position: absolute;left: 360px;TOP: -1px;border: 1px solid #dcdcdc;background: #f2f2f2;overflow-y:auto;overflow-x:auto;'></div>");
                $('.layui-layer.layui-layer-page.layui-box.layui-layim-chat.layer-anim').append("<div id='Members' style='float: left;width: 298px;height: 157px;position: absolute;left: 360px;TOP: 362px;border: 1px solid #dcdcdc;background: #f2f2f2;overflow-y:auto; overflow-x:auto;'></div>");
                //移除最大化按钮
                $(".layui-layer-setwin a").eq(1).remove();
                self.ClearSendEvent();
                clearInterval(self.interval);

                if (self.hasApp) {
                    AddLayerTip("#main-menu .nav-second-level li a");
                    AddLayerTip("#MsgID a");
                    AddLayerTip("ul.dropdown-menu.dropdown-user li:first a");
                    AddLayerTip(".navbar-brand");
                    AddLayerTip("#MyIndex");

                    $("ul.dropdown-menu.dropdown-user li:last a").each(function () {
                        var click = $(this).attr("onclick");
                        $(this).removeAttr("onclick").click(function () {
                            layer.open({
                                title: '提示'
                                , content: '退出后记录将清空，是否退出当前窗口？'
                                , zIndex: 100000001
                                , btn: ['确定', '取消']
                                , yes: function (index, layero) {
                                    eval(click);
                                }
                                , btn2: function (index, layero) {
                                    $(".layui-layer-ico.layui-layer-close.layui-layer-close1").click();
                                }
                            });
                        });

                    });

                    self.StartChat(self.startTime);//执行定时开启聊天室的方法

                    if (self.info.RoleID == '3') {
                        self.AddConsultantAbout(self.introduce);
                    }
                    else {
                        if (self.info.Type == "friend")
                            self.AddVisitorAbout(self.introduce);
                        else
                            self.AddGroupAbout(self.introduce);
                        $(".layui-icon.layim-tool-NoSpeak").attr("data-Speak", "NoSpeak").on("click", function () {
                            var type;
                            if ($(this).attr("data-Speak") == "NoSpeak") {
                                type = "bannedSpeak";
                                $(this).attr("data-Speak", "CanSpeak")
                                $(this).find("img").attr("src", "layui/images/解除禁言.png")
                            }
                            else {
                                type = "unBannedSpeak";
                                $(this).attr("data-Speak", "NoSpeak");
                                $(this).find("img").attr("src", "layui/images/全员禁言.png")
                            }
                            var res = new Array();
                            res.push({
                                type: type,
                                mine: [{
                                    avatar: self.info.Avatar == undefined ? "" : self.info.Avatar
                                    , content: ""
                                    , id: self.info.ID  //我的id
                                    , mine: true //是否我发送的消息
                                    , username: self.info.UserName  //我的昵称
                                }],
                                to: [{
                                    avatar: ""
                                    , id: self.info.RoomID//自己的房间号    排班ID
                                    , sign: ""
                                    , type: "friend" //聊天类型
                                    , username: ""
                                    , name: ""
                                }]
                            });
                            var str = JSON.stringify(res);

                            self.webSocket.send(str);

                        });
                        $(".layui-icon.layim-tool-Export").on("click", function () {
                            var recordsText = '';
                            $(".layim-chat-main ul li").each(function () {
                                var userName = $(this).find("cite").clone();
                                userName.find(':nth-child(n)').remove();
                                userName = userName.text();
                                var dateTime = $(this).find("cite i").text();
                                recordsText += userName + "  " + dateTime + "\r\n";

                                var text = $(this).find(".layim-chat-text").html();
                                var ltIndex = text.indexOf("<");
                                while (ltIndex >= 0) {
                                    var firstString = text.substring(0, text.indexOf("<"));
                                    recordsText += firstString;
                                    var titleIndex = text.indexOf("title");
                                    var endindex = text.indexOf("\"", titleIndex + 7);
                                    recordsText += text.substring(titleIndex + 7, endindex);
                                    text = text.substring(text.indexOf(">") + 1, text.length);
                                    ltIndex = text.indexOf("<");
                                }
                                recordsText += text + "\r\n";
                            })
                            var record = new Blob([recordsText], { type: "text/plain;charset=utf-8" });

                            saveAs(record, self.info.UserName + "聊天记录.txt");

                        });
                    }
                }
                else {
                    self.AddConsultantAbout(false);
                }
            }
        }, 100);
       
       
    }
    //初始化聊天窗口
    self.Initialize = function () {
        if (self.info) {
            if (self.info.RoleID == "3") {
                layui.use('layim', function (layim) {
                    self.layims = layim;//初始化
                    layim.config({
                        init: {
                            mine: {
                                "username": self.info.UserName //我的昵称
                                , "id": self.info.ID //我的ID
                                , "status": "online" //在线状态 online：在线、hide：隐身
                                , "sign": "在深邃的编码世界，做一枚轻盈的纸飞机" //我的签名
                                , "avatar": self.info.Avatar //我的头像
                            }
                        }
                        , brief: true //是否简约模式（如果true则不显示主面板）
                        , chatLog: ''
                    }).chat({
                        name: (self.appTime ? '(预约时间' + self.appTime + ')' : '') + '<h5>(窗口提前5分钟开放)</h5>'
                        , type: "friend"
                        , id: self.info.RoomID//排班ID
                      , avatar: self.info.Avatar
                    });
                });
            }
            else {
                if (self.info.Type == "friend")
                    layui.use('layim', function (layim) {
                        self.layims = layim;//初始化
                        layim.config({
                            init: {
                                mine: {
                                    "username": self.info.UserName //我的昵称
                                    , "id": self.info.ID //我的ID
                                    , "status": "online" //在线状态 online：在线、hide：隐身
                                    , "sign": "在深邃的编码世界，做一枚轻盈的纸飞机" //我的签名
                                    , "avatar": self.info.Avatar //我的头像
                                }
                            }
                           , tool: [{
                               alias: 'Export' //工具别名
                               , title: '导出' //工具名称
                               , icon: '<img src="layui/images/导出.png" />' //工具图标，参考图标文档
                           }]
                            , brief: true //是否简约模式（如果true则不显示主面板）
                            , chatLog: ''
                        }).chat({
                            name: (self.appTime ? '(预约时间' + self.appTime + ')' : '') + '<h5>(窗口提前5分钟开放)</h5>'
                            , type: "friend"
                            , id: self.info.RoomID//排班ID
                          , avatar: self.info.Avatar
                        });
                    });
                else
                    layui.use('layim', function (layim) {
                        self.layims = layim;//初始化
                        layim.config({
                            init: {
                                mine: {
                                    "username": self.info.UserName //我的昵称
                                    , "id": self.info.ID //我的ID
                                    , "status": "online" //在线状态 online：在线、hide：隐身
                                    , "sign": "在深邃的编码世界，做一枚轻盈的纸飞机" //我的签名
                                    , "avatar": self.info.Avatar //我的头像
                                }
                            }
                           , tool: [{
                               alias: 'Export' //工具别名
                               , title: '导出' //工具名称
                               , icon: '<img src="layui/images/导出.png" />' //工具图标，参考图标文档
                           }
                           , {
                               alias: 'NoSpeak' //工具别名
                               , title: '全员禁言' //工具名称
                               , icon: '<img src="layui/images/全员禁言.png" />' //工具图标，参考图标文档
                           }]
                            , brief: true //是否简约模式（如果true则不显示主面板）
                            , chatLog: ''
                        }).chat({
                            name: (self.appTime ? '(预约时间' + self.appTime + ')' : '') + '<h5>(窗口提前5分钟开放)</h5>'
                            , type: "friend"
                            , id: self.info.RoomID//排班ID
                          , avatar: self.info.Avatar
                        });
                    });
            }
        }
        else {
            layui.use('layim', function (layim) {
                self.layims = layim;//初始化
                layim.config({
                    init: {
                        mine: {
                            "username": "" //我的昵称
                            , "id": 0 //我的ID
                            , "status": "online" //在线状态 online：在线、hide：隐身
                            , "sign": "在深邃的编码世界，做一枚轻盈的纸飞机" //我的签名
                            , "avatar": "/assets/images/gallery/userimg.jpg" //我的头像
                        }
                    }
                    , brief: true //是否简约模式（如果true则不显示主面板）
                    , chatLog: ''
                }).chat({
                    name: (self.appTime ? '(预约时间' + self.appTime + ')' : '') + '<h5>(窗口提前5分钟开放)</h5>'
                    , type: "friend"
                    , id: "0"//排班ID
                  , avatar: "/assets/images/gallery/userimg.jpg"
                });
            });
        }
    }
    //监听发送消息事件，并对发送的数据进行格式化
    self.MonitorSendChatMessage = function (layim) {
        layim.on('sendMessage', function (res) {
            var _mine = res.mine;
            var _to = res.to;
            var res = new Array();
            res.push({
                type: 'chatMessage',
                mine: [{
                    avatar: _mine.avatar == undefined ? "" : _mine.avatar
                    , content: _mine.content
                    , id: _mine.id  //我的id
                    , mine: true //是否我发送的消息
                    , username: _mine.username  //我的昵称
                }],
                to: [{
                    avatar: _to.avatar
                    , id: _to.id//自己的房间号    排班ID
                    , sign: _to.sign == undefined ? "" : _to.sign
                    , type: _to.type //聊天类型
                    , username: _to.username == undefined ? "" : _to.username
                    , name: _to.name == undefined ? "" : _to.name
                }]
            });
            var str = JSON.stringify(res);
            self.webSocket.send(str);
        });
    }
    //向成员列表中添加新成员
    self.AddMembers = function (id, img, userName) {
        if ($("#Members div[data-id=" + id + "]").length == 0)
            $("#Members").append("<div style='height:46px;line-height:46px;'  data-id=" + id + "><img src='" + img + "' style='width:36px;height:36px;border-radius:100%;margin-left:10px;'/><span style='height:46px;line-height:46px;margin-left:20px;color:#666666;'>" + userName + "<span></div>");
    }
    self.RemoveMembers = function (id) {
        $("#Members div[data-id=" + id + "]").remove();
    }
    //定时开启聊天会话
    self.StartChat = function (date) {
        var startDate = new Date(date);
        var MillisecondsSub = startDate.getTime() - self.GetServerTime().getTime();

        if (MillisecondsSub <= 300000) {
            self.BeginConnect();//连接服务器
            self.MonitorSendChatMessage(self.layims);//增加信息发送监听事件
            self.AddSendEvent();//增加发送消息按钮事件
            self.AddCloseElement();
            self.EndChat(self.endTime);//聊天关闭定时
        }
        else if (MillisecondsSub <= 604800000) {
            setTimeout(function () {
                self.BeginConnect();//连接服务器
                self.MonitorSendChatMessage(self.layims);//增加信息发送监听事件
                self.AddSendEvent();//增加发送消息按钮事件
                self.AddCloseElement();
                self.EndChat(self.endTime);//聊天关闭定时
            }, MillisecondsSub - 300000);
        }
    }
    //定时关闭聊天会话
    self.EndChat = function (date) {
        var Milliseconds = new Date(date).getTime() - self.GetServerTime().getTime();
        if (self.info.RoleID != "3") {
            if (Milliseconds <= 0) {
                self.webSocket.close();
                layer.open({
                    title: '结束提示'
                    , zIndex: 100000001
                    , content: '您好，预约时间已到，本次咨询将关闭。'
                    , end: function (index, layero) {
                        location.reload(true);
                    }
                });
            }
            else if (Milliseconds <= 300000) {
                self.closeChat = setTimeout(function () {
                    //发送关闭客户端消息
                    self.webSocket.close();
                    layer.open({
                        title: '结束提示'
                        , zIndex: 100000001
                        , content: '您好，预约时间已到，本次咨询将关闭。'
                        , end: function (index, layero) {
                            location.reload(true);
                        }
                    });
                }, Milliseconds);
                $('#myModal').modal('show');
            }
            else {
                self.endChatTimeOut = setTimeout(function () {
                    //判断是否延时
                    $('#myModal').modal('show');
                }, Milliseconds - 300000);
                self.closeChat = setTimeout(function () {
                    //发送关闭客户端消息
                    self.webSocket.close();
                    layer.open({
                        title: '结束提示'
                        , zIndex: 100000001
                        , content: '您好，预约时间已到，本次咨询将关闭。'
                        , end: function (index, layero) {
                            location.reload(true);
                        }
                    });
                }, Milliseconds);
            }
        }
        else {
            self.closeChat = setTimeout(function () {
                //发送关闭客户端消息
                self.webSocket.close();
                layer.open({
                    title: '结束提示'
                    , zIndex: 100000001
                    , content: '您好，由于咨询师未进入聊天室，预约时间已到，本次咨询聊天室将关闭。'
                    , end: function (index, layero) {
                        location.reload(true);
                    }
                });
            }, Milliseconds + 1000);
        }

    }
    //延时操作
    self.Delay = function (minutes) {
        var delayDate = new Date(new Date(self.info.EndDate).getTime() + minutes * 60 * 1000);
        self.info.EndDate = delayDate;
        clearTimeout(self.closeChat);
        self.EndChat(delayDate)
        $('#myModal').modal('hide');
    }
    //添加咨询师相关信息
    self.AddConsultantAbout = function (model) {
        $("#Counselor").empty();
        if (model) {
            $("#Counselor").append("<table style='color:#333333;text-align: right;margin-left: 20px;margin-top: 20px;'>" +
            "<tr><th style='padding-bottom: 20px;'>姓名：</th><td style='padding-bottom: 20px;text-align: left;word-wrap: break-word;word-break: break-all;'>" + model.userName + "</td></tr>" +
            "<tr><th>登录名：</th><td style='text-align: left;word-wrap: break-word;word-break: break-all;'>" + model.loginName + "</td></tr>" +
            "<tr><th style='padding-top: 20px;'>性别：</th><td style='text-align: left;padding-top: 20px;word-wrap: break-word;word-break: break-all;'>" + model.sex + "</td></tr>" +
            "<tr><th style='padding-top: 20px;' valign='top'>擅长领域：</th><td style='width: 188px;text-align: left;padding-top: 20px;word-wrap: break-word;word-break: break-all;'>" + model.territory + "</td></tr>" +
            "<tr><th style='padding-top: 20px;' valign='top'>简介：</th><td style='width: 188px;text-align: left;padding-top: 20px;word-wrap: break-word;word-break: break-all;'>" + model.abstract + "</td></tr>" +
            "<tr><th style='padding-top: 20px'>问题类型：</th><td style='text-align: left;padding-top: 20px;word-wrap: break-word;word-break: break-all;'>" + (model.QType == "" ? "不限" : model.QType) + "</td></tr>" +
            "<tr><th style='padding-top: 20px;padding-bottom: 20px;'>咨询时间：</th><td style='text-align: left;padding-top: 20px;padding-bottom: 20px;word-wrap: break-word;word-break: break-all;'>" + self.appDate + ' ' + self.appTime + "</td></tr>" +
            "</table>");
            $("#Counselor").attr("data-uID", model.uID);
        }
        else {
            $("#Counselor").append("<div style='line-height:363px;text-align: center;'>无预约</div>");
        }
    }
    //添加个体相关信息
    self.AddVisitorAbout = function (model) {
        $("#Counselor").empty();
        if (model) {
            $("#Counselor").append("<table style='color:#333333;text-align: right;margin-left: 20px;margin-top: 20px;'>" +
            "<tr><th style='padding-bottom: 20px;'>姓名：</th><td style='padding-bottom: 20px;text-align: left;word-wrap: break-word;word-break: break-all;'>" + model.userName + "</td></tr>" +
            "<tr><th>登录名：</th><td style='text-align: left;word-wrap: break-word;word-break: break-all;'>" + model.loginName + "</td></tr>" +
            "<tr><th style='padding-top: 20px;'>性别：</th><td style='text-align: left;padding-top: 20px;word-wrap: break-word;word-break: break-all;'>" + model.sex + "</td></tr>" +
            "<tr><th style='padding-top: 20px'>问题类型：</th><td style='text-align: left;padding-top: 20px;word-wrap: break-word;word-break: break-all;'>" + (model.QType == "" ? "不限" : model.QType) + "</td></tr>" +
            "<tr><th style='padding-top: 20px;'>咨询时间：</th><td style='text-align: left;padding-top: 20px;word-wrap: break-word;word-break: break-all;'>" + self.appDate + ' ' + self.appTime + "</td></tr>" +
            "<tr><th style='padding-top: 20px;padding-bottom: 20px;' valign='top'>问题详情：</th><td style='width: 188px;text-align: left;padding-top: 20px;padding-bottom: 20px;word-wrap: break-word;word-break: break-all;'>" + model.questionDescribe + "</td></tr>" +
            "</table>");
        }
        else {
            $("#Counselor").append("<div style='line-height:363px;text-align: center;'>无预约</div>");
        }
    }
    //添加团体相关信息
    self.AddGroupAbout = function (model) {
        $("#Counselor").empty();
        if (model) {
            $("#Counselor").append("<table style='color:#333333;text-align: right;margin-left: 20px;margin-top: 20px;'>" +
            "<tr><th style='padding-bottom: 20px;'>咨询主题：</th><td style='padding-bottom: 20px;text-align: left;word-wrap: break-word;word-break: break-all;'>" + model.Subject + "</td></tr>" +
            "<tr><th valign='top'>内容：</th><td style='width: 188px;text-align: left;word-wrap: break-word;word-break: break-all;'>" + model.Content + "</td></tr>" +
            "<tr><th style='padding-top: 20px;'>报名条件：</th><td style='text-align: left;padding-top: 20px;word-wrap: break-word;word-break: break-all;'>" + model.Condition + "</td></tr>" +
            "<tr><th style='padding-top: 20px;'>问题类型：</th><td style='text-align: left;padding-top: 20px;word-wrap: break-word;word-break: break-all;'>" + (model.QType == "" ? "不限" : model.QType) + "</td></tr>" +
            "<tr><th style='padding-top: 20px;'>预约日期：</th><td style='text-align: left;padding-top: 20px;word-wrap: break-word;word-break: break-all;'>" + self.appDate + ' ' + self.appTime + "</td></tr>" +
            "<tr><th style='padding-top: 20px;padding-bottom: 20px;'>咨询人数：</th><td style='text-align: left;padding-top: 20px;padding-bottom: 20px;word-wrap: break-word;word-break: break-all;'>" + model.Num + "</td></tr>" +
            "</table>");
        }
        else {
            $("#Counselor").append("<div style='line-height:363px;text-align: center;'>无预约</div>");
        }
    }

    //连接服务器方法
    self.BeginConnect = function () {
        var connstr = 'ws://' + self.info.IP + '?' + self.info.ID + '&' + self.info.RoomID + '&' + self.info.RoleID + '&' + self.info.UserName;
        self.webSocket = new WebSocket(connstr);
        self.MonitorReciveMessage();
        self.webSocket.onopen = function () {
            var res = new Array();
            res.push({
                type: 'Init',
                mine: [{
                    avatar: self.info.Avatar == undefined ? "" : self.info.Avatar
                    , content: ""
                    , id: self.info.ID  //我的id
                    , mine: true //是否我发送的消息
                    , username: self.info.UserName  //我的昵称
                }],
                to: [{
                    avatar: ""
                    , id: self.info.RoomID//自己的房间号    排班ID
                    , sign: ""
                    , type: "friend" //聊天类型
                    , username: ""
                    , name: ""
                }]
            });
            var str = JSON.stringify(res);

            self.webSocket.send(str);
        }
    }
    //监听接受消息
    self.MonitorReciveMessage = function () {
        self.webSocket.onmessage = function (evt) {
            var message = JSON.parse(evt.data);
            self.MessageDispose(message);
        }
    }
    //消息处理方法
    self.MessageDispose = function (message) {
        var messageType = message.MessageType;
        var messageContent = message.SendModel;
        switch (messageType) {
            case "controlMessage":
                self.ControlMessageDispose(messageContent);
                break;
            case "InitMember":
                var members = JSON.parse(messageContent.content);
                for (var i = 0; i < members.length; i++) {
                    var mine = members[i].mine[0];
                    if ($("#Counselor").attr("data-uID") == mine.id && self.info.RoleID == "3")
                        clearTimeout(self.closeChat);
                    self.AddMembers(mine.id, mine.avatar, mine.username);
                }
                break;
            default:
                if (messageType == "systemMessageOut") {
                    self.RemoveMembers(messageContent.fromid);
                }
                else if (messageType == "systemMessageIn") {
                    var mine = messageContent;
                    if ($("#Counselor").attr("data-uID") == mine.fromid && self.info.RoleID == "3")
                        clearTimeout(self.closeChat);
                    self.AddMembers(mine.fromid, mine.avatar, mine.username);
                }
                else
                    self.layims.getMessage({
                        system: self.StringRemoveNull(messageContent.system)
                        , username: self.StringRemoveNull(messageContent.username) //消息来源用户名
                        , avatar: self.StringRemoveNull(messageContent.avatar) //消息来源用户头像
                        , id: self.StringRemoveNull(messageContent.id)//消息的来源ID（如果是私聊，则是用户id，如果是群聊，则是群组id）
                        , type: self.StringRemoveNull(messageContent.type) //聊天窗口来源类型，从发送消息传递的to里面获取
                        , content: self.StringRemoveNull(decodeURI(messageContent.content)) //消息内容
                        , mine: self.StringRemoveNull(messageContent.mine)//是否我发送的消息，如果为true，则会显示在右方
                        , fromid: self.StringRemoveNull(messageContent.fromid) //消息的发送者id（比如群组中的某个消息发送者），可用于自动解决浏览器多窗口时的一些问题
                        , timestamp: self.StringRemoveNull(messageContent.timestamp) //服务端动态时间戳
                    });
                break;
        }
    }
    //特殊消息（系统控制消息）处理
    self.ControlMessageDispose = function (messageContent) {
        switch (self.StringRemoveNull(messageContent.content)) {
            case "CloseClient":
                //在此弹窗告诉来访者，咨询师关闭了聊天室
                clearTimeout(self.closeChat);
                layer.open({
                    title: '结束提示'
                    , zIndex: 100000001
                    , content: '您好，聊天室已被咨询师关闭，您将退出本次咨询。'
                    , end: function (index, layero) {
                        location.reload(true);
                    }
                });
                break;
            case "BannedSpeak":
                self.layims.getMessage({
                    system: true
                        , id: self.StringRemoveNull(messageContent.id)//消息的来源ID（如果是私聊，则是用户id，如果是群聊，则是群组id）
                        , type: self.StringRemoveNull(messageContent.type) //聊天窗口来源类型，从发送消息传递的to里面获取
                        , content: "咨询师开启了全员禁言模式" //消息内容
                });
                self.ClearSendEvent();
                break;
            case "UnBannedSpeak":
                self.layims.getMessage({
                    system: true
                        , id: self.StringRemoveNull(messageContent.id)//消息的来源ID（如果是私聊，则是用户id，如果是群聊，则是群组id）
                        , type: self.StringRemoveNull(messageContent.type) //聊天窗口来源类型，从发送消息传递的to里面获取
                        , content: "咨询师关闭了全员禁言模式" //消息内容
                });
                self.AddSendEvent();
                break;
            case "DelayConsulting":
                clearTimeout(self.closeChat);
            default:
                break;

        }
    }
    //清除发送消息事件
    self.ClearSendEvent = function () {
        var send = $('.layim-send-btn');
        if (send.length > 0) {
            send.eq(0).removeAttr('layim-event');
            send.attr("style", "background-color:#999999;");
            $('.layim-send-set').attr("style", "border-left:1px solid #888888;background-color:#999999;");
            CanSend = false;
            return true;
        }
        else
            return false;
    }
    //加载发送消息事件
    self.AddSendEvent = function () {
        var send = $('.layim-send-btn');
        if (send.length > 0) {
            send.eq(0).attr('layim-event', 'send');
            send.attr("style", "");
            $('.layim-send-set').attr("style", "");
            CanSend = true;
            return true;
        }
        else
            return false;
    }
    //清除关闭按钮
    self.ClearCloseElement = function () {
        var send = $('.layim-chat-send span.layim-send-close');
        if (send.length > 0) {
            send.eq(0).remove();
            return true;
        }
        else
            return false;
    }
    //添加关闭按钮
    self.AddCloseElement = function () {
        var sendBtn = $('.layim-send-btn');
        if (sendBtn.length > 0) {
            $("<span class='layim-send-close'>关闭</span>").on("click", function () {
                layer.open({
                    title: '提示'
                    , content: '退出后记录将清空，是否退出当前窗口？'
                    , zIndex: 100000001
                    , btn: ['确定', '取消']
                    , yes: function (index, layero) {
                        window.location = "/FunctionModular/AppointmentConsult/AppointmentManagement.aspx";
                    }
                    , btn2: function (index, layero) {
                        $(".layui-layer-ico.layui-layer-close.layui-layer-close1").click();
                    }
                });
            }).insertBefore(sendBtn);
            return true;
        }
        else
            return false;
    }


    //初始化阶段

    self.GetParams();
    self.Initialize();
}