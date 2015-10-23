jQuery(function ($) {
    $("#search-form").submit(function(){
        var link = '/search/0/';
        link = link + encodeURIComponent($("select[name=dur] option:selected",this).val()) + '/';
        link = link + encodeURIComponent($("select[name=hq] option:selected",this).val()) + '/';
        link = link + encodeURIComponent($("select[name=qdr] option:selected",this).val()) + '/';
        link = link + encodeURIComponent($("select[name=website] option:selected",this).val()) + '/';
        link = link + encodeURIComponent($("input[name=q]",this).val());
        document.location.href = link;
        return false;
    });
});