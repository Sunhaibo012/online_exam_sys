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
                            科目名：<input type="text" name="subname" id="subname" style="width: 170px" ></input>
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
    var prefix = "/onlineExam/subject";
    $(function () {
        var options = {
            url: prefix + "/list",
            createUrl: prefix + "/add",
            updateUrl: prefix + "/update/{id}",
            removeUrl: prefix ,
            sortName: "",
            // rememberSelected: true,
            height: 500,
            modalName: "科目",
            columns: [{
                field: 'state',
                checkbox: true
            },
                {
                    field: 'subid',
                    title: '科目编号'
                },
                {
                    field: 'subname',
                    title: '科目名称'
                },
                {
                    title: '操作',
                    align: 'center',
                    formatter: function (value, row, index) {
                        var actions = [];
                        actions.push('<a class="btn btn-success btn-xs ' + '" href="#" onclick="$.operate.edit(\'' + row.subid + '\')"><i class="fa fa-edit"></i>编辑</a> ');
                        actions.push('<a class="btn btn-danger btn-xs ' + '" href="#" onclick="$.operate.remove(\'' + row.subid + '\')"><i class="fa fa-remove"></i>删除</a>');
                        return actions.join('');
                    }
                }]
        };
        $.table.init(options);

    });
</script>
</body>
</html>
