// setup wysiwym
$(function() {
  $("#post-body textarea").wysiwym(Wysiwym.Markdown, {});

  
// setup live preview
var showdown = new Showdown.converter();
var prev_text = "";
var update_live_preview = function() {
  var input_text = $("#post-body textarea").val();
  if (input_text != prev_text) {
    var text = $("<div>"+ showdown.makeHtml(input_text) + "</div>");
    text.find("pre").addClass("prettyprint");
    text.find("p code").addClass("prettyprint");
    text.find("code").each(function(){
      $(this).html(prettyPrintOne($(this).html()));
    });
    $("#post-preview").html(text);
    prev_text = input_text;
  }
};

setInterval(update_live_preview, 200);
});
