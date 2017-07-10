$(function() {
    	$('select').comboSelect();
           $("table").DataTable({
               //开启本地保存功能
               stateSave: true,
               //保存状态操作
               "stateSaveParams": function (settings, data) {
                   console.log("stateSaveParams");

                   //这里可以操作保存的数据，写上自己特定的逻辑
                   //data.search.search = "";
               },
               "stateSaveCallback": function (settings, data) {
                   console.log("stateSaveCallback");

                   //DT默认保存的key值为DataTables_+表格id+页面名称
                   localStorage.setItem('DataTables_' + settings.sInstance, JSON.stringify(data));

                   // 你可以把这些数据保存在服务器上，上面的代码标识使用本地储存来存储这些数据


               },

               //读取状态操作
               "stateLoadParams": function (settings, data) {
                   console.log("stateSaveParams");

                   //在读取数据的时候可以改变数据，根据自己逻辑来处理
                   //data.search.search = "";

                   //或者你可以直接禁用从缓存里读取数据，只要直接返回false即可
                   //return false;
               },
               "stateLoadCallback": function (settings) {
                   console.log("stateLoadCallback");
                   return JSON.parse(localStorage.getItem('DataTables_' + settings.sInstance));

                   //同样你还可以从服务器取数，采用同步的方式获取到保存在服务器里的数据

               },
               //状态加载完后执行的回调函数
               "stateLoaded": function (settings, data) {
                   console.log("stateLoaded");

                   //在这里你可以打印出保存的缓存数据
                   //alert( 'Saved filter was: '+data.search.search );

               },

               "language": {
                   "lengthMenu": "每页_MENU_ 条记录",
                   "zeroRecords": "没有找到记录",
                   "info": "第 _PAGE_ 页 ( 总共 _PAGES_ 页 )",
                   "infoEmpty": "无记录",
                   "search": "搜索：",
                   "infoFiltered": "(从 _MAX_ 条记录过滤)",
                   "paginate": {
                       "previous": "上一页",
                       "next": "下一页"
                   }
               },
               "dom": "<'row'<'col-xs-2'l><'#mytool.col-xs-4'><'col-xs-6'f>r>" +
               "t" +
               "<'row'<'col-xs-6'i><'col-xs-6'p>>"
           });
       });