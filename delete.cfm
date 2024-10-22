<cfquery name="delete">
    delete from tasks
    where id = #url.id#
</cfquery>

<cflocation url="index.cfm" addToken="no">