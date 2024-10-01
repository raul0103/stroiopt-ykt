{set $data = "@FILE snippets/getJsonData.php" | snippet : [
    "path" => "/assets/template/json/sections/faqs-contacts.json"
]}
{include "file:sections/faqs/wrapper.tpl" data=$data not_columns=true}
