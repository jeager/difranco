$(document).ready(function() {
    $("#tasks_products_container").on('cocoon:before-insert', function(e, insertedItem) {
        var hidden_id = insertedItem[0].childNodes[3].childNodes[3].id;
        var product_id = "product_name_" + Math.round(Math.random() * 10000000);
        $(insertedItem[0].childNodes[3].childNodes[1]).attr("data-id-element", hidden_id)
        $(insertedItem[0].childNodes[3].childNodes[1]).attr("id", product_id)
        $(insertedItem[0].childNodes[3].childNodes[1]).bind('railsAutocomplete.select', function(event, data) {
        	$(insertedItem[0].childNodes[3].childNodes[3]).attr('value', data.item.id);
        });
    });

});