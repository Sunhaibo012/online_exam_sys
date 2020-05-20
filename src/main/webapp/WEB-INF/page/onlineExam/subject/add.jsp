<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%@include file="../../common/include-header.jsp" %>
<body>
<div class="form-content">
    <form id="form-notice-add" class="form-horizontal">
        <h4 class="form-header h4">基本信息</h4>
        <div class="form-group">
            <label class="col-sm-3 control-label"><span style="color: red; ">*</span>科目名称：</label>
            <div class="col-sm-8">
                <input type="text" name="subname" id="subname" class="form-control" />
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
        // var subname = $("input[name='subname']").val();
        var subname = $("#subname").val();
        if(subname == ""){
            return false;
        }
        var data = {"subname": subname}
        return data;
    }


    function submitHandler() {
        var param = getData();
        if(!param){
            alert("科目名称不能为空！！！");
            return;
        }
        $.operate.save(prefix + "/add", param );
    }

</script>
</body>
</html>
