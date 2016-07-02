$(function() {
  $(".todo-list li").on("click", function(){
    var target = $(this);

    var product_id = $(this).find("input")[0].value
    var todo_id = $(this).find("input")[1].value
    

    url = product_id + "/todo_lists/" + todo_id

    data = { todo_list: { id: todo_id } }

    $.ajax({
      type: "PATCH",
      url: url,
      data: data,
      success: success,
      dataType: "text"
    });
    function success(data){
      target.toggleClass("done")
      console.log(target);
    }
  });

});