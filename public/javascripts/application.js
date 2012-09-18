if (history && history.pushState) {
  $(function() {
    $("#elements th a, #elements .pagination a").live("click", function(e) {
      $.getScript(this.href);
      history.pushState(null, document.title, this.href);
      e.preventDefault();
    });
    $("#elements_search input").keyup(function() {
      $.get($("#elements_search").attr("action"), $("#elements_search").serialize(), null, "script");
      history.replaceState(null, document.title, $("#elements_search").attr("action") + "?" + $("#elements_search").serialize());
    });
    $(window).bind("popstate", function() {
      $.getScript(location.href);
    });
  });
}
