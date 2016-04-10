   $(document).ready(function(){
         $("#q1").click(function(){
         $("#div1").hide();
         $("#a6").hide();
         $("#a3").show();
         $("#a4").show();
         $("#a7").show();
         $("#a5").show();
         $("#q1").attr("class","active");
         $("#q2").attr("class","default"); 
         $("#form2").attr("action","login");
         $("#form2").attr("id","form1");
      });
        $("#q2").click(function(){
        $("#div1").show();
        $("#div2").show();
        $("#a6").show();
        $("#a7").hide();
        $("#a3").hide();
        $("#a5").hide();
        $("#a4").hide();
        $("#q2").attr("class","active");
        $("#q1").attr("class","default"); 
        $("#form1").attr("action","register");
        $("#form1").attr("id","form2");
      });
  });
   function openDialog(){
		$('#myModal').modal('toggle');
	}
	$('li.dropdown').mouseover(function() {
		$(this).addClass('open');
	}).mouseout(function() {
		$(this).removeClass('open');
	});