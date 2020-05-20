<html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ include file="../../common/include-header.jsp" %>

<body class="gray-bg">

<div class="container-div">
    <div class="row">
        <div class="col-sm-12 search-collapse">
            <form id="role-form">
                <div class="select-list">
                    <ul>
                        <li>
                            科目名：
                            <select required name="subid" id="subid" style="width: 170px" >
                                <option value="">请选择</option>
                            </select>
                        </li>
                        <li>
                            试卷名称：<input type="text" name="examName" style="width: 170px" />
                        </li>
                        <li>
                            学生名字：<input type="text" name="stuName" style="width: 170px" />
                        </li>
                        <li class="select-time">
                            <label>创建时间： </label>
                            <input type="text" class="time-input" id="startTime" placeholder="开始时间"
                                   name="params[beginTime]"/>
                            <span>-</span>
                            <input type="text" class="time-input" id="endTime" placeholder="结束时间"
                                   name="params[endTime]"/>
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

        <div class="col-sm-12 select-table table-striped">
            <table id="bootstrap-table" data-mobile-responsive="true"></table>
        </div>
    </div>
</div>
<%@include file="../../common/include-footer.jsp" %>
<script th:inline="javascript">
    var prefix = "/onlineExam/score";
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
                    field: 'examId',
                    title: '试题ID'
                },
                {
                    field: 'examName',
                    title: '试题名',
                    sortable: true
                },
                {
                    field: 'subname',
                    title: '科目名'
                },
                {
                    field: 'stuId',
                    title: '学生Id',
                    sortable: true
                },
                {
                    field: 'stuName',
                    title: '学生姓名',
                    sortable: true
                },
                {
                    field: 'totalScore',
                    title: "成绩",
                    formatter: function (value, row, index) {
                        if (row.reading == '0') {
                            return '<span class="label label-info">' + row.totalScore + '</span>';
                        } else if (row.status == '0') {
                            return '<span class="label label-danger">未参考</span>';
                        } else if (row.reading == '1') {
                            return '<span class="label label-primary">尚未阅卷</span>';
                        }
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
