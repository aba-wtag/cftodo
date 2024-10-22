
<cfquery name="update">
    update tasks
    set
    name = '#form.name#'
    where id = #form.id#
</cfquery>

<cflocation url="index.cfm" addtoken="no">