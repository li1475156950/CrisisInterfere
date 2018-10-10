<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="PersonalInfo.aspx.cs" Inherits="CrisisInterfere.FunctionModular.PersonalInfo.PersonalInfo1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPages" runat="server">
    <link rel="shortcut icon" id="icons" href="" />
    <link href="../../assets/skin/layer.css" rel="stylesheet" />
    <link href="../../JS/UEditor/third-party/webuploader/webuploader.css" rel="stylesheet" />
    <script src="../../JS/UEditor/third-party/webuploader/webuploader.js"></script>
    <div class="content">
        <!-- main -->
        <div class="x_myself">
            <form id="userInfo" class="">
                <div class="row">
                    <div class="col-md-12">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="zhuse tc">基本信息</h3>
                            </div>

                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-md-9 col-ms-12 col-xs-12">
                                        <div>
                                            <div class="col-md-5 col-xs-12">
                                                <div class="lb-panel-left pull-left text-right" style="background-color: white">
                                                    登录名：
                                                </div>

                                                <div class="lb-panel-right pull-right">
                                                    <input type="text" name="loginName" readonly="readonly" class="form-control" />
                                                </div>
                                            </div>
                                        </div>
                                        <div>
                                            <div class=" col-md-5 col-xs-12">
                                                <div class="lb-panel-left pull-left text-right" style="background-color: white">
                                                    姓名：
                                                </div>

                                                <div class="form-group lb-panel-right pull-right">
                                                    <input type="text" name="userName" class="form-control" maxlength="10"/>
                                                </div>
                                            </div>
                                            <div class=" col-md-5 col-xs-12">
                                                <div class="lb-panel-left pull-left text-right" style="background-color: white">
                                                    性别：
                                                </div>

                                                <div class="form-group lb-panel-right pull-right">
                                                    <select name="gender" class="form-control">
                                                        <option selected="selected">男</option>
                                                        <option>女</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div>
                                            <div class="col-md-5 col-xs-12">
                                                <div class="lb-panel-left pull-left text-right" style="background-color: white;">
                                                    出生日期：
                                                </div>
                                                <div class="group">
                                                    <div class="lb-panel-right pull-right" style="background-color: white">
                                                        <div class="form-group input-group" style="width: 100%">
                                                            <input type="text" id="bornDate" name="Birthday" oninput="JundgeDate()" class="form-control" placeholder="选择出生日期" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class=" col-md-5 col-xs-12">
                                                <div class="lb-panel-left pull-left text-right" style="background-color: white">
                                                    手机号码：
                                                </div>
                                                <div class="form-group lb-panel-right pull-right">
                                                    <input type="text" name="phone" class="form-control" />
                                                </div>
                                            </div>
                                            <div class=" col-md-5 col-xs-12">
                                                <div class="lb-panel-left pull-left text-right" style="background-color: white">
                                                    电子邮箱：
                                                </div>

                                                <div class="form-group lb-panel-right pull-right">
                                                    <input type="text" name="email" class="form-control" />
                                                </div>
                                            </div>
                                            <div class="col-md-5 col-xs-12">
                                                <div class="lb-panel-left pull-left text-right" style="background-color: white">
                                                    所属部门：
                                                </div>
                                                <div class="lb-panel-right pull-right">
                                                    <input type="text" name="department" class="form-control" readonly="readonly" />
                                                </div>
                                            </div>
                                        </div>
                                        <div>
                                            <div class="col-md-5 col-xs-12">
                                                <div class="lb-panel-left pull-left text-right" style="background-color: white">
                                                    修改密码：
                                                </div>
                                                <div class="lb-panel-right pull-right" style="background-color: white">
                                                    <input type="password" name="password" class="form-control" value="●●●●●●" readonly="readonly"></input>
                                                </div>
                                            </div>
                                            <button type="button" class="btn btn-primary btn-sm" data-toggle='modal' data-target="#alterPwd" onclick="alterPwd()"
                                                style="float:left;">修改</button>
                                        </div>
                                    </div>
                                    <div class="col-md-3 col-ms-12 col-xs-12">
                                        <div class="col-md-12" style="text-align: center;">
                                            <div>
                                                <img style="width: 100px; height: 100px;" data-name="userPic" src="../../Img/male.jpg" />
                                            </div>
                                            <div id="uploader" class="wu-example">
                                                <div id="thelist" class="uploader-list">
                                                </div>
                                                <div style="margin-top: 10px;">
                                                    <div id="picker" style="padding-bottom: 15px;" class="btn btn-primary btn-sm">选择头像</div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="x_top_box x_top_box1">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="zhuse tc">拓展信息</h3>
                            </div>
                            <style type="text/css">
                                .x_top_box1 {
                                    margin-top: 30px !important;
                                }

                                .x_top_box .x_top1 {
                                    width: 80%;
                                    margin: 0 auto;
                                }
                            </style>
                            <div class="x_top x_top1" style="margin-top: 10px; margin-left: 200px;">
                                <div class="row" style="margin-left:-500px">
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">家庭住址：</label>
                                        <div class="col-sm-6">
                                            <textarea class="form-control" rows="2" maxlength="50" style="padding-right: 12px;" name="address" onkeyup="return txtNameCheck(this,50)" onblur="return txtNameCheck(this,50)"></textarea>
                                        </div>
                                    </div>
                                </div>
                                <div class="row" style="margin-top: 10px;margin-left:-500px">
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">个人简介：</label>
                                        <div class="col-sm-6">
                                            <textarea class="form-control" rows="3" maxlength="500" style="padding-right: 12px;" name="guide" onkeyup="return txtNameCheck(this,500)" onblur="return txtNameCheck(this,500)"></textarea>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>


                    </div>
                </div>
                <div class="panel-heading">
                    <div class="row" style="margin-top: 30px; margin-bottom: 50px; margin-left: 50px;">
                        <div class="col-sm-5  col-xs-6 text-right">
                            <button class="btn btn-primary btn-sm" id="submit" type="submit" style="background-color: white;">保存</button>&nbsp;&nbsp;&nbsp;
                        </div>
                        <div class="col-sm-2  col-xs-3  text-right">
                            <button type="button" class=" btn btn-primary btn-sm" data-dismiss="modal" onclick="Cancel()">取消</button>
                        </div>
                    </div>
                </div>

            </form>
        </div>
    </div>
    <div class="modal fade" id="alterPwd" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content" style="margin-top: 25%; width: 100%">
                <div class="modal-header text-center" style="color: rgb(68, 117, 235)">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true" onclick="empty()">
                        ×
                    </button>
                    <h4 class="modal-title" style="color: #4CB1CF; margin-top: 30px; font-size: 25px; font-weight: 700" id="myModalLabel">修改密码
                    </h4>
                </div>
                <form id="alterPwdForm">
                    <div class="modal-body">

                        <div class="row">
                            <div class="col-xs-12">
                                <div class="panel panel-default text-center bg-color-blue col-md-9 col-xs-12 col-xs-offset-1" style="border: none">
                                    <div class="lb-panel-left pull-left blue" style="background-color: white; color: #808080">
                                        *当前密码:
                                    </div>
                                    <div class="form-group lb-panel-right pull-right">

                                        <input name="currentPwd" id="currentPwd" maxlength="20" type="password" class="form-control" />
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <div class="panel panel-default text-center bg-color-blue col-md-9 col-xs-12 col-xs-offset-1" style="border: none">
                                    <div class="lb-panel-left pull-left blue" style="background-color: white; color: #808080">
                                        *新密码:
                                    </div>
                                    <div class=" form-group lb-panel-right pull-right">

                                        <input name="newPwd" id="newPwd" type="password" maxlength="20" class="form-control" onkeyup="newPws()" onchange="newPws()" />
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <div class="panel panel-default text-center bg-color-blue col-md-9 col-xs-12 col-xs-offset-1" style="border: none">
                                    <div class="lb-panel-left pull-left blue" style="background-color: white; color: #808080">
                                        *确认新密码:
                                    </div>
                                    <div class="form-group  lb-panel-right pull-right">

                                        <input name="confirmNewPwd" id="confirmNewPwd" type="password" maxlength="20" class="form-control" />
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="modal-footer text-center">
                        <button type="submit" id="savePwd" onclick="disableds()" style="background-color: white;" class="btn btn-primary btn-sm">
                            保存
                        </button>
                        <button onclick="empty()" type="button" style="color: white" class="btn btn-primary btn-sm"
                            data-dismiss="modal">
                            取消
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- JS Scripts-->
    <!-- 左侧下拉框 Js -->
    
   <%--<script src="../../JS/webuploader.min.js"></script>--%>
    <script src="../../JS/layer.js"></script>
    <script src="../../JS/bootstrap-datepicker.js"></script>
    <script src="../../JS/bootstrapValidator.min.js"></script>
    <link href="../../CSS/bootstrap-datepicker.css" rel="stylesheet" />
    <script type="text/javascript">

        var navName = '/FunctionModular/PersonalInfo/PersonalInfo.aspx';

        var GetFuntionType = 0;
        var RoleTypes = 0;
        function desem() {
            $('#submit').removeAttr("disabled")  //部门解禁 禁用
        }
        //检查新密码和确认面是否一致
        function newPws() {
            $('#alterPwdForm').data('bootstrapValidator')
                .updateStatus('confirmNewPwd', 'identical', null)
                .validateField('confirmNewPwd');
        }
        //显示修改密码的弹框
        function alterPwd() {
            document.getElementById("alterPwdForm").reset();
            $('i[data-bv-icon-for=currentPwd]').css({ "display": "none" });
            $('small[data-bv-for=currentPwd]').css({ "display": "none" });
            $('#currentPwd').css("border-color", "#ccc");
            $('i[data-bv-icon-for=newPwd]').css({ "display": "none" });
            $('small[data-bv-for=newPwd]').css({ "display": "none" });
            $('#newPwd').css("border-color", "#ccc");
            $('i[data-bv-icon-for=confirmNewPwd]').css({ "display": "none" });
            $('small[data-bv-for=confirmNewPwd]').css({ "display": "none" });
            $('#confirmNewPwd').css("border-color", "#ccc");
            $("#savePwd").attr('disabled', true);

        }
        //判断名称格式与长度
        function txtNameCheck(data, length) {
            var obj = data.getAttribute('name');
            var txt = $("[name=" + obj + "]").val();
            $("i[data-bv-icon-for=" + obj + "]").css({ "top": "5px", "right": "10px" });
            var le = parseInt(length);
            if (txt.length > le) {
                var a = $(this).find("[data-bv-for=" + obj + "]");
                txt = txt.substring(0, le);
                $("[name=" + obj + "]").val(txt);
                $("small[data-bv-for=" + obj + "]").text('');
                $("[name=" + obj + "]").css("border-color", "#2b542c");
                $('[data-bv-icon-for=' + obj + ']i').css('display', 'none');
            }
        }
        function txtNameChecks(data, length) {
            var obj = data
            var txt = $("[name=" + obj + "]").val();
            $("i[data-bv-icon-for=" + obj + "]").css({ "top": "5px", "right": "10px" });
            var le = parseInt(length);
            if (txt.length > le) {
                var a = $(this).find("[data-bv-for=" + obj + "]");
                txt = txt.substring(0, le);
                $("[name=" + obj + "]").val(txt);
                $("small[data-bv-for=" + obj + "]").text('');
                $("[name=" + obj + "]").css("border-color", "#2b542c");
                $('[data-bv-icon-for=' + obj + ']i').css('display', 'none');
            }
        }
        /*----------文件上传----------*/
        $("#fileUpload").change(function () {

            $("#fileText").val($(this).val());
        });
        function empty() {
            $("input[name=currentPwd]").val("")
            $("input[name=newPwd]").val("")
            $("input[name=confirmNewPwd]").val("")
            $(".help-block").hide();
            //$("#alterPwd").data('bootstrapValidator').resetForm();
            $("div.form-group").removeClass(" has-success has-error");
            $('#alterPwd').data('bootstrapValidator').validateField('currentPwd');
            $('#alterPwd').data('bootstrapValidator').validateField('newPwd');
            $('#alterPwd').data('bootstrapValidator').validateField('confirmNewPwd');

            $('#alterPwd').data('bootstrapValidator')
          .updateStatus('currentPwd', 'NOT_VALIDATED', null)
          .validateField('currentPwd');
            $('#alterPwd').data('bootstrapValidator')
          .updateStatus('newPwd', 'NOT_VALIDATED', null)
          .validateField('newPwd');
            $('#alterPwd').data('bootstrapValidator')
        .updateStatus('confirmNewPwd', 'NOT_VALIDATED', null)
        .validateField('confirmNewPwd');

        }
        LoadUserInfo();
        initSelectInput("funList", "拥有权限");
        $('#userInfo').bootstrapValidator({
            message: '表单验证失败.',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                userName: {
                    message: '姓名验证失败',
                    validators: {
                        notEmpty: {
                            message: '姓名不能为空'
                        },
                        stringLength: {
                            min: 2,
                            max: 10,
                            message: '姓名名长度必须介于2到10之间'
                        },
                        callback: {
                            message: '用户名格式不正确',
                            callback: function (value, validator) {
                                var reg = /^(?!.*?[\~\`\·\！\!@\#\￥\$%\……\^&\*\(\)\（\）\_\-\——\+\=\【\】\[\]\{\}\|\、\\\：\:\;\；\"\”\“\’\'\'\<\>\《\》\,\，\。\.\?\？\/]).*$/;
                                return reg.test(value);
                            }
                        }
                    }
                },
                Birthday: {
                    message: '出生日期有误',
                    validators: {
                        notEmpty: {
                            message: '请将必填项填写完整！'
                        }
                    },
                },
                gender: {
                    message: '性别验证失败',
                    validators: {
                        notEmpty: {
                            message: '性别不能为空'
                        }
                    }
                },
                stuID: {
                    message: '学号格式不正确',
                    validators: {

                        stringLength: {
                            max: 20,
                            message: '学号长度必须小于20位'
                        },
                        regexp: {
                            regexp: /^(\d)*$/,
                            message: "学号必须为纯数字，且长度不能大于20位"
                        }
                    }
                }, email: {
                    message: '邮箱格式不正确',
                    validators: {
                        notEmpty: {
                            message: '邮箱不能为空'
                        },
                        regexp: {
                            regexp: /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/,
                            message: "邮箱格式不正确"
                        }
                    }
                }, phone: {
                    message: '手机格式不正确',
                    validators: {
                        notEmpty: {
                            message: '手机不能为空'
                        },
                        regexp: {
                            regexp: /^1[0-9]{10}$/,
                            message: "手机格式不正确"
                        }
                    }
                }, parentsEmail: {
                    message: '邮箱格式不正确',
                    validators: {
                        notEmpty: {
                            message: '邮箱不能为空'
                        },
                        regexp: {
                            regexp: /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/,
                            message: "邮箱格式不正确"
                        }
                    }
                }, parentsPhone: {
                    message: '手机格式不正确',
                    validators: {
                        notEmpty: {
                            message: '手机不能为空'
                        },
                        regexp: {
                            regexp: /^1[0-9]{10}$/,
                            message: "手机格式不正确"
                        }
                    }
                },
                address: {
                    validators: {
                        stringLength: {
                            min: 1,
                            max: 50,
                            message: '家庭住址长度必须介于1到50之间'
                        }
                    }
                },
                guide: {
                    validators: {
                        stringLength: {
                            min: 1,
                            max: 500,
                            message: '个人简介长度必须介于1到500之间'
                        }
                    }
                }

            }
        }).on('success.form.bv', function (e) {
            e.preventDefault();

            $("#submit").attr({ "disabled": "disabled" });
            setInterval('desem()', 2000);


            /*获取用户自定义信息json串 */
            var fields = $("[data-name=field]");
            var value = $("[data-name=value]");
            var U_Consult = $("#U_Consult").val();
            var GoodField = $("#GoodField").val();

            var strJson = [];
            var strJsons = [];

            if (fields.length > 0) {
                for (var i = 0; i < fields.length; i++) {
                    if (i == fields.length - 1 && $(fields[i]).val() == "" && $(fields[i]).text() == "") {
                        layer.alert('请输入自定义信息!', {
                            skin: 'layui-layer-lan', //样式类名
                            closeBtn: 0
                        })
                        return;
                    }
                    var values = false;
                    if ($(value[i]).val() != "" && $(value[i]).val() != null) {
                        values = true;
                    }
                    if ($(fields[i]).val() == "" && $(fields[i]).text() != "") {
                        var field = $(fields[i]).text().replace(":", "");
                        var str = { 'Field': field, 'Value': $(value[i]).val() };
                        var strs = { 'Field': field, 'Value': values };
                    }
                    if ($(fields[i]).val() != "") {
                        var field = $(fields[i]).val().replace(":", "");
                        var str = { 'Field': field, 'Value': $(value[i]).val() };
                        var strs = { 'Field': field, 'Value': values };
                    }

                    strJson.push(str);
                    strJsons.push(strs);
                }
            }
            $.ajax({
                url: "Ajax/PersonalInfo.ashx?operationType=Update",
                type: "POST",
                async: false,
                data: {
                    strJson: JSON.stringify(strJson),
                    userName: $("[name=userName]").val(),
                    gender: $("[name=gender]").find("option:selected").text(),
                    bornDate: $("[name=bornDate]").val(),
                    stuID: $("[name=stuID]").val(),
                    email: $("[name=email]").val(),
                    phone: $("[name=phone]").val(),
                    memberDescribe: $("[name=memberDescribe]").val(),
                    parentsEmail: $("[name=parentsEmail]").val(),
                    parentsPhone: $("[name=parentsPhone]").val(),
                    address: $("[name=address]").val(),
                    guide: $("[name=guide]").val(),
                    bornDate: $("#bornDate").val(),
                    U_Consult: U_Consult,
                    GoodField: GoodField,
                    RFType: RoleTypes,
                    strJsons: JSON.stringify(strJsons),
                },
                dataType: "json",
                success: function (data) {
                    txtNameChecks('address', '500');
                    txtNameChecks('guide', '500');
                    if (data.State) {
                        layer.msg("保存成功！", { time: 2000, icon: 6 }, function () {
                            var usrarr = window.location.href;
                            var usr = usrarr.toString().split('/');

                            var ura = usr[0] + "/" + usr[1] + "/" + usr[2] + "/Index.aspx"

                            window.location.href = ura;

                        }
            );
                    }
                    else {
                        if (data.Error != undefined) {
                            layer.alert(data.Error, {
                                skin: 'layui-layer-lan', //样式类名
                                closeBtn: 0
                            }
            );
                        }
                        else {
                            layer.msg("保存失败！", { time: 2000, icon: 6 }, function () {
                            }, function () {
                                window.location.href = "PersonalInfo.aspx"
                            }
         );

                        }

                    }
                }
            })

        })
        alterPwdMain();
        function alterPwdMain() {
            $('#alterPwdForm').bootstrapValidator({
                message: '表单验证失败.',
                feedbackIcons: {
                    valid: 'glyphicon glyphicon-ok',
                    invalid: 'glyphicon glyphicon-remove',
                    validating: 'glyphicon glyphicon-refresh'
                },
                fields: {
                    currentPwd: {
                        message: '密码验证失败',
                        validators: {
                            notEmpty: {
                                message: '用户当前密码不能为空'
                            },
                            stringLength: {
                                min: 6,
                                max: 20,
                                message: '密码长度长度必须介于6到20之间'
                            },
                            threshold: 6,
                            remote: {
                                url: "Ajax/PersonalInfo.ashx?operationType=CheckCurrentPwd",
                                message: '输入当前密码不正确',
                                delay: 20000,
                                type: "GET",
                            }, different: {//不能和用户名相同
                                field: 'newPwd',//需要进行比较的input name值
                                message: '当前密码',
                            }

                        }
                    }, newPwd: {
                        validators: {
                            notEmpty: {
                                message: '新密码不能为空'
                            },
                            stringLength: {
                                min: 6,
                                max: 20,
                                message: '密码长度必须介于6到20之间'
                            },
                            different: {//不能和用户名相同
                                field: 'currentPwd',//需要进行比较的input name值
                                message: '新密码不能和当前密码相同',
                            }
                        }

                    }, confirmNewPwd: {
                        validators: {
                            notEmpty: {
                                message: '确认密码不能为空'
                            },
                            stringLength: {
                                min: 6,
                                max: 20,
                                message: '密码长度必须介于6到20之间'
                            },
                            identical: {//不能和用户名相同
                                field: 'newPwd',//需要进行比较的input name值
                                message: '确认新密码和新密码输入不一致',
                            }
                        }
                    }
                }
            }).on('success.form.bv', function (e) {
                e.preventDefault();
                $.ajax({
                    url: "Ajax/PersonalInfo.ashx?operationType=AlterPwd",
                    type: "GET",
                    data: {
                        newPwd: $("[name=newPwd]").val(),
                    },
                    dataType: "text",
                    success: function (data) {
                        if (data) {
                            layer.alert('修改成功!', {
                                skin: 'layui-layer-lan', //样式类名
                                closeBtn: 0
                            }, function () {
                                window.location.href = "/FunctionModular/PersonalInfo/PersonalInfo.aspx";
                            });
                        }

                        else {
                            layer.alert('修改失败!', {
                                skin: 'layui-layer-lan', //样式类名
                                closeBtn: 0
                            });
                        }


                    }
                })

            })
        }
        function GetNowTime() {
            var nowtime = new Date();
            var year = nowtime.getFullYear();
            var month = (nowtime.getMonth() + 1);
            var day = (nowtime.getDate());
            return year + "-" + month + "-" + day;
        }
        //$('#bornDate').datepicker({ format: 'yyyy-mm-dd', weekStart: 1, autoclose: true, todayBtn: 'linked', language: 'cn' });

        //$('#bornDate').datepicker('setEndDate', GetNowTime());
        // 文件上传
        jQuery(function () {
            var $ = jQuery,
                $list = $('#thelist'),
                $btn = $('#ctlBtn'),
                state = 'pending',
                uploader;

            uploader = WebUploader.create({
                // 不压缩image
                resize: false,
                auto: true,
                duplicate: true,
                // swf文件路径
                swf: '../../JS/swf/Uploader.swf',
                // 文件接收服务端。
                server: 'Ajax/personalInfo.ashx?operationType=SaveFile',

                // 选择文件的按钮。可选。
                // 内部根据当前运行是创建，可能是input元素，也可能是flash.
                pick: {
                    id: '#picker',
                    multiple: false
                },
                fileSingleSizeLimit: 8388608,
                accept: {
                    title: 'Images',
                    extensions: 'gif,jpg,jpeg,bmp,png',
                    mimeTypes: 'image'
                }
            });
            uploader.on("error", function (type) {
                if (type == "Q_TYPE_DENIED") {
                    layer.alert('请上传JPG、PNG格式文件', {
                        skin: 'layui-layer-lan', //样式类名
                        closeBtn: 0
                    })
                } else if (type == "F_EXCEED_SIZE") {
                    layer.alert('文件大小不能超过8M', {
                        skin: 'layui-layer-lan', //样式类名
                        closeBtn: 0
                    });
                }
            });


            // 当有文件添加进来的时候
            //uploader.on('fileQueued', function (file) {
            //    $list.append('<div id="' + file.id + '" class="item">' +
            //        '<h4 class="info">' + file.name + '</h4>' +
            //        '<p class="state">等待上传...</p>' +
            //    '</div>');
            //});

            // 文件上传过程中创建进度条实时显示。
            uploader.on('uploadProgress', function (file, percentage) {
                var $li = $('#' + file.id),
                    $percent = $li.find('.progress .progress-bar');
                // 避免重复创建
                if (!$percent.length) {
                    $percent = $('<div class="progress progress-striped active">' +
                      '<div class="progress-bar" role="progressbar" style="width: 0%">' +
                      '</div>' +
                    '</div>').appendTo($li).find('.progress-bar');
                }

                $li.find('p.state').text('上传中');

                $percent.css('width', percentage * 100 + '%');
            });

            uploader.on('uploadSuccess', function (file) {

                $('#' + file.id).find('p.state').text('已上传');
                LoadUserPic();
                textremo(file.id);
                layer.msg("上传成功!", { icon: 6, time: 2000 })
            });

            uploader.on('uploadError', function (file) {
                $('#' + file.id).find('p.state').text('上传出错');


            });

            uploader.on('uploadComplete', function (file) {
                $('#' + file.id).find('.progress').fadeOut();
                //textremo();
            });

            uploader.on('all', function (type) {
                if (type === 'startUpload') {
                    state = 'uploading';
                } else if (type === 'stopUpload') {
                    state = 'paused';
                } else if (type === 'uploadFinished') {
                    state = 'done';
                }

                if (state === 'uploading') {
                    $btn.text('暂停上传');
                } else {
                    $btn.text('开始上传');
                }
            });

            $btn.on('click', function () {
                if (state === 'uploading') {
                    uploader.stop();
                } else {
                    uploader.upload();
                }
            });
            $("#picker").find("div").removeClass("webuploader-pick");
        });

        function textremo(obj) {
            setInterval("$('#thelist').remove();", 2000);
        }
        function LoadUserInfo() {
            $.ajax({
                url: "Ajax/PersonalInfo.ashx?operationType=LoadUserInfo",
                dataType: "json",
                async: false,
                success: function (data) {

                    $("[name=userName]").val(data["_u_name"]);
                    $("[name=department]").val(data["departmentName"]);
                    $("[name=loginName]").val(data["_u_loginname"]);
                    if (data["_u_sex"] == "女") {
                        $("[name=gender]").find("option:eq(1)").attr("selected", "selected");
                    }

                    //var mydate = new Date();
                    //var data = mydate.getFullYear() + "-";
                    //data += mydate.getMonth() + 1 + "-";
                    //data += mydate.getDate();

                    $("[name=Birthday]").val(data["_u_birthday"]);
                    // alert(data["_u_birthday"]);
                    $("[name=stuID]").val(data["_student_id"])
                    $("[name=email]").val(data["_u_email"])
                    $("[name=phone]").val(data["_u_tel"])
                    $("[name=memberDescribe]").val(data["_u_remark"])
                    $("[name=parentsEmail]").val(data["_u_parentsemail"])
                    $("[name=parentsPhone]").val(data["_u_parentstel"])

                    $("[name=address]").val(data["_u_address"])
                    $("[name=guide]").val(data["_u_remark"])

                    $("[data-name=userPic]").attr("src", data["_u_img"]);
                    $("#U_Consult").val(data["_CouSkilledField"]);
                    $("#GoodField").val(data["_CouIntroduce"]);
                    if (data["_RFtype"] == "4") {
                        RoleTypes = 4;
                        GetFuntionType = 4;

                        $("#Div_U_Consult").show();
                        $("#Div_GoodField").show();
                        $("#Did_Remark").hide();
                    } else {
                        $("#U_Consult").text("");
                        $("#GoodField").text("");
                        $("#Div_U_Consult").hide();
                        $("#Div_GoodField").hide();
                        $("#Did_Remark").show();
                    }
                    var roletype = data["_role_types"];
                    if (data["_u_addfield"] != "") {
                        var json1 = JSON.parse(data["_u_addfield"]);
                        var json = JSON.parse(data["_AddFiletemplate"]);

                        var arr = new Array();
                        if (json1 == json) {
                            labField = item["Field"];
                            labValue = item["Value"];
                            Addhtml(labField, labValue)
                        } else {
                            for (var m in json) {
                                var jsonValue = json[m];
                                if (m < json1.length) {
                                    var jsonValue1 = json1[m];
                                    var InputField = "";
                                    var InputValue = "";
                                    var InputField1 = "";
                                    var InputValue1 = "";
                                    //前两者的字段不一样
                                    if (jsonValue.Field != jsonValue1.Field) {
                                        arr.push(JSON.stringify(jsonValue));
                                        arr.push(JSON.stringify(jsonValue1));
                                        InputField = jsonValue.Field;
                                        InputValue = jsonValue.Value;
                                        InputField1 = jsonValue1.Field;
                                        InputValue1 = jsonValue1.Value;
                                        Addhtml(InputField, null, roletype);
                                        Addhtml(InputField1, null, roletype);
                                    }
                                    else {
                                        //前两者的字段一样-需要比对一下是否之前是数组存在这个
                                        var mn = findValue(arr, jsonValue.Field);
                                        if (mn < 0) {
                                            arr.push(JSON.stringify(jsonValue1));
                                            InputField = jsonValue1.Field;
                                            InputValue = jsonValue1.Value;
                                            Addhtml(InputField, InputValue, roletype);

                                        }
                                    }
                                } else {
                                    var jsonValue = json[m];

                                    InputField = jsonValue.Field;
                                    InputValue = "";
                                    Addhtml(InputField, InputValue, roletype);
                                }
                            }
                        }


                    }
                }
            })
        }

        function Addhtml(labValue, InputValue, roletype) {
            $("#addSelfDefinedInfo").remove();
            var strHtml = "";
            if (labValue != null) {
                strHtml += "<div class='col-md-10 col-sm-12 col-xs-12 col-md-offset-1 beforeSelfDefinedInfo'>" +
                                "<div class='col-md-4 text-right'>" +
                                    "<div class='lb-panel-left pull-left' style='background-color: white'>" +
                                        "<label style='border:none' value=" + labValue + " data-name='field' class=form-control>" + labValue + ":</label>" +
                                    "</div>" +
                                    "<div class='form-group lb-panel-right pull-right'>" +
                                        "<input type='text' class='form-control' value='" + InputValue + "' data-name='value'/>" +
                                    "</div>" +
                                "</div>" +
                            "</div>" +
                        "</div>"


            }
            if (roletype != "3") {
                strHtml += "<div class='col-md-12 col-sm-12 col-xs-12' id='addSelfDefinedInfo'>" +
                                "<div class='col-md-11 col-sm-12 col-xs-12' >" +
                                    "<div class='col-md-offset-5 col-xs-offset-8' style='margin-top:10px;'>" +
                                        "<span style='color:green' onclick='remove(this)'><i class='fa fa-minus'></i></span>&nbsp;&nbsp;&nbsp;<span onclick='CreateSelfDefinedHtml()' style='color:red' ><i class='fa fa-plus'></i></span>" +
                                    "</div>" +
                            "</div>" +
                        "</div>" +
                    "</div>";
            }
            $("#selfDefined").append(strHtml);
        }
        //查找是否存相同value,在并返回下标
        function findValue(json, value) {
            if (json.length > 0) {
                for (var ns in json) {
                    var jsonValue = JSON.parse(json[ns])
                    if (jsonValue.Field == value) {
                        return parseInt(ns);
                    }
                    return -1;
                }
            }
            return -1;
        }
        function LoadUserPic() {
            $.ajax({
                url: "Ajax/PersonalInfo.ashx?operationType=LoadUserPic",
                dataType: "text",
                success: function (data) {
                    $("[data-name=userPic]").attr("src", data);
                    $("#imgs").attr("src", data);
                }
            })
        }
        function CreateSelfDefinedHtml() {
            $("#addSelfDefinedInfo").remove();
            var strHtml = "<div class='col-md-10 col-sm-12 col-xs-12 col-md-offset-1 div' style='margin-top:10px;'>" +
                            "<div class='col-md-12'>" +
                                "<div class='col-md-1 col-xs-4' style='margin-left:3%'>" +
                                    "<input type='text' name='field' class = 'form-control' data-name='field'/>" +
                                "</div>" +
                                "<div class='col-md-2 col-xs-7' >" +
                                    "<input type='text' name='values' class='form-control' data-name='value'/>" +
                                "</div>" +
                            "</div>" +
                        "</div>" +
                    "</div>" +
                    "<div class='col-md-12 col-sm-12 col-xs-12' id='addSelfDefinedInfo'>" +
                        "<div class='col-md-11 col-sm-12 col-xs-12' >" +
                            "<div class='col-md-offset-5 col-xs-offset-8' style='margin-top:10px;'><span style='color:green' onclick='remove(this)'><i class='fa fa-minus'></i></span>&nbsp;&nbsp;&nbsp;<span onclick='CreateSelfDefinedHtml()' style='color:red' ><i class='fa fa-plus'></i></span></div>" +
                            "</div>" +
                    "</div>" +
            "</div>";
            $("#newDiv").append(strHtml);
        }
        function remove(obj) {
            var length = $("#newDiv .div:last").length;
            $("#newDiv .div:last").remove();
            if (length == 0) {
                $("#selfDefined .beforeSelfDefinedInfo:last").remove();
            }

        }
        function initSelectInput(controlname, Exhibition) {
            $("#" + controlname).empty();
            if (Exhibition != "") {
                $("#" + controlname).append("<option value='0'>" + Exhibition + "</option>");
            }
            $.ajax({
                type: "POST",
                url: "Ajax/PersonalInfo.ashx?operationType=LoadDepartmentFun",
                dataType: "json",
                success: function (msg) {


                    if (msg.State) {
                        $.each(eval(msg.Data), function (index, item) {
                            if (parseInt(item["Fun_ParentID"]) == 11) {
                                $("#" + controlname).append("<option value='" + item["Fun_ID"] + "'>" + item["Fun_Name"] + "</option>");
                            }
                        });
                        //$("#funDiv").show();
                    }

                }
            });
        }
        function Cancel() {
            window.location.href = "/Index.aspx";
        }
        function datas() {
            $("#bornDate").datepicker({
                language: "zh-CN",
                format: "yyyy-dd-mm",
                autoclose: true,
                todayHighlight: true,
                language: 'cn',
                format: "yyyy-mm-dd",
                endDate: new Date()
            })
        }
        datas()

        function disableds() {

            setInterval('datass()', 2000);
        }
        function datass() {
            $("#button").attr('disabled', false);
        }
        $("#bornDate").datepicker({
            language: "zh-CN",
            format: "yyyy-dd-mm",
            autoclose: true,
            todayHighlight: true,
            language: 'cn',
            format: "yyyy-mm-dd",//日期格式
            endDate: new Date()

        }).on('hide', function (e) {
            $('#userInfo').data('bootstrapValidator')
                .updateStatus('Birthday', 'NOT_VALIDATED', null)
                .validateField('Birthday');
        });
    </script>
</asp:Content>
