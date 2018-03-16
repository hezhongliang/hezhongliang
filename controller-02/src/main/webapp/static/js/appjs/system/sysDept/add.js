

// $().ready(function() {
// 	validateRule();
// });
//
// $.validator.setDefaults({
// 	submitHandler : function() {
// 		save();
// 	}
// });

layui.use(['form', 'layedit', 'laydate'], function(){
    var form = layui.form;

    //自定义验证规则
    form.verify({
        deptname: function(value){
            // if(value.length > 6){
            //     return '部门名称最多6个字符';
            // }
            if(!/[\u4e00-\u9fa5]{4,6}/.test(value)){
                return '部门名称必须4-6位汉字';
            }
        },
        deptnum: function(value){
            if(value.length > 10){
                return '排序不能大于10';
            }
            if(!/^[0-9]{1,10}$/.test(value)){
                return '排序必须1-10位数字';
            }
        },
        deptflag: function(value){
			if(value.length > 1){
				return '状态不能大于1';
			}
			if(!/^[0-1]{1}$/.test(value)){
				return '状态必须1位数字';
			}
		}
    });
    //监听表单提交
    form.on("submit(form-111)", function (data) {
        save();
        // alert("表单提交大大苏打实打实的");
        // console.log("--------------------------------------");
        // console.log(data);
        // //关闭对话框
        // var index = parent.layer.getFrameIndex(window.name); // 获取窗口索引
        // parent.layer.close(index);
        // return false;
    });
});








function save() {
	$.ajax({
		cache : true,
		type : "POST",
        url : "../../demp/save",
		data : $('#signupForm').serialize(),// 你的formid
		async : false,
		error : function(request) {
			parent.layer.alert("Connection error");
		},
		success : function(data) {
			if (data.code == 0) {
				parent.layer.msg("操作成功");
				parent.reLoad();
				var index = parent.layer.getFrameIndex(window.name); // 获取窗口索引
				parent.layer.close(index);

			} else {
				parent.layer.alert(data.msg)
			}

		}
	});

}
function validateRule() {
	var icon = "<i class='fa fa-times-circle'></i> ";
	$("#signupForm").validate({
		rules : {
			name : {
				required : true
			}
		},
		messages : {
			name : {
				required : icon + "请输入姓名"
			}
		}
	})
}