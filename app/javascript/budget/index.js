$(document).ready(function(){
  if ($(".ctr-budget").length > 0) {
    $(".month-btn").on("click", function() {
      $(".month-btn").removeClass("green").addClass("black");
      $(this).removeClass("black").addClass("green");
      $(".selected-month").html($(this).html());
      $.post(`/budget/monthly-transactions/`, { month: $(this).html() }, function(data) {
        $(".table-container").empty();
        $(".table-container").append(data);
      })
      $.post(`/budget/monthly-sum/`, { month: $(this).html() }, function(data) {
        $(".budget-container").empty();
        $(".budget-container").append(data);
      })
    })
    $(".close-modal").click(function() {
      $(".new-item-modal").removeClass("open");
    })
    $("#newTransaction").click(function() {
      $("#transactionModal").addClass("open");
    })
    $("#newBudget").click(function() {
      $("#budgetModal").addClass("open");
    })

    $("body").on("click", ".transaction-item", function() {
      $(this).children("input").show();
      $(this).children("span").hide();
    })
    $(document).ready( function () {
      $('#transactionTable').DataTable( {
        ordering: false,
        searching: false,
        "lengthChange": false
      });
    });
  }
})
