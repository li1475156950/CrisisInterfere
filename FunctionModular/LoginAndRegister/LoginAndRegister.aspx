<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginAndRegister.aspx.cs" Inherits="CrisisInterfere.FunctionModular.LoginAndRegister.LoginAndRegister" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <link rel="icon" href="/favicon.ico" type="image/x-icon" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1.0" />
    <title>测评系统登录</title>
    <link href="../../CSS/bootstrap.css" rel="stylesheet" />
    <link href="../../assets/skin/layer.css" rel="stylesheet" />
    <link href="../../CSS/font-awesome.css" rel="stylesheet" />
    <link href="../../CSS/ligerFrom/ligerui-tree.css" rel="stylesheet" />
    <link href="../../CSS/ligerFrom/ligerui-form.css" rel="stylesheet" />
    <link href="../../CSS/bootstrapValidator.min.css" rel="stylesheet" />
    <style type="text/css">
        .box {
            background-image: url('../../Img/bj.jpg');
            height: 100%;
            width: 100%;
            margin: 0 auto;
            padding: 0;
            background-size: 100%;
            z-index: 0; 
        }

        .login-box {
            width: 100%;
            max-width: 500px;
            height: 400px;
            position: absolute;
            top: 50%;
            margin-top: -200px;
            /*设置负值，为要定位子盒子的一半高度*/
        }

        .register-box {
            width: 100%;
            max-width: 500px;
            height: 1050px;
            padding-top: 5%;
            top: 50%;
            margin: 0 auto;
            z-index: 0;
            /*设置负值，为要定位子盒子的一半高度*/
        }

            .register-box i {
                left: 80%;
            }

        @media screen and (min-width:500px) {
            .login-box {
                left: 50%;
                /*设置负值，为要定位子盒子的一半宽度*/
                margin-left: -250px;
            }
        }

        .form {
            width: 100%;
            max-width: 500px;
            height: 275px;
            margin: 25px auto 0px auto;
            padding-top: 25px;
        }

        .login-content {
            height: 330px;
            width: 100%;
            max-width: 500px;
            background-color: rgba(255, 250, 2550, .6);
            float: left;
        }

        .register-content {
            height: 100%;
            width: 100%;
            background-color: rgba(255, 250, 2550, .6);
            float: left;
        }


        .input-group {
            margin: 0px 0px 30px 0px !important;
        }

        .form-control,
        .input-group {
            height: 40px;
        }

        .form-group {
            margin-bottom: 0px !important;
        }

        .login-title {
            padding: 20px 10px;
            background-color: rgba(0, 0, 0, .6);
        }

            .login-title h1 {
                margin-top: 10px !important;
            }

            .login-title small {
                color: #fff;
            }

        .link p {
            line-height: 20px;
            margin-top: 30px;
        }

        .btn-sm {
            padding: 8px 24px !important;
            font-size: 16px !important;
        }

        .login-box i {
            left: 90%;
        }

        [data-bv-for=loginName] {
            color: rgb(169,68,66);
        }

        .l-tree {
            z-index: 10;
        }
    </style>

</head>

<body>
 <%--   <a onclick="YZXL0H();">000</a>--%>
    <div class="box">
        <%--<p class="sys-title" style="">京师博仁心理测评</p>--%>
        <div class="login-box">

            <div class="login-title text-center">
                <h1><small>登录</small></h1>
            </div>
            <div class="login-content ">
                <div class="form">
                    <form id="loginForm" method="post">
                        <div class="form-group">
                            <div class="col-xs-12  ">
                                <div class="input-group">
                                    <span class="input-group-addon"><span class="glyphicon glyphicon-user"></span></span>
                                    <input type="text" id="loginName" onmouseout="texttm()" name="loginName" maxlength="20" class="form-control" placeholder="用户名" />
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-xs-12  ">
                                <div class="input-group">
                                    <span class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></span>
                                    <input type="password" maxlength="20" id="loginPwd" name="loginPwd" class="form-control" placeholder="密码" />
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-xs-12  ">
                                <div class="input-group col-xs-12">
                                    <div class="col-xs-6">
                                        <span>
                                            <input type="checkbox" id="rememberPwd" />&nbsp;&nbsp;&nbsp;记住密码</span>
                                    </div>
                                    <div class="col-xs-6" style="text-align: left">
                                        <p class="text-center remove-margin">
                                            <a href="javascript:void(0)" onclick="ShowRegisterPage()"><small>立即注册</small></a>
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group form-actions">
                            <div class="col-xs-4 col-xs-offset-4 ">
                                <button  class="btn btn-sm btn-info"><span class="glyphicon glyphicon-off"></span>登录</button>
                            </div>
                        </div>
                        <%--<div class="form-group">
					<div class="col-xs-6 link">
						<p class="text-center remove-margin"><small>忘记密码？</small> <a href="javascript:void(0)" ><small>找回</small></a>
						</p>
					</div>
					<div class="col-xs-6 link">
						<p class="text-center remove-margin"><small>还没注册?</small> <a href="javascript:void(0)" onclick="ShowRegisterPage()"><small>注册</small></a>
						</p>
					</div>
				</div>--%>
                    </form>
                </div>
            </div>
        </div>
        <div class="register-box" style="display: none">
            <div class="login-title text-center">
                <h1><small>用户注册</small></h1>
            </div>
            <div class="register-content ">
                <div class="form">
                    <form id="registerForm" method="post" class="form-horizontal">
                        <div class="col-xs-12  form-group" style="height: 80px; margin: 0px auto">
                            <div class="panel panel-primary text-center" style="border: none">
                                <div class="lb-panel-left pull-left" style="width: 39px; height: 40px">
                                    <span class="input-group-addon" style="height: 40px"><span class="glyphicon glyphicon-user"></span></span>
                                </div>
                                <div class="lb-panel-right pull-left col-md-11 col-xs-10" style="text-align: left">
                                    <input type="text" style="margin-left: -15px" id="regName" name="loginName" class="form-control" maxlength="20" placeholder="登录名" />
                                </div>
                            </div>
                            <div class="col-xs-12" style="display: none" id="loginNameRule">
                                <small style="font-size: 14px; color: #808080">登录名可以由数字、字母、汉字组成，不可包含特殊字符</small>
                            </div>
                        </div>
                        <div class="col-xs-12  form-group" style="height: 80px; margin: 0px auto">
                            <div class="panel panel-primary text-center" style="border: none">
                                <div class="lb-panel-left pull-left" style="width: 39px; height: 40px">
                                    <span class="input-group-addon" style="height: 40px"><span class="glyphicon glyphicon-lock"></span></span>
                                </div>
                                <div class="lb-panel-right pull-left col-md-11 col-xs-10" style="text-align: left">
                                    <input type="password" style="margin-left: -15px" id="regPwd" name="regPwd" class="form-control" placeholder="密码" />
                                </div>
                            </div>
                        </div>


                        <div class="col-xs-12  form-group" style="height: 80px; margin: 0px auto">
                            <div class="panel panel-primary text-center" style="border: none">
                                <div class="lb-panel-left pull-left" style="width: 39px; height: 40px">
                                    <span class="input-group-addon" style="height: 40px"><span class="fa fa-key"></span></span>
                                </div>
                                <div class="lb-panel-right pull-left col-md-11 col-xs-10" style="text-align: left">
                                    <input type="password" style="margin-left: -15px" id="regRepPwd" name="regRepPwd" class="form-control" placeholder="确认密码" />
                                </div>
                            </div>
                        </div>
                        <div class="col-xs-12  form-group" style="height: 80px; margin: 0px auto">
                            <div class="panel panel-primary text-center" style="border: none">
                                <div class="lb-panel-left pull-left" style="width: 39px; height: 40px">
                                    <span class="input-group-addon" style="height: 40px"><span class="glyphicon glyphicon-user"></span></span>
                                </div>
                                <div class="lb-panel-right pull-left col-md-11 col-xs-10" style="text-align: left">
                                    <input type="text" style="margin-left: -15px" id="userName" name="userName" class="form-control" placeholder="姓名" />
                                </div>
                            </div>
                        </div>


                        <div class="col-xs-12  form-group" style="height: 80px; margin: 0px auto">
                            <div class="panel panel-primary text-center" style="border: none">
                                <div class="lb-panel-left pull-left" style="width: 39px; height: 40px">
                                    <span class="input-group-addon" style="height: 40px"><span class="glyphicon glyphicon-user"></span></span>
                                </div>
                                <div class="lb-panel-right pull-left col-md-11 col-xs-10" style="text-align: left">
                                    <select style="margin-left: -15px" id="gender" name="gender" class="form-control">
                                        <option selected="selected">请选择性别</option>
                                        <option>男</option>
                                        <option>女</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="col-xs-12 form-group" style="height: 80px; margin: 0px auto">
                            <div class="panel panel-primary text-center" style="border: none">
                                <div class="lb-panel-left pull-left" style="width: 39px; height: 40px">
                                    <span class="input-group-addon" style="height: 40px"><span class="glyphicon glyphicon-calendar"></span></span>
                                </div>
                                <div class="lb-panel-right pull-left col-md-11 col-xs-10" style="text-align: left">
                                    <input style="margin-left: -15px" type="text" id="bornDate" name="bornDate" class="form-control" placeholder="出生日期" />
                                </div>
                            </div>
                        </div>

                        <div class="col-xs-12 form-group" style="height: 80px; margin: 0px auto">
                            <div class="panel panel-primary text-center" style="border: none">

                                <div class="lb-panel-left pull-left" style="width: 39px; height: 40px">
                                    <span class="input-group-addon" style="height: 40px"><span class="fa fa-users"></span></span>
                                </div>
                                <div class="lb-panel-right pull-left col-md-11 col-xs-10">
                                    <input placeholder="所属部门" name="department" id="department" />

                                </div>
                            </div>
                        </div>

                        <div class="col-xs-12  form-group" style="height: 80px; margin: 0px auto">
                            <div class="panel panel-primary text-center" style="border: none">
                                <div class="lb-panel-left pull-left" style="width: 39px; height: 40px">
                                    <span class="input-group-addon" style="height: 40px"><span class="fa fa-envelope"></span></span>
                                </div>
                                <div class="lb-panel-right pull-left col-md-11 col-xs-10">
                                    <input style="margin-left: -15px" id="email" name="email" class="form-control" placeholder="邮箱" />
                                </div>
                            </div>
                        </div>


                        <div class="col-xs-12 " style="margin: 0px auto">
                            <div class="input-group">
                                <span class="input-group-addon">验证码</span>
                                <span id="imgcontainer" class="col-xs-5"></span>
                                <span class="col-xs-5" style="padding-top: 10px; padding-left: 10px"><a href="javascript:void(0)" onclick="ChangeVerifyCode()"><small>看不清，换一张</small></a></span>
                            </div>
                        </div>

                        <div class="col-xs-12  form-group" style="height: 80px; margin: 0px auto">
                            <div class="panel panel-primary text-center" style="border: none">
                                <div class="lb-panel-left pull-left" style="width: 100px; height: 40px">
                                    <span class="input-group-addon" style="width: 100px; height: 40px">请输入验证码</span>

                                </div>
                                <div class="lb-panel-right pull-left col-md-9 col-xs-8">
                                    <input name="verifyCode" style="margin-left: -15px" class="form-control" placeholder="请输入验证码" />
                                </div>
                            </div>
                        </div>
                        <div class="form-group form-actions">
                            <div class="col-xs-4 col-xs-offset-4">
                                <button type="submit" class="btn btn-sm btn-info">注册</button>
                            </div>
                        </div>

                        <div class="col-xs-6 link">
                            <p class="text-center remove-margin">
                                <small>忘记密码？</small> <a href="javascript:void(0)"><small>找回</small></a>
                            </p>
                        </div>
                        <div class="col-xs-6 link">
                            <p class="text-center remove-margin">
                                <small>已有账号?</small> <a href="javascript:void(0)" onclick="ShowLoginPage()"><small>登录</small></a>
                            </p>
                        </div>

                    </form>
                </div>
            </div>
        </div>
    </div>
    <!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
				</button>
				<h4 class="modal-title" id="myModalLabel">
					模态框（Modal）标题
				</h4>
			</div>
			<div class="modal-body">
				
                          <label class="col-sm-2 control-label" for="ds_username">序列号</label>
                          <div class="col-sm-10">
                             <input class="form-control" id="xlhname" type="text" placeholder="请输入序列号"/>
                          </div>
                          <label class="col-sm-2 control-label" for="ds_password">密码</label>
                          <div class="col-sm-10">
                             <input class="form-control" id="password" type="password" placeholder="请输入密码"/>
                          </div>
                  
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭
				</button>
				<button type="button" class="btn btn-primary" onclick="YZXLH()">
					提交更改
				</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
    </div>
</body>

</html>
<script src="../../JS/jquery-1.10.2.js"></script>
<script src="../../JS/bootstrap.min.js"></script>
<script type="text/javascript" src="../../JS/bootstrapValidator.min.js"></script>
<link href="../../CSS/bootstrap-datepicker.css" rel="stylesheet" />
<script type="text/javascript" src="../../JS/bootstrap-datepicker.js"></script>
<script type="text/javascript" src="../../JS/layer.js"></script>
<script src="../../JS/ligerComboBox/ligerTree.js"></script>
<script src="../../JS/ligerComboBox/ligerComboBox.js"></script>
<script type="text/javascript">

    
    function nulls() {
        $("#regName").val("");
        $("#regPwd").val("");
    }

    function texttm() {
        if ($("#loginName").val() == "") {
            $("#loginPwd").val("");
            $("#loginPwd").removeClass("")
        }

    }


    var lock = false;
    if (/AppleWebKit.*Mobile/i.test(navigator.userAgent) || (/MIDP|SymbianOS|NOKIA|SAMSUNG|LG|NEC|TCL|Alcatel|BIRD|DBTEL|Dopod|PHILIPS|HAIER|LENOVO|MOT-|Nokia|SonyEricsson|SIE-|Amoi|ZTE/.test(navigator.userAgent))) {

        if (window.location.href.indexOf("?mobile") < 0) {

            try {

                if (/Android|webOS|iPhone|iPod|BlackBerry/i.test(navigator.userAgent)) {

                    // 判断访问环境是 Android|webOS|iPhone|iPod|BlackBerry 则加载以下样式 

                    setActiveStyleSheet("../../CSS/mobile.css");

                }

                else if (/iPad/i.test(navigator.userAgent)) {

                    // 判断访问环境是 iPad 则加载以下样式 

                    setActiveStyleSheet("../../CSS/pc.css");

                }

                else {

                    // 判断访问环境是 其他移动设备 则加载以下样式 

                    setActiveStyleSheet("../../CSS/pc.css");

                }

            }

            catch (e) { }

        }

    }

    else {

        // 如果以上都不是，则加载以下样式 

        setActiveStyleSheet("../../CSS/pc.css");

    }

    
    function setActiveStyleSheet(filename) {
        var html = "<link href='" + filename + "' rel='stylesheet'>";
        $("head").append(html);
    }
    //GetCookieValue();
    function GetCookieValue() {
        $.ajax({
            url: "Ajax/LoginAndRegister.ashx?operationType=GetCookie",
            dataType: "json",
            success: function (data) {
                if (data != undefined) {
                    $("#loginName").val(data["loginNameCookie"]);
                    $("#loginPwd").val(data["loginPwdCookie"]);
                    $("#rememberPwd")[0].checked = true;
                }
            }
        })
    }

    function ShowRegisterPage() {
        $(".register-box").show();
        $(".box").css("height", "1150px");
        $(".login-box").hide();
        nulls();
    }

    function ShowLoginPage() {
        $(".register-box").hide();
        $(".box").css("height", "100%");

        $(".login-box").show();
    }
    $('#loginForm').bootstrapValidator({
        message: '表单验证失败.',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            loginName: {
                message: '用户名验证失败',
                validators: {
                    notEmpty: {
                        message: '用户名不能为空'
                    },
                    stringLength: {
                        min: 2,
                        max: 20,
                        message: '用户名长度必须介于2到20之间'
                    },// regexp: {
                    //    regexp: /^[a-zA-Z0-9_]+$/,
                    //    message: '用户名只能包含大写、小写、数字和下划线'
                    //},
                    //threshold: 2,
                    //remote: {
                    //    url: "Ajax/LoginAndRegister.ashx?operationType=LoginUserIsExistsUser",
                    //    message: '用户名不存在',
                    //    delay: 2000,
                    //    type: "GET",
                    //},
                        //callback: {
                        //    message: '请选择所属部门',
                        //    callback: function (value, validator) {
                        //        //   $("#NumStart")
                        //        return value != "无" && value != "" && value != null;
                        //    }
                        //}
                    

                }
            }, loginPwd: {
                message: '密码格式不正确',
                validators: {
                    notEmpty: {
                        message: '用户密码不能为空.'
                    },
                    stringLength: {
                        min: 6,
                        max: 20,
                        message: '长度只能在6—20个字符之间！'
                    },
                }

            }
        }
    }).on('success.form.bv', function (e) {
        e.preventDefault();

        $.ajax({
            url: "Ajax/LoginAndRegister.ashx?operationType=logins",
            type: "GET",
            data: { loginName: $("#loginName").val(), pwd: $("#loginPwd").val(), rememberPwd: $("#rememberPwd")[0].checked },
            dataType: "text",
            success: function (data) {
                if (data == 1) {
                    window.location.href = "/Index.aspx";
                    //            layer.alert('登录成功!', {
                    //                skin: 'layui-layer-lan', //样式类名
                    //                closeBtn: 0
                    //            }, function () {

                    //            }
                    //);
                } else if (data == 3) {
                    layer.confirm('序列号没有激活是否要激活？', {
                        btn: ['确定', '取消'] //按钮
                    }, function () {
                        $("#myModal").modal('show');
                        layer.closeAll("dialog");
                    });

                    //弹框
                } else if (data == 5) {
                    layer.alert("该企业账号已停用");
                    return;

                    //弹框
                }
                else {
                    layer.alert('登录失败,用户名或密码错误', {
                        skin: 'layui-layer-lan', //样式类名
                        closeBtn: 0
                    });
                }
            }
        })

    })

    $('#registerForm').bootstrapValidator({
        message: '表单验证失败.',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            loginName: {
                message: '用户名验证失败',
                verbose: false,
                validators: {
                    notEmpty: {
                        message: '用户名不能为空'
                    },
                    stringLength: {
                        min: 2,
                        max: 20,
                        message: '用户名长度必须介于2到20之间'
                    },// regexp: {
                    //    regexp: /^[a-zA-Z0-9_]+$/,
                    //    message: '用户名只能包含大写、小写、数字和下划线'
                    //},
                    //激活功能暂时屏蔽
                    //callback: {
                    //    message: '用户名已注册，但未激活，请点此<a onclick="ActivateUser()">激活</a>',
                    //    callback: function (value, validator) {
                    //        var isActivate;
                    //        $.ajax({
                    //            url: "Ajax/LoginAndRegister.ashx?operationType=CheckUserIsActivate",
                    //            type: "GET",
                    //            data: { loginName: value },
                    //            dataType: "text",
                    //            async: false,
                    //            success: function (data) {
                    //                isActivate = data;
                    //            }
                    //        })
                    //        alert(isActivate);
                    //        return isActivate=="True";
                    //    }
                    //},
                    threshold: 3,
                    remote: {
                        url: "Ajax/LoginAndRegister.ashx?operationType=IsExistsUser",
                        message: '用户名已存在',
                        delay: 2000,
                        type: "GET",

                    },
                    regexp: {
                        regexp: /^(?!.*?[\~\`\·\！\!@\#\￥\$%\……\^&\*\(\)\（\）\_\-\——\+\=\【\】\[\]\{\}\|\、\\\：\:\;\；\"\”\“\’\'\'\<\>\《\》\,\，\。\.\?\？\/]).*$/,
                        message: '角色名不能包含特殊字符。'
                    }

                }
            }, regPwd: {
                message: '密码格式不正确',
                validators: {
                    notEmpty: {
                        message: '用户密码不能为空.'
                    },
                    stringLength: {
                        min: 6,
                        max: 30,
                        message: '用户名密码不能小于6位，且不能大于30位'
                    },
                    different: {//不能和用户名相同
                        field: 'loginName',//需要进行比较的input name值
                        message: '不能和用户名相同'
                    },
                }

            }, regRepPwd: {
                message: '输入第二次密码格式不正确',
                validators: {
                    notEmpty: {
                        message: '用户密码不能为空.'
                    },
                    stringLength: {
                        min: 6,
                        max: 30,
                        message: '用户名密码不能小于6位，且不能大于30位'
                    },
                    identical: {//相同
                        field: 'regPwd', //需要进行比较的input name值
                        message: '两次密码不一致'
                    },
                    different: {//不能和用户名相同
                        field: 'loginName',//需要进行比较的input name值
                        message: '不能和用户名相同'
                    },
                }
            },
            userName: {
                message: '姓名输入有误',
                validators: {
                    notEmpty: {
                        message: '用户姓名不能为空.'
                    },
                    stringLength: {
                        min: 4,
                        max: 20,
                        message: '用户名姓名不能小于4位，且不能大于20位'
                    },
                    regexp: {
                        regexp: /^(?!.*?[\~\`\·\！\!@\#\￥\$%\……\^&\*\(\)\（\）\_\-\——\+\=\【\】\[\]\{\}\|\、\\\：\:\;\；\"\”\“\’\'\'\<\>\《\》\,\，\。\.\?\？\/]).*$/,
                        message: '角色名不能包含特殊字符。'
                    }
                }
            }, gender: {
                validators: {
                    callback: {
                        message: '请选择性别',
                        callback: function (value, validator) {
                            // Determine the numbers which are generated in captchaOperation

                            return value != "请选择性别";
                        }
                    }
                }
            }, bornDate: {
                message: '出生日期有误',
                validators: {
                    notEmpty: {
                        message: '出生日期不能为空.'
                    }
                }
            },
            department: {
                group: '.group',
                validators: {
                    notEmpty: {
                        message: '请将必填项填写完整！'
                    },
                    callback: {
                        message: '所属部门',
                        callback: function (value, validator) {

                            return value != "所属部门" && value != "" && value != "无";
                        }
                    }
                }
            }, email: {
                validators: {
                    notEmpty: {
                        message: '邮箱不能为空'
                    },
                    regexp: {
                        regexp: /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/,
                        message: '邮箱格式不正确，请输入正确的邮箱格式如123@.com'
                    }
                }
            }, verifyCode: {
                message: '验证码验证失败',
                validators: {
                    notEmpty: {
                        message: '验证码不能为空'
                    },
                    remote: {
                        url: "Ajax/LoginAndRegister.ashx?operationType=VerifyCode",
                        message: '验证码输入错误',
                        type: "GET",

                    }

                }
            }

        }

    }).on('success.form.bv', function (e) {
        e.preventDefault();

        if (!lock) {
            $.ajax({
                url: "Ajax/LoginAndRegister.ashx?operationType=Register",
                data: {
                    loginName: $("#regName").val(),
                    regPwd: $("#regPwd").val(),
                    userName: $("#userName").val(),
                    gender: $("#gender").find("option:selected").text(),
                    bornDate: $("#bornDate").val(),
                    department: $("#department").attr("data-id"),
                    email: $("#email").val(),
                    phone: $("#phone").val()
                },
                type: "Get",
                async: false,
                dataType: "text",
                success: function (data) {
                    lock = true;
                    if (data) {
                        layer.msg("提交成功，请耐心等待通知！！", { time: 2000, icon: 6 }, function () {
                            window.location = "LoginAndRegister.aspx"
                        }), function () {
                            ShowLoginPage();
                            layer.closeAll("dialog");
                        }

                    } else {
                        layer.alert('注册失败!', {
                            skin: 'layui-layer-lan', //样式类名
                            closeBtn: 0
                        }, function () {

                        }
            );
                    }
                }
            })
        }

    })


    function GetNowTime() {
        var nowtime = new Date();
        var year = nowtime.getFullYear();
        var month = (nowtime.getMonth() + 1);
        var day = (nowtime.getDate());
        return year + "-" + month + "-" + day;
    }
    //$('#bornDate').datepicker({ format: 'yyyy-mm-dd', weekStart: 1, autoclose: true, todayBtn: 'linked', language: 'cn' });

    //$('#bornDate').datepicker('setEndDate', GetNowTime());

    //CreateVerifyCode();
    function CreateVerifyCode() {
        var url = "Ajax/LoginAndRegister.ashx?operationType=GetVerifyCode";
        var xhr = new XMLHttpRequest();
        xhr.open("get", url, true);
        xhr.responseType = "blob";
        xhr.onload = function () {
            if (this.status == 200) {
                var blob = this.response;
                var img = document.createElement("img");
                img.onload = function (e) {
                    window.URL.revokeObjectURL(img.src);
                };
                img.src = window.URL.createObjectURL(blob);
                $("#imgcontainer").html(img);

            }
        }; xhr.send();
    }
    function ChangeVerifyCode() {
        CreateVerifyCode();
    }
    //OnLoadTreeComs();
    //function OnLoadTreeComs() {
    //    $("#department").ligerComboBox({
    //        width: 150,
    //        selectBoxWidth: 150,
    //        selectBoxHeight: 150,
    //        valueField: 'id',
    //        textField: 'text',
    //        treeLeafOnly: false,
    //        tree: {
    //            onSuccess: function () {
    //                setTimeout(function () {
    //                    var manager = $(".l-tree").ligerGetTreeManager();
    //                }, 100);
    //            },
    //            onBeforeSelect: function (node) {
    //                $("#department").attr("data-id", node.data['id']);
    //            },
    //            url: '/FunctionModular/BasicSetting/Ajax/DepartmentMain.ashx?Remark=OnLoadDep&rnd=' + Math.random(),
    //            usericon: 'd_icon',
    //            idFieldName: 'id',
    //            checkbox: false
    //        }
    //    });
    //}

    //日期格式加bootsop验证
    $("#bornDate").datepicker({
        language: "zh-CN",
        format: "yyyy-dd-mm",
        autoclose: true,
        todayHighlight: true,
        language: 'cn',
        format: "yyyy-mm-dd",//日期格式
        endDate: new Date()

    }).on('hide', function (e) {
        $('#registerForm').data('bootstrapValidator')
            .updateStatus('bornDate', 'NOT_VALIDATED', null)
            .validateField('bornDate');
    });
    //测试用的
    function Tests()
    {

        $.ajax({
            url: "Ajax/LoginAndRegister.ashx?operationType=logins",
            type: "GET",
            async :false,
            data: { loginName: $("#loginName").val(), pwd: $("#loginPwd").val(), rememberPwd: $("#rememberPwd")[0].checked },
            dataType: "text",
            success: function (data) {
                alert(data);
                if (data == 1) {
                    window.location.href = "/Index.aspx";
                    //            layer.alert('登录成功!', {
                    //                skin: 'layui-layer-lan', //样式类名
                    //                closeBtn: 0
                    //            }, function () {

                    //            }
                    //);
                } else if (data == 3)
                {
                    alert("ss")
                    YZXL0H()
                  
                   //弹框
                }
                else {
                    layer.alert('登录失败,用户名或密码错误', {
                        skin: 'layui-layer-lan', //样式类名
                        closeBtn: 0
                    });
                }
            }
        })

    }
    function YZXLH() {

        $.ajax({
            url: "Ajax/LoginAndRegister.ashx?operationType=YZXLH",
            type: "GET",
            data: { xlhname: $("#xlhname").val(),password: $("#password").val()},
            dataType: "text",
            success: function (data) {
                alert(data);
                if (data == 1) {
                    window.location.href = "/Index.aspx";
                  
                } else if (data == 2)
                {
                    layer.alert('序列号不正确', {
                        skin: 'layui-layer-lan', //样式类名
                        closeBtn: 0
                    });
                } else if (data == 3)
                {
                    layer.alert('还没有激活', {
                        skin: 'layui-layer-lan', //样式类名
                        closeBtn: 0
                    });
                }
                else {
                    layer.alert('激活失败！', {
                        skin: 'layui-layer-lan', //样式类名
                        closeBtn: 0
                    });
                }
            }
        })

    }
    function YZXL0H() {
        $("#myModal").modal('show');
    }
</script>
