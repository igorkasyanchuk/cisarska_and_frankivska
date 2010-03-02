jQuery(function() { 
  jQuery('div.notice, div.warning, div.error').click(function() {
    jQuery(this).hide();
  });
});
