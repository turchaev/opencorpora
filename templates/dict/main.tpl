{* Smarty *}
{extends file='common.tpl'}
{block name='content'}
<script>
    $(document).ready(function(){
        $("#form_search_input").autocomplete("ajax/dict_substring_search.php",{
            minChars:3,
            maxItemsToShow:10,
            width:200,
            formatItem:function (row, i, num) {
                var result = row[0] + " <em>" +
                row[1] + "</em>";
                return result;
            },
            onItemSelect:function(el){
                location.href="dict.php?act=edit&id="+el.extra[1]
            }
        })
    })
</script>
    <h1>Словарь</h1>
    <p>Всего {$stats.cnt_g} граммем, {$stats.cnt_l} лемм, {$stats.cnt_f} форм в индексе ({$stats.cnt_r} ревизий не проверено).</p>
    <b>Поиск по словарю</b>
    <form action="{$web_prefix}/dict.php?act=lemmata" method="post">
    <input name="search_form" type="text" class="span3" id="form_search_input" placeholder="Введите слово...">
</form>
    <p><a href="{$web_prefix}/dict_history.php">Свежие правки</a></p>
    {if $user_permission_dict}
        <p><a href="?act=gram">Редактор граммем</a><br/>
        <a href="?act=gram_restr">Ограничения на граммемы</a></p>
        <p><a href="?act=lemmata">Редактор лемм</a><br/>
        <a href="?act=errata">Ошибки в словаре</a> ({$stats.cnt_v} ревизий не проверено)<br/>
        <a href="?act=pending">Токены, которые надо переразобрать</a></p>
        <a href="?act=absent">Top несловарных токенов</a></p>
        <p><button class="btn" onClick="location.href='?act=edit&amp;id=-1'">Добавить лемму</button></p>
    {else}
        <p><a href="?act=gram">Просмотр граммем</a><br/>
        <a href="?act=gram_restr">Ограничения на граммемы</a></p>
        <p><a href="?act=lemmata">Просмотр лемм</a><br/>
        <a href="?act=errata">Ошибки в словаре</a> ({$stats.cnt_v} ревизий не проверено)</p>
    {/if}
    <h2>Версия для скачивания</h2>
    <p>XML (<i class="icon-info-sign"></i> <a href="{$web_prefix}/export/dict/dict.opcorpora.xsd">XML Schema</a>), обновлён {$dl.dict.xml.updated}, см. <a href="{$web_prefix}/?page=export">описание формата</a></p>
    <ul>
    <li><a href="{$web_prefix}/files/export/dict/dict.opcorpora.xml.bz2">архив .bz2</a> ({$dl.dict.xml.bz2.size} Мб)</li>
    <li><a href="{$web_prefix}/files/export/dict/dict.opcorpora.xml.zip">архив .zip</a> ({$dl.dict.xml.zip.size} Мб)</li>
    </ul>
    <p>Plain text, обновлён {$dl.dict.txt.updated}</p>
    <ul>
    <li><a href="{$web_prefix}/files/export/dict/dict.opcorpora.txt.bz2">архив .bz2</a> ({$dl.dict.txt.bz2.size} Мб)</li>
    <li><a href="{$web_prefix}/files/export/dict/dict.opcorpora.txt.zip">архив .zip</a> ({$dl.dict.txt.zip.size} Мб)</li>
    </ul>
{/block}
