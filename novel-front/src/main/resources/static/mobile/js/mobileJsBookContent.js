        //点击后弹出输入框 请输入下一章链接
    function addNextPage()
    {
        var bookId=document.getElementById("bookIdHidden").value;
        var pageId=document.getElementById("contentIdHidden").value;
        var d = dialog({
        title: '消息',
        content: '请输入下一章题目:<input id="add-page-title" value="" /></br>请输入下一章链接:<input id="add-page-link" value="" />',
        ok: function () {
          var pageTitle = $('#add-page-title').val();
          var pageLink = $('#add-page-link').val();
          AddSignRow(pageLink,pageTitle);
          addNextPage2(pageTitle,pageLink,bookId,pageId);
        }
        });
        d.show();
    }
    //二级评论点赞的功能
    function sLCommentPraiseOnClick(iconOb){
        //alert("开始点击");//可以
        //点击后变色
        if (iconOb.getAttribute("flag")=="0") {
            iconOb.style.color="rgb(252, 85, 49)";
            iconOb.innerHTML++;
            iconOb.setAttribute("flag","1");
            var  flc_id=iconOb.getAttribute("flcid");
            var  slc_id=iconOb.getAttribute("slcid");
            //console.log($.cookie('commentThumpCookie'));
            //是否进行提交
            var commentThumsJson = JSON.parse( localStorage.getItem('commentThumpStore'));
            if(commentThumsJson["slc_id"+slc_id]=="0"){
                //alert("可以提交11");
                commentThumsJson["slc_id"+slc_id]="1";
                localStorage.setItem('commentThumpStore',JSON.stringify(commentThumsJson));
                $.ajax({
                    type: "POST",
                    url: "/user/addCommentThumbs2",
                    data: {slc_id:slc_id},
                    dataType: "json",
                    success: function (data) {
                        //alert("点赞成功!");
                    }
                 })

            }
        } else if (iconOb.getAttribute("flag")=="1") {
            iconOb.innerHTML--;
            iconOb.style.color="rgb(153, 154, 170)";
            iconOb.setAttribute("flag","0");
        }
    }
    //一级评论点赞的功能
    function fLCommentPraiseOnClick(iconOb){
        //alert("12");
        //点击后变色
        if (iconOb.getAttribute("flag")=="0") {
            iconOb.style.color="rgb(252, 85, 49)";
            iconOb.innerHTML++;
            iconOb.setAttribute("flag","1");
            var  flc_id=iconOb.getAttribute("flc_id");
            //console.log(localStorage.getItem('commentThumpStore'));
            //是否进行提交
            var commentThumsJson = JSON.parse( localStorage.getItem('commentThumpStore'));
            if(commentThumsJson["flc_id"+flc_id]=="0"){
                //alert("可以提交11");
                commentThumsJson["flc_id"+flc_id]="1";
                //$.cookie("commentThumpCookie",JSON.stringify(commentThumsJson));
                localStorage.setItem('commentThumpStore',JSON.stringify(commentThumsJson));
                $.ajax({
                    type: "POST",
                    url: "/user/addCommentThumbs",
                    data: {flc_id:flc_id},
                    dataType: "json",
                    success: function (data) {
                        //alert("点赞成功!");
                    }
                 })

            }
        } else if (iconOb.getAttribute("flag")=="1") {
            iconOb.innerHTML--;
            iconOb.style.color="rgb(153, 154, 170)";
            iconOb.setAttribute("flag","0");
        }
    }

    //在数据库里写入
    function addNextPage2(pageTitle,pageLink,bookId,pageId)
    {
            $.ajax({
            type: "POST",
            url: "/author/addMoreNextPage",
            data: {'pageTitle':pageTitle,'pageLink':pageLink,'bookId':bookId,'pageId':pageId},
            dataType: "json",
            success: function (data) {

            },
            error: function () {
                lock = false;
                layer.alert('网络异常');
            }
        })
    }
    //评论点赞的功能
    function commentPraiseOnClick(){
        alert("12");


    }
    //在网页加载完成后,读取数据库,然后写入xml链接
    function addNextPageFromMysql()
    {
        var bookId=document.getElementById("bookIdHidden").value;
        var pageId=document.getElementById("contentIdHidden").value;
        $.ajax({
            type: "get",
            url: "/user/getMoreNextPage",
            data: {'bookId':bookId,'pageId':pageId},
            dataType: "json",
            success: function (returndata) {
                if(returndata!=""&&returndata!=null){
                    var nexStr='{';

                    for (var i = 0; i < returndata.pages.length; i++) {
                        AddSignRow2(returndata.pages[i].linkurl,returndata.pages[i].title,returndata.pages[i].id,returndata.pages[i].thumbsupCount);

                        nexStr+='"id'+returndata.pages[i].id+'":';
                        nexStr+='"0",';
                    }
                    nexStr+='"weiba":"weiba"}';
                    if( $.cookie('nextpagelinkFlagcookie')==null){
                        $.cookie('nextpagelinkFlagcookie', nexStr);
                    }
                }

            },
            error: function () {
                lock = false;
                //删除了下面这一行,可能会有问题,以后再处理吧  TODO
                //layer.alert('网络异常');
            }
        })
    }
        //点赞功能的实现
    function praiseOnClick(iconOb){
        //点击后变色
        if (iconOb.getAttribute("flag")=="0") {
            iconOb.style.color="rgb(252, 85, 49)";
            iconOb.innerHTML++;
            //是否进行提交
            var storedlinkFlagJSON = JSON.parse($.cookie('nextpagelinkFlagcookie'));
            //console.log(storedlinkFlagJSON.name);
            var  linkid=iconOb.getAttribute("bataseid");
            //alert(iconOb.bataseid);
            if(storedlinkFlagJSON["id"+linkid]=="0"){
                //alert("可以提交");
                storedlinkFlagJSON["id"+linkid]="1";
                $.cookie('nextpagelinkFlagcookie', JSON.stringify(storedlinkFlagJSON));
                $.ajax({
                    type: "POST",
                    url: "/author/addNextPageThums",
                    data: {pagelinkId:linkid},
                    dataType: "json",
                    success: function (data) {
                        //alert("点赞成功!");
                    }
                 })
            }
            iconOb.setAttribute("flag","1");
        } else if (iconOb.getAttribute("flag")=="1") {
            iconOb.innerHTML--;
            iconOb.style.color="rgb(153, 154, 170)";
            iconOb.setAttribute("flag","0");
        }

        //上传数据
        // 下面是延时1s，向某个url发送请求。
<!--        setTimeout(() => {-->
<!--            if(iconOb.getAttribute("flag")=="1"){-->
<!--                 $.ajax({-->
<!--                    type: "POST",-->
<!--                    url: "/author/addMoreNextPage",-->
<!--                    data: {'pageTitle':pageTitle,'pageLink':pageLink,'bookId':bookId,'pageId':pageId},-->
<!--                    dataType: "json",-->
<!--                    success: function (data) {-->

<!--                    }-->
<!--                 })-->

<!--            }-->

<!--        }, 4000);-->



    }

     function changeCommentNum()
        {
              var commentNumOb=document.getElementsByName("commentNum");
              var bookId=document.getElementById("bookIdHidden").value;
              var pageId=document.getElementById("contentIdHidden").value;

              //  在初始化时调用
              //刷新每行后面评论的数量
              //根据传入 bookid ，pageid length 进行访问
                $.ajax({
                    type: "get",
                    url: "/comment/getLineCommentNum",
                    data: {'bookId':bookId,'pageId':pageId,'lineMaxNum':commentNumOb.length+1},
                    dataType: "json",
                    success: function (returndata) {
                        if(returndata!=""&&returndata!=null){
                            //访问后传回一个列表
                          var commentNumOb=document.getElementsByName("commentNum");

                          for (let i=0; i<commentNumOb.length; i++){
                               commentNumOb[i].innerHTML=returndata.lineNums[i];
                               //commentNumOb[i].innerHTML=2;

                              //根据ajax返回的数值，进行修改
                          }
                        }

                    },
                    error: function () {
                        lock = false;
                        //删除了下面这一行,可能会有问题,以后再处理吧  TODO
                        //layer.alert('网络异常');
                        alert("erro");
                    }
                })

        }

    //给每一行的文字,都增加一个第几行的记录
    function changeLineNum()
    {
          var commentNumOb=document.getElementsByName("commentNum");
          var nowNum=0;
          for (let i=0; i<commentNumOb.length; i++){
              nowNum=nowNum+1;
              commentNumOb[i].setAttribute("datasegid",nowNum);

          }
    }
    //显示弹窗的

    function dianwo(){
        document.getElementById('zhezhao').style.display="";
    }
    function hidder(){
        document.getElementById('zhezhao').style.display="none";
    }
    function showCommentDiv(commentOb) {

        //设置id   value
        //alert(commentOb.getAttribute("datasegid"));
        document.getElementById("nowLineIdHidden").value=commentOb.getAttribute("datasegid");
        //alert("nowNum"+document.getElementById("nowLineId").value);
        var v1 = document.getElementById("zhezhao");
        if (v1.style.display == "none") {
            v1.style.display = "block";
        } else {
            v1.style.display = "none";
        }
    }
    //追加html
    function AddSignRow(linkVar,titleVar){
                //<div id="SignFrame2" class="flex-container">
        //var num='1';
        var sb='<a  href="';
        sb+=linkVar;
        sb+='">';
        sb+=titleVar;
        sb+='</a>';
        var  tmp = document.createElement( 'div' );//创建一个div
        tmp.className="flex-item";
        var SignFrame=tmp.innerHTML+=sb;//添加到div里
          //num++;
        document.getElementById( 'SignFrame2' ).appendChild(tmp);//添加到你指的的id的地方
    }
        //追加html2
    function AddSignRow2(linkVar,titleVar,id,thumbsupCount){
         //<div id="SignFrame2" class="flex-container">
        //var num='1';
        var sb='<a  href="';
        sb+=linkVar;
        sb+='">';
        sb+=titleVar;
        sb+='</a>';
        sb+='<br>';
        sb+='<i class="layui-icon layui-icon-praise" bataseid="';
        sb+=id;
        sb+='" onclick="praiseOnClick(this)" flag="0" style="font-size: 18px; color: #849FB3;" >'
        sb+=thumbsupCount;
        sb+='</i>';
        var  tmp = document.createElement( 'div' );//创建一个div
        tmp.className="flex-item";
        var SignFrame=tmp.innerHTML+=sb;//添加到div里
          //num++;
        document.getElementById( 'SignFrame2' ).appendChild(tmp);//添加到你指的的id的地方

    }

