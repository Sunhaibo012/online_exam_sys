<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%@include file="../../common/include-header.jsp" %>

<body class="gray-bg">

<div class="container-div">
    <div class="row">
        <div class="col-sm-12 search-collapse">
            <form id="role-form">
                <div class="select-list">
                    <ul>
                        <li>
                            科目：
                            <select name="subid" id="subid" style="width: 170px" >
                                <option value="">请选择</option>
                            </select>
                        </li>
                        <li>
                            试题名称：<input type="text" name="title" style="width: 170px"/>
                        </li>
                        <li>
                            <%--试题类型：<input type="text" name="type" style="width: 170px"/>--%>
                            试题类型：
                            <select name="type">
                                <option value="">请选择</option>
                                <option value="1">单选</option>
                               <option value="2">多选</option>
                               <option value="3">填空</option>
                               <option value="4">判断</option>
                               <option value="5">简答</option>
                            </select>
                        </li>
                        <li class="select-time">
                            <label>创建时间： </label>
                            <input type="text" class="time-input" id="startTime" placeholder="开始时间"
                                   name="beginTime"/>
                            <span>-</span>
                            <input type="text" class="time-input" id="endTime" placeholder="结束时间"
                                   name="endTime"/>
                        </li>
                        <li>
                            <a class="btn btn-primary btn-rounded btn-sm" onclick="$.table.search()"><i
                                    class="fa fa-search"></i>&nbsp;搜索</a>
                            <a class="btn btn-warning btn-rounded btn-sm" onclick="$.form.reset()"><i
                                    class="fa fa-refresh"></i>&nbsp;重置</a>
                        </li>
                    </ul>
                </div>
            </form>
        </div>

        <div class="btn-group-sm" id="toolbar" role="group">
            <a class="btn btn-success" onclick="$.operate.add()">
                <i class="fa fa-plus"></i> 新增
            </a>
            <%--<a class="btn btn-primary btn-edit disabled" onclick="$.operate.edit()">
                <i class="fa fa-edit"></i> 修改
            </a>--%>
            <a class="btn btn-danger btn-del disabled" onclick="$.operate.removeAll()">
                <i class="fa fa-remove"></i> 批量删除
            </a>
        </div>

        <div class="col-sm-12 select-table table-striped">
            <table id="bootstrap-table" data-mobile-responsive="true"></table>
        </div>
    </div>
</div>
<%@include file="../../common/include-footer.jsp" %>
<script th:inline="javascript">
    var prefix = "/onlineExam/question";
    $(function () {
        var options = {
            url: prefix + "/list",
            createUrl: prefix + "/add",
            updateUrl: prefix + "/update/{id}",
            removeUrl: prefix,
            sortName: "",
            // rememberSelected: true,
            height: 500,
            modalName: "试题",
            columns: [{
                field: 'state',
                checkbox: true
            },
                {
                    field: 'id',
                    title: '试题ID'
                },
                {
                    field: 'subname',
                    title: '科目'
                },
                {
                    field: 'title',
                    title: '试题的标题',
                    sortable: true
                },
                {
                    field: 'type',
                    title: '试题类型',
                    formatter: function (value, item, index) {
                        if (item.type == '1') {
                            return '<span class="label label-success">单选</span>';
                        } else if (item.type == '2') {
                            return '<span class="label label-primary">多选</span>';
                        } else if (item.type == '3') {
                            return '<span class="label label-danger">填空</span>';
                        } else if (item.type == '4') {
                            return '<span class="label label-info">判断</span>';
                        } else if (item.type == '5') {
                            return '<span class="label label-warning">简答</span>';
                        }
                    }
                },
                {
                    field: 'createDate',
                    title: '创建时间',
                    sortable: true,
                    formatter:function(val, item, rowIndex){
                        var dateee = new Date(val).toJSON();
                        var date = new Date(+new Date(dateee)+16*3600*1000).toISOString().replace(/T/g,' ').replace(/\.[\d]{3}Z/,'');
                        return date;
                    }
                },
                {
                    title: '操作',
                    align: 'center',
                    formatter: function (value, row, index) {
                        var actions = [];
                        actions.push('<a class="btn btn-success btn-xs ' + '" href="#" onclick="$.operate.edit(\'' + row.id + '\')"><i class="fa fa-edit"></i>编辑</a> ');
                        actions.push('<a class="btn btn-danger btn-xs ' + '" href="#" onclick="$.operate.remove(\'' + row.id + '\')"><i class="fa fa-remove"></i>删除</a>');
                        return actions.join('');
                    }
                }]
        };
        $.table.init(options);

        //科目下拉款初始化
        $.ajax({
            url:"/onlineExam/subject/getSubject",    //请求的url地址
            dataType:"json",   //返回格式为json
            async:true,//请求是否异步，默认为异步，这也是ajax重要特性
            data:{"id":"无"},    //参数值
            type:"POST",   //请求方式
            success:function(data){
                var list = data.list;
                for(var i=0;i<list.length;i++){
                    var subid = list[i].subid;
                    var subname =list[i].subname;
                    // $("#subid").val([subid,subname]);
                    //给下拉框动态赋值
                    $("#subid").append("<option value='"+subid+"'>"+subname+"</option>");
                }
                // alert($("#subid").val());
            }

        });

    });
</script>
</body>
</html>
