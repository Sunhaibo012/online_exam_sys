<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%@include file="../../common/include-header.jsp" %>
<body>
<div class="form-content">
    <form id="form-notice-add" class="form-horizontal">
        <h4 class="form-header h4">基本信息</h4>
        <div class="form-group">
            <label class="col-sm-3 control-label"><span style="color: red; ">*</span>科目编号：</label>
            <div class="col-sm-8">
                <input type="text" name="subname" id="subid" class="form-control" readonly="readonly"
                       value="${subject.subid}" />
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label"><span style="color: red; ">*</span>科目名称：</label>
            <div class="col-sm-8">
                <input type="text" name="subname" id="subname" class="form-control" value="${subject.subname}"/>
            </div>
        </div>
    </form>
</div>

<%@include file="../../common/include-footer.jsp" %>

<script src="/static/plugin/select/select2.js"></script>
<script>
    var prefix = "/onlineExam/subject";

    /**
     * 获取页面数据
     */
    function getData() {
         var subid = $("#subid").val();
        var subname = $("#subname").val();
        var data = {"subname": subname,"subid": subid}
        return data;
    }


    function submitHandler() {
        $.operate.save(prefix + "/update", getData());
    }

</script>
</body>
</html>
