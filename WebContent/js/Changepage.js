jQuery(document).ready(function(event){
  var isAnimating = false,
  	isCorrect = true;
    firstLoad = false;
  
  //trigger smooth transition from the actual page to the new one 
  $('main').on('click', '[data-type="page-transition"]', function(event){
    event.preventDefault();
    //detect which page has been selected
    var newPage = $(this).attr('href');
    
    if(newPage == 'home.do')
    	checkAndSubmit();

    //if the page is not already being animated - trigger animation
    if( (!isAnimating) & isCorrect) changePage(newPage, true);
    firstLoad = true;
  });

  //detect the 'popstate' event - e.g. user clicking the back button
  $(window).on('popstate', function() {
  	if( firstLoad ) {
      /*
      Safari emits a popstate event on page load - check if firstLoad is true before animating
      if it's false - the page has just been loaded 
      */
      var newPageArray = location.pathname.split('/'),
        //this is the url of the page to be loaded 
        newPage = newPageArray[newPageArray.length - 1];
      if( !isAnimating ) changePage(newPage, false);
    }
    firstLoad = true;
	});

	function changePage(url, bool) {
    isAnimating = true;
    // trigger page animation
    $('body').addClass('page-is-changing');
    $('.cd-loading-bar').one('webkitTransitionEnd otransitionend oTransitionEnd msTransitionEnd transitionend', function(){
    	loadNewContent(url, bool);
      $('.cd-loading-bar').off('webkitTransitionEnd otransitionend oTransitionEnd msTransitionEnd transitionend');
    });
    //if browser doesn't support CSS transitions
    if( !transitionsSupported() ) loadNewContent(url, bool);
	}

	function loadNewContent(url, bool) {
		url = ('' == url) ? 'login.do' : url;
		var newSection = 'cd-'+url.replace('.do', '');
		var section = $('<div class="cd-main-content '+newSection+'"></div>');
  		
	  	section.load(url+' .cd-main-content > *', function(event){
	      // load new content and replace <main> content with the new one
	      $('main').html(section);
	      //if browser doesn't support CSS transitions - dont wait for the end of transitions
	      var delay = ( transitionsSupported() ) ? 1200 : 0;
	      setTimeout(function(){
	        //wait for the end of the transition on the loading bar before revealing the new content
	        ( section.hasClass('cd-home') ) ? $('body').addClass('cd-home') : $('body').removeClass('cd-home');
	        $('body').removeClass('page-is-changing');
	        $('.cd-loading-bar').one('webkitTransitionEnd otransitionend oTransitionEnd msTransitionEnd transitionend', function(){
	          isAnimating = false;
	          $('.cd-loading-bar').off('webkitTransitionEnd otransitionend oTransitionEnd msTransitionEnd transitionend');
	        });
	
	        if( !transitionsSupported() ) isAnimating = false;
	      }, delay);
	      
	      if(url!=window.location && bool){
	        //add the new page to the window.history
	        //if the new page was triggered by a 'popstate' event, don't add it
	        window.history.pushState({path: url},'',url);
	      }
	      
	      setTimeout(function(){
	    	  window.location.href = url;
	      	}, 2200);
	  	});
	}

  function transitionsSupported() {
    return $('html').hasClass('csstransitions');
  }
  
	var cnt=0;
	var isVerify=false;
	var isVerifyPass=false;
	function verifyCode(){
		var code_json={
				"code":$("#verifyCode").val(),
		};
		var res;
		$.ajax({
			type:"post",
			async:false,
			url:"verifyCode.do",
			data:code_json,
			success:function(res){
				if(res=="ok"){
					isVerifyPass= true;
				}else{
					isVerifyPass= false;
				}
				}
		});
	}
	
	
	
	function title_ts(msg){
//		$.dialog({
//			lock: false,
//		    title: '提示信息',
//		    width: 220, 
//		    content: msg,
//		    min:false,
//		    max:false,
//		    opacity: 0.1,
//		    ok: function () { }
//		});
		
		
		
	}
  
  function checkAndSubmit(){
		
		cnt++;
		//不需要验证
		if(!isVerify){
			var res=false;
			var userAccount = $('#input_Log').val();
			var userPassword = $('#pas').val();
			var user_json = {        
	                "userAccount": userAccount,
	                "userPassword": userPassword,
	         };
			   url = "loginT.do";
              //Ajax发送数据给后台  
              $.ajax({  
                  url :url,
                  type : "post",
                  async:false,
                  data : user_json,  
                  success : function (res){  
                      if(res=="no"){ 
                      	//不存在该用户
                    	isCorrect = false;
                      	
                      	if(cnt>=2){
                      		isVerify=true;
                      		//显示验证码
                      		$("#verifyCode").css('display','block');
                      		$("#randImage").css('display','block');
                      		
                      	}
                          shockHint();
                          return;
                      } else{  
                      	//存在该用户
                      	isCorrect = true;
                      	return true;
                     }  
                  }  
              });  
		}else{
			//需要验证
			var res=false;
			var userAccount = $('#input_Log').val();
			var userPassword = $('#pas').val();
			verifyCode();
			if(isVerifyPass){
				//通过验证码
				var user_json = {        
		                "userAccount": userAccount,
		                "userPassword": userPassword,
		            };
				   url = "loginT.do";
	                //Ajax发送数据给后台  
	                $.ajax({  
	                    url :url,
	                    type : "post",
	                    async:false,
	                    data : user_json,  
	                    success : function (res){  
	                        if(res=="no"){ 
	                            shockHint();
	                        } else{  
	                        	//存在该用户
	                        	isCorrect = true;
	                        	return true;
	                        }  
	                    }  
	                }); 
			}else{
				alert("验证码输入错误！");  
//				title_ts("验证码输入错误");
              shockHint();
              loadimage();
			}
		}
	}
});